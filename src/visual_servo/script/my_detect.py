# 导入需要的库
import os
import sys
from pathlib import Path
import numpy as np
import cv2
import torch

# 初始化目录
FILE = Path(__file__).resolve()
ROOT = FILE.parents[0]  # 定义YOLOv5的根目录
if str(ROOT) not in sys.path:
    sys.path.append(str(ROOT))  # 将YOLOv5的根目录添加到环境变量中（程序结束后删除）
ROOT = Path(os.path.relpath(ROOT, Path.cwd()))  # relative

from models.common import DetectMultiBackend
from utils.general import (LOGGER, check_img_size, non_max_suppression, scale_boxes, xyxy2xywh)
from utils.torch_utils import select_device, time_sync

# 导入letterbox
from utils.augmentations import letterbox

# weights = ROOT / 'runs/train/exp10/weights/best.pt'  # 权重文件地址   .pt文件
# source = ROOT / 'data/images'  # 测试数据文件(图片或视频)的保存路径
# data = ROOT / '../yolo_Sprite/Sprite.yaml'  # 标签文件地址   .yaml文件

weights = ROOT / 'yolov5s.pt'  # 权重文件地址   .pt文件
source = ROOT / 'data/images1'  # 测试数据文件(图片或视频)的保存路径
data = ROOT / 'data/coco128.yaml'  # 标签文件地址   .yaml文件

imgsz = (640, 640)  # 输入图片的大小 默认640(pixels),640*640
conf_thres = 0.45  # object置信度阈值 默认0.25  用在nms中
iou_thres = 0.5  # 做nms的iou阈值 默认0.45   用在nms中
max_det = 10  # 每张图片最多的目标数量  用在nms中,1000
device = '0'  # 设置代码执行的设备 cuda device, i.e. 0 or 0,1,2,3 or cpu
view_img = True  # show results
classes = None  # 在nms中是否是只保留某些特定的类 默认是None 就是所有类只要满足条件都可以保留 --class 0, or --class 0 2 3
agnostic_nms = False  # 进行nms是否也除去不同类别之间的框 默认False
augment = False  # 预测是否也要采用数据增强 TTA 默认False
visualize = False  # 特征图可视化 默认FALSE
half = False  # 是否使用半精度 Float16 推理 可以缩短推理时间 但是默认是False
dnn = False  # 使用OpenCV DNN进行ONNX推理

# 获取设备
device = select_device(device)

# 载入模型
model = DetectMultiBackend(weights, device=device, dnn=dnn, data=data)
stride, names, pt, jit, onnx, engine = model.stride, model.names, model.pt, model.jit, model.onnx, model.engine
imgsz = check_img_size(imgsz, s=stride)  # 检查图片尺寸

# Half
# 使用半精度 Float16 推理
half &= (pt or jit or onnx or engine) and device.type != 'cpu'  # FP16 supported on limited backends with CUDA
if pt or jit:
    model.model.half() if half else model.model.float()

bs = 1  # batch_size
model.warmup(imgsz=(1 if pt else bs, 3, *imgsz))  # warmup


def detect(img):
    # Run inference
    # 开始预测
    # bs = 1  # batch_size
    # model.warmup(imgsz=(1 if pt else bs, 3, *imgsz))  # warmup
    dt, seen = [0.0, 0.0, 0.0], 0
    t1 = time_sync()
    # 对图片进行处理
    im0 = img
    # Padded resize
    im = letterbox(im0, imgsz, stride, auto=pt)[0]
    # Convert
    im = im.transpose((2, 0, 1))[::-1]  # HWC to CHW, BGR to RGB
    im = np.ascontiguousarray(im)
    # t1 = time_sync()
    im = torch.from_numpy(im).to(device)
    im = im.half() if half else im.float()  # uint8 to fp16/32
    im /= 255  # 0 - 255 to 0.0 - 1.0
    if len(im.shape) == 3:
        im = im[None]  # expand for batch dim
    t2 = time_sync()
    dt[0] += t2 - t1

    # Inference
    # 预测
    pred = model(im, augment=augment, visualize=visualize)
    t3 = time_sync()
    dt[1] += t3 - t2

    # NMS
    pred = non_max_suppression(pred, conf_thres, iou_thres, classes, agnostic_nms, max_det=max_det)
    dt[2] += time_sync() - t3

    # 用于存放结果
    detections = []
    xywh_list = []

    # Process predictions
    for i, det in enumerate(pred):  # per image 每张图片
        seen += 1
        if len(det):
            # Rescale boxes from img_size to im0 size
            det[:, :4] = scale_boxes(im.shape[2:], det[:, :4], im0.shape).round()
            # Write results
            # 写入结果
            num = 0
            for *xyxy, conf, cls in reversed(det):
                xywh = (xyxy2xywh(torch.tensor(xyxy).view(1, 4))).view(-1).tolist()
                xywh = [round(x) for x in xywh]
                xywh = [xywh[0] - xywh[2] // 2, xywh[1] - xywh[3] // 2, xywh[2],
                        xywh[3]]  # 检测到目标位置，格式：（left，top，w，h）
                xywh_list.append(xywh)
                x1 = int(xyxy[0].item())
                y1 = int(xyxy[1].item())
                x2 = int(xyxy[2].item())
                y2 = int(xyxy[3].item())

                # print('bounding box is', x1, y1, x2, y2)  # 打印坐标

                cls = names[int(cls)]
                conf = float(conf)
                detections.append({'class': cls, 'conf': conf, 'position': xywh})
                #detections[0]['position'][0]
                # # 输出结果
                # for i in detections:
                #     print(i)

                # print(detections[num])
                # num += 1

                if view_img:
                    cv2.rectangle(img, (x1, y1), (x2 , y2), (128, 42, 42), 3)  # 画面，左上角坐标，右下角坐标，RGB颜色，厚度
                    result = cls + str(round(conf, 2))
                    cv2.putText(img, result, (x1, y1 - 10), cv2.FONT_HERSHEY_PLAIN, 2, (128, 42, 42),2)  # 画面，文本内容，位置，字体，字体大小，RGB颜色，厚度
                    #cv2.imshow("camera", img)
                    # cv2.waitKey(1000)  # 1 millisecond
            # for i in detections:
            #     print("hahaha:"+str(i['position']))
    # 推测的时间
    LOGGER.info(f'({t3 - t1:.3f}s)')
    cost_time = round(t3 - t2, 3)
    return detections, cost_time, img, xywh_list


if __name__ == "__main__":
    # path = 'G://Yolo_project//yolov5-master//data//images//111.jpg'
    # path = r"D:\D\PycharmProjectsv1\yolov5\data\images\20240418145312.png"
    path = r"/home/zhenruichen/yolov5-master/data/images/20240418145312.png"
    img = cv2.imread(path)
    # 传入一张图片
    detections, cost_time, img, xywh_list = detect(img)

    print(detections)
    cv2.imshow("camera", img)
    cv2.waitKey(10000)  # 1 millisecond


