#!/usr/bin/env python3
import pyrealsense2 as rs
import cv2
import numpy as np
import time
import threading
import os
import sys
import random
import my_detect
import queue
import rospy

#   定义全局变量
connect_device = []
pipeline_list = []
config_list = []


def camera_information():
    global connect_device
    global pipeline_list
    global config_list
    # get all realsense serial number
    for d in rs.context().devices:
        print('Found device: ',
              d.get_info(rs.camera_info.name), ' ',
              d.get_info(rs.camera_info.serial_number))
        if d.get_info(rs.camera_info.name).lower() != 'platform camera':
            connect_device.append(d.get_info(rs.camera_info.serial_number))
    # config realsense
    pipeline_list = [rs.pipeline() for i in range(len(connect_device))]
    config_list = [rs.config() for i in range(len(connect_device))]
    print(connect_device)
    print(config_list)
    print(pipeline_list)
    if len(connect_device) == 0:
        print("no device find!")
        exit()
    return connect_device, pipeline_list, config_list

class Realsense2():
    def __init__(self, camera_num, images_queue, detect_img_queue, camera_width=640, camera_height=480, camera_fps=30):
        self.depth_frame = None
        self.color_frame = None
        self.frame = None
        self.camera_width = camera_width
        self.camera_height = camera_height
        self.camera_fps = camera_fps
        self.camera_num = camera_num
        self.pipeline = None
        self.config = None
        # 图像对齐
        self.align = None
        # 用于暂停线程的标识
        self.__flag = threading.Event()
        self.__flag.set()  # 设置为True
        # 用于停止线程的标识
        self.__running = threading.Event()
        self.__running.set()  # 将running设置为True

        self.stopped = False
        self.is_pause = False

        # 创建锁对象
        self.lock = threading.Lock()

        # 获取的图像帧、相机内参、深度参数、彩色图、深度图、对齐帧中的depth帧与color帧
        self.frames = None
        self.intr = None
        self.depth_intrin = None
        self.color_image = None
        self.depth_image = None
        self.aligned_depth_frame = None
        self.aligned_color_frame = None
        self.images = None

        # 待检测的图像，目标位置、求目标平均深度的随机数范围以及目标位置列表
        self.detect_img = None
        self.xywh = None
        self.randnum = 24
        self.target_pos_list = []

        # 图像检测结果以及检测用时
        self.detections = None
        self.detect_time = None
        self.datanum = 0
        # 视频保存路径,结果保存文件，标记计时，计数标志，视频保存对象的开启
        self.video_camera_path = f'//home//jetson//PycharmProjects//yolov5//save_data//{str(time.strftime("%Y-%m-%d-%H-%M-%S",time.localtime()))}_camera.avi'
        self.video_detect_path = f'//home//jetson//PycharmProjects//yolov5//save_data//{str(time.strftime("%Y-%m-%d-%H-%M-%S",time.localtime()))}_detect.avi'
        self.record_file = open("result.txt", 'a')
        self.record_file.write("\n视频录制时间:" + str(time.strftime("%Y-%m-%d-%H-%M-%S", time.localtime())))
        self.t_last_write_time_flag = None
        self.t_now_write_time_flag = None
        self.t_writetime_num = 0
        self.avi = cv2.VideoWriter_fourcc(*'XVID')
        self.wr_camera = cv2.VideoWriter(self.video_camera_path, self.avi, self.camera_fps,
                                         (2 * self.camera_width, self.camera_height), isColor=True)  # 视频保存而建立对象
        self.wr_detect = cv2.VideoWriter(self.video_detect_path, self.avi, self.camera_fps,
                                         (self.camera_width, self.camera_height), isColor=True)

        # 检测时间及总体检测帧率
        self.detect_all_fps = None
        self.t_detect_end = None
        self.t_detect_begin = None

        # 存储检测及原始图像队列
        self.images_queue = images_queue
        self.detect_img_queue = detect_img_queue

    def camera_config(self):
        global connect_device
        global pipeline_list
        global config_list

        self.pipeline = pipeline_list[self.camera_num]
        self.config = config_list[self.camera_num]
        if isinstance(self.camera_num, int):#是否整数
            if len(connect_device) >= (self.camera_num + 1):  # one realsense
                self.config.enable_device(connect_device[self.camera_num])
                self.config.enable_stream(rs.stream.depth, self.camera_width, self.camera_height, rs.format.z16,
                                                  self.camera_fps)
                self.config.enable_stream(rs.stream.color, self.camera_width, self.camera_height, rs.format.bgr8,
                                                  self.camera_fps)
                self.pipeline.start(self.config)
                align_to = rs.stream.color  # 与color流对齐
                self.align = rs.align(align_to)
        else:
            print('camera num is not int type, please check!\n')
            exit()

    def rgb_image(self):
        # 获取锁
        self.lock.acquire()
        color_image = self.color_image
        # 释放锁
        self.lock.release()
        return color_image

    def depth_frame(self):
        # 获取锁
        self.lock.acquire()
        depth_image = self.depth_image
        # 释放锁
        self.lock.release()
        return depth_image

    def is_stop(self):
        # 获取锁
        self.lock.acquire()
        flag = self.stopped
        # 释放锁
        self.lock.release()
        return flag

    def start(self):
        self.camera_config()
        threading.Thread(target=self.update, args=()).start()

    def update(self):
        self.t_last_write_time_flag = time.time()
        while self.__running.isSet():
            if self.pipeline:
                self.__flag.wait()  # 为True时立即返回, 为False时阻塞直到内部的标识位为True后返回
                if self.stopped:
                    return
                self.t_detect_begin = time.time()
                self.get_aligned_images()  # 获取对齐的图像与相机内参

                if not self.depth_image.any() or not self.color_image.any():
                    continue
                self.dectshow()
                self.t_now_write_time_flag = time.time()
                if self.t_now_write_time_flag - self.t_last_write_time_flag > 20:
                    if self.target_pos_list:
                        for i in range(len(self.detections)):
                            if self.detections[i]['class'] == 'bottle':
                                # ser.flushInput()
                                # sleep(15)  # 起到一个延时的效果，这里如果不加上一个while True，程序执行一次就自动跳出了
                                self.record_file.write("\n第{0}次检测到目标物体：{1}，距离(m)：{2}".format(self.t_writetime_num + 1,
                                                                str(self.detections[i]['class']), str(self.target_pos_list[i])))
                    else:
                        self.record_file.write("\n第{0}次未检测到目标物体!".format(self.t_writetime_num + 1))
                    print("已正常写入数据!")
                    self.t_writetime_num += 1
                    self.t_last_write_time_flag = self.t_now_write_time_flag
                # Apply colormap on depth image (image must be converted to 8-bit per pixel first)
                depth_colormap = cv2.applyColorMap(cv2.convertScaleAbs(self.depth_image, alpha=0.03), cv2.COLORMAP_JET)
                # Stack both images horizontally
                self.images = np.hstack((self.color_image, depth_colormap))
                self.t_detect_end = time.time()
                self.detect_all_fps = int(1.0 / (self.t_detect_end - self.t_detect_begin))
                cv2.putText(self.detect_img, text="Camera FPS: {}".format(self.camera_fps), org=(50, 30),
                            fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=0.5, thickness=2,
                            lineType=cv2.LINE_AA, color=(0, 0, 0))
                cv2.putText(self.detect_img, text="Detect time: {}".format(self.detect_time), org=(50, 50),
                            fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=0.5, thickness=2,
                            lineType=cv2.LINE_AA, color=(0, 0, 0))
                cv2.putText(self.detect_img, text="All FPS: {}".format(self.detect_all_fps), org=(50, 70),
                            fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=0.5, thickness=2,
                            lineType=cv2.LINE_AA, color=(0, 0, 0))

                # save video
                self.wr_camera.write(self.images)  # 保存RGB图像帧
                self.wr_detect.write(self.detect_img)  # 保存基于灰度深度图

                # 加入队列
                # 获取锁
                if self.images_queue.empty():
                    # self.lock.acquire()
                    self.images_queue.put(self.images)
                    self.detect_img_queue.put(self.detect_img)
                    # 释放锁
                    # self.lock.release()
                # key = cv2.waitKey(1)
                # # Press esc or 'q' to close the image window
                # if key & 0xFF == ord('q') or key == 27:
                #     cv2.destroyAllWindows()
                #     break
            else:
                self.__flag.wait()  # 为True时立即返回, 为False时阻塞直到内部的标识位为True后返回
                print("The camera{} is not truly opened!!".format(self.camera_num))
                print(self.pipeline)

    def pause(self):
        self.__flag.clear()  # 设置为False, 让线程阻塞
        self.is_pause = True

    def resume(self):
        self.__flag.set()  # 设置为True, 让线程停止阻塞
        self.is_pause = False

    def stop(self):
        if self.is_pause:
            self.__flag.set()  # 将线程从暂停状态恢复, 如果已经暂停的话
        self.__running.clear()  # 设置为False
        # Stop streaming
        self.pipeline.stop()
        self.wr_detect.release()
        self.wr_camera.release()
        self.record_file.close()
        self.stopped = True
        print("camera exit sucessfully.")
        time.sleep(0.1)

    def get_aligned_images(self):
        self.frames = self.pipeline.wait_for_frames()  # 等待获取图像帧
        aligned_frames = self.align.process(self.frames)  # 获取对齐帧
        self.aligned_depth_frame = aligned_frames.get_depth_frame()  # 获取对齐帧中的depth帧
        self.aligned_color_frame = aligned_frames.get_color_frame()  # 获取对齐帧中的color帧
        self.color_frame = aligned_frames.get_color_frame()  # 获取对齐帧中的color帧

        ############### 相机参数的获取 #######################
        self.intr = self.aligned_color_frame.profile.as_video_stream_profile().intrinsics  # 获取相机内参
        self.depth_intrin = self.aligned_depth_frame.profile.as_video_stream_profile(
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

        self.depth_image = np.asanyarray(self.aligned_depth_frame.get_data())  # 深度图（默认16位）
        # depth_image_8bit = cv2.convertScaleAbs(depth_image, alpha=0.03)  # 深度图（8位）
        # depth_image_3d = np.dstack(
        #     (depth_image_8bit, depth_image_8bit, depth_image_8bit))  # 3通道深度图
        self.color_image = np.asanyarray(self.color_frame.get_data())  # RGB图

    def get_target_pos_in_camera(self):
        self.datanum += 1
        print(self.datanum)
        if self.xywh:
            self.target_pos_list = []
            # print("xywh:",xywh)
            for j in range(len(self.xywh)):
                distance_list = []
                mid_pos = [self.xywh[j][0] + self.xywh[j][2]//2, self.xywh[j][1] + self.xywh[j][3]//2] #确定索引深度的中心像素位置
                min_val = min(abs(self.xywh[j][2]), abs(self.xywh[j][3])) #确定深度搜索范围取平均
                for i in range(self.randnum):
                    bias = random.randint(-min_val//6, min_val//6)
                    dist = self.aligned_depth_frame.get_distance(int(mid_pos[0] + bias), int(mid_pos[1] + bias))#冒泡排序加中值滤波
                    # cv2.circle(frame, (int(mid_pos[0] + bias), int(mid_pos[1] + bias)), 4, (255,0,0), -1)
                    #print(int(mid_pos[1] + bias), int(mid_pos[0] + bias))
                    if dist:
                        distance_list.append(dist)
                if len(distance_list) != 0:
                    print(distance_list is True, np.mean(distance_list), len(distance_list))
                    distance_list = np.array(distance_list)
                    if len(distance_list) != 1:
                        distance_list = np.sort(distance_list)[len(distance_list)//2-len(distance_list)//4-1:len(distance_list)//2+len(distance_list)//4-1] #冒泡排序+中值滤波
                        average_distance = np.mean(distance_list)
                    else:
                        average_distance = distance_list[0]
                    target_xyz = rs.rs2_deproject_pixel_to_point(
                        self.depth_intrin, (mid_pos[0], mid_pos[1]), average_distance)  # 计算相机坐标系的xyz
                    target_xyz = np.round(np.array(target_xyz), 3)  # 转成3位小数
                    target_xyz = target_xyz.tolist()
                    cv2.circle(self.detect_img, (mid_pos[0], mid_pos[1]), 4, (255, 255, 255), 5)  # 标出中心点
                    cv2.putText(self.detect_img, str(target_xyz), (mid_pos[0] + 20, mid_pos[1] + 10), 0, 0.5,
                                [225, 255, 255], thickness=2, lineType=cv2.LINE_AA)  # 标出坐标
                    self.target_pos_list.append(target_xyz)
                else:
                    cv2.circle(self.detect_img, (mid_pos[0], mid_pos[1]), 4, (255, 255, 255), 5)  # 标出中心点
                    cv2.putText(self.detect_img, "no result", (mid_pos[0] + 20, mid_pos[1] + 10), 0, 0.5,
                                [225, 255, 255], thickness=2, lineType=cv2.LINE_AA)  # 标出坐标
                    target_xyz = [0, 0, 0]
                    self.target_pos_list.append(target_xyz)

    def dectshow(self):
        img = self.color_image.copy()
        self.detections, self.detect_time, self.detect_img, self.xywh = my_detect.detect(img)
        self.get_target_pos_in_camera()

        

if __name__ == '__main__':
    camera_information()
    # 存储检测及原始图像队列
    images_queue = queue.Queue(maxsize=1)
    detect_img_queue = queue.Queue(maxsize=1)
    camera0 = Realsense2(camera_num=0, images_queue=images_queue, detect_img_queue=detect_img_queue, camera_width=1280, camera_height=720, camera_fps=30)
    # camera1 = Realsense2(camera_num=1, camera_width=640, camera_height=480, camera_fps=30)
    camera0.start()
    time.sleep(5)
    # camera1.start()
    # start = time.time()
    # begin = endd = False
    key32_num = 0
    try:
        while True:
            # img1 = camera1.rgb_image()
            # if img0 is None or img1 is None:
            #     continue
            # print(img0)
            # print(img1)
            # cv2.imshow("img1", img1)
            # end = time.time()
            # print(end - start)
            # Show images
            if not detect_img_queue.empty() and not images_queue.empty():
                detect_img = detect_img_queue.get()
                detect_img_queue.task_done()
                images = images_queue.get()
                images_queue.task_done()
                cv2.imshow('detect_img', detect_img)
                cv2.namedWindow('RealSense', cv2.WINDOW_AUTOSIZE)
                cv2.imshow('RealSense', images)
            key = cv2.waitKey(1)
            if key == 32:
                if not camera0.is_pause:
                    print("stop")
                    camera0.pause()
                else:
                    print("begin")
                    camera0.resume()
            if key == 27:#ESC退出
                break
    finally:
        camera0.stop()
        # camera1.stop()
