import pyrealsense2 as rs
import numpy as np
import random
import my_detect
import cv2
import time

def get_aligned_images():
    frames = pipeline.wait_for_frames()  # 等待获取图像帧
    camera_fps = 30
    aligned_frames = align.process(frames)  # 获取对齐帧
    aligned_depth_frame = aligned_frames.get_depth_frame()  # 获取对齐帧中的depth帧
    color_frame = aligned_frames.get_color_frame()  # 获取对齐帧中的color帧

    ############### 相机参数的获取 #######################
    intr = color_frame.profile.as_video_stream_profile().intrinsics  # 获取相机内参
    depth_intrin = aligned_depth_frame.profile.as_video_stream_profile(
    ).intrinsics  # 获取深度参数（像素坐标系转相机坐标系会用到）
    '''camera_parameters = {'fx': intr.fx, 'fy': intr.fy,
                         'ppx': intr.ppx, 'ppy': intr.ppy,
                         'height': intr.height, 'width': intr.width,
                         'depth_scale': profile.get_device().first_depth_sensor().get_depth_scale()
                         }'''

    # 保存内参到本地
    # with open('./intrinsics.json', 'w') as fp:
    #json.dump(camera_parameters, fp)
    #######################################################

    depth_image = np.asanyarray(aligned_depth_frame.get_data())  # 深度图（默认16位）
    # depth_image_8bit = cv2.convertScaleAbs(depth_image, alpha=0.03)  # 深度图（8位）
    # depth_image_3d = np.dstack(
    #     (depth_image_8bit, depth_image_8bit, depth_image_8bit))  # 3通道深度图
    color_image = np.asanyarray(color_frame.get_data())  # RGB图

    # 返回相机内参、深度参数、彩色图、深度图、齐帧中的depth帧
    return intr, depth_intrin, color_image, depth_image, aligned_depth_frame, camera_fps

def get_target_pos_in_camera(detect_img, depth_intrin,xywh,aligned_depth_frame,randnum):
    if xywh:
        target_pos_list = []
        print("xywh:",xywh)
        for j in range(len(xywh)):
            distance_list = []
            mid_pos = [xywh[j][0] + xywh[j][2]//2, xywh[j][1] + xywh[j][3]//2] #确定索引深度的中心像素位置
            min_val = min(abs(xywh[j][2]), abs(xywh[j][3])) #确定深度搜索范围
            for i in range(randnum):
                bias = random.randint(-min_val//6, min_val//6)
                dist = aligned_depth_frame.get_distance(int(mid_pos[0] + bias), int(mid_pos[1] + bias))
                # cv2.circle(frame, (int(mid_pos[0] + bias), int(mid_pos[1] + bias)), 4, (255,0,0), -1)
                #print(int(mid_pos[1] + bias), int(mid_pos[0] + bias))
                if dist:
                    distance_list.append(dist)
            if len(distance_list) != 0:
                print(distance_list is not False, np.mean(distance_list), len(distance_list))
                distance_list = np.array(distance_list)
                if len(distance_list) != 1:
                    distance_list = np.sort(distance_list)[len(distance_list)//2-len(distance_list)//4-1:len(distance_list)//2+len(distance_list)//4-1] #冒泡排序+中值滤波
                    average_distance = np.mean(distance_list)
                else:
                    average_distance = distance_list[0]
                target_xyz = rs.rs2_deproject_pixel_to_point(
                    depth_intrin, (mid_pos[0], mid_pos[1]), average_distance)  # 计算相机坐标系的xyz
                target_xyz = np.round(np.array(target_xyz), 3)  # 转成3位小数
                target_xyz = target_xyz.tolist()
                cv2.circle(detect_img, (mid_pos[0], mid_pos[1]), 4, (255, 255, 255), 5)  # 标出中心点
                cv2.putText(detect_img, str(target_xyz), (mid_pos[0] + 20, mid_pos[1] + 10), 0, 0.5,
                            [225, 255, 255], thickness=2, lineType=cv2.LINE_AA)  # 标出坐标
                target_pos_list.append(target_xyz)
            else:
                cv2.circle(detect_img, (mid_pos[0], mid_pos[1]), 4, (255, 255, 255), 5)  # 标出中心点
                cv2.putText(detect_img, "no result", (mid_pos[0] + 20, mid_pos[1] + 10), 0, 0.5,
                            [225, 255, 255], thickness=2, lineType=cv2.LINE_AA)  # 标出坐标

        return target_pos_list

def dectshow(org_img, depth_intrin, aligned_depth_frame):
    img = org_img.copy()
    detections, time, newimg, xywh = my_detect.detect(img)
    get_target_pos_in_camera(newimg, depth_intrin, xywh, aligned_depth_frame, 24)

    return detections,newimg,time

if __name__ == "__main__":
    # Configure depth and color streams
    pipeline = rs.pipeline()
    config = rs.config()
    config.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)
    config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
    # Start streaming
    pipeline.start(config)
    align_to = rs.stream.color  # 与color流对齐
    align = rs.align(align_to)

    # 视频保存路径
    video_camera_path = f'G://python_project//yolov5-master//save_data//{str(time.strftime("%Y-%m-%d-%H-%M-%S",time.localtime()))}_camera.mp4'
    video_detect_path = f'G://python_project//yolov5-master//save_data//{str(time.strftime("%Y-%m-%d-%H-%M-%S",time.localtime()))}_detect.mp4'
    f = open("result.txt", 'a')
    f.write("\n视频录制时间:" + str(time.strftime("%Y-%m-%d-%H-%M-%S",time.localtime())))
    # 初始化参数
    fps, w, h = 30, 640, 480
    t_last_write_time_flag = 0
    mp4 = cv2.VideoWriter_fourcc(*'mp4v')  # 视频格式
    wr_camera = cv2.VideoWriter(video_camera_path, mp4, fps, (2*w, h), isColor=True)  # 视频保存而建立对象
    wr_detect = cv2.VideoWriter(video_detect_path, mp4, fps, (w, h), isColor=True)

    try:
        while True:
            # # Wait for a coherent pair of frames: depth and color
            # frames = pipeline.wait_for_frames()
            # depth_frame = frames.get_depth_frame()
            # color_frame = frames.get_color_frame()
            t_now_time_flag = time.time()
            t_begin = time.time()
            intr, depth_intrin, color_image, depth_image, aligned_depth_frame, camera_fps= get_aligned_images()  # 获取对齐的图像与相机内参

            if not depth_image.any() or not color_image.any():
                continue
            # # Convert images to numpy arrays
            # depth_image = np.asanyarray(depth_frame.get_data())
            # color_image = np.asanyarray(color_frame.get_data())
            detections,detect_img,detect_time = dectshow(color_image, depth_intrin, aligned_depth_frame)
            # Apply colormap on depth image (image must be converted to 8-bit per pixel first)
            depth_colormap = cv2.applyColorMap(cv2.convertScaleAbs(depth_image, alpha=0.03), cv2.COLORMAP_JET)
            # Stack both images horizontally
            images = np.hstack((color_image, depth_colormap))
            t_end = time.time()
            all_fps = int(1.0 / (t_end - t_begin))
            cv2.putText(detect_img, text="Camera FPS: {}".format(camera_fps), org=(50, 30),
                        fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=0.5, thickness=2,
                        lineType=cv2.LINE_AA, color=(0, 0, 0))
            cv2.putText(detect_img, text="Detect time: {}".format(detect_time), org=(50, 50),
                        fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=0.5, thickness=2,
                        lineType=cv2.LINE_AA, color=(0, 0, 0))
            cv2.putText(detect_img, text="All FPS: {}".format(all_fps), org=(50, 70),
                        fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=0.5, thickness=2,
                        lineType=cv2.LINE_AA, color=(0, 0, 0))
            cv2.imshow('detect_img', detect_img)

            # save video
            wr_camera.write(images)  # 保存RGB图像帧
            wr_detect.write(detect_img)  # 保存基于灰度深度图
            # Show images
            cv2.namedWindow('RealSense', cv2.WINDOW_AUTOSIZE)
            cv2.imshow('RealSense', images)
            key = cv2.waitKey(1)
            # Press esc or 'q' to close the image window
            if key & 0xFF == ord('q') or key == 27:
                cv2.destroyAllWindows()
                break
    finally:
        # Stop streaming
        pipeline.stop()
        wr_detect.release()
        wr_camera.release()