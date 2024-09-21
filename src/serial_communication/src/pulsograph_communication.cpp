// pulsograph_communication.cpp
#include <ros/ros.h>
#include <serial/serial.h>
#include <iostream>
#include <string.h>
#include <serial_communication/pulso_message.h>
#include "../include/serial_communication/pulsograph.h"
using namespace std;

string port;
int baudrate = 115200;
double com_freq = 30.0;
PULSO_DATA_UnData PulsoGraph;
int buffer_size = sizeof(PulsoGraph.buf);
serial_communication::pulso_message pm;

void data_transfer_process(PULSO_DATA_UnData PulsoGraph, serial_communication::pulso_message &pm);

//节点函数
int main(int argc, char **argv)
{
    ros::init(argc, argv, "pulsograph_communication");
    ros::NodeHandle node("~");
    ros::Publisher pub = node.advertise<serial_communication::pulso_message>("/Pulso_message", 1000);
    serial::Serial sp;
    serial::Timeout to = serial::Timeout::simpleTimeout(4);

    node.param("port",port,port);
    node.param("baudrate",baudrate,baudrate);
    node.param("com_freq",com_freq,com_freq);

    sp.setPort(port);
    sp.setBaudrate(baudrate);
    sp.setTimeout(to);

    try{
        //打开串口
        sp.open();
    }
    catch (serial::IOException &e){
        ROS_ERROR_STREAM("Unable to open port.");
        return -1;
    }

    //判断串口是否打开成功
    if (sp.isOpen()){
        // ROS_INFO_STREAM("/dev/ttyUSB0 is opened.");
         ROS_INFO_STREAM(port << " is opened.");
    }
    else{
        return -1;
    }

    //发送开始连续采集指令
    sp.write(start_collect, 4);

    uint8_t buffer[buffer_size];
    ros::Rate loop_rate(com_freq);

    //sp.flush();
    //sp.read(buffer, sizeof(buffer));
    while (ros::ok()){
        //获取缓冲区内的字节数,检测是否接收到数据
        size_t n = sp.available();
        if (n !=  0)
        {
            //读出数据
             size_t size_buffer = sp.read(buffer, sizeof(buffer));
            memcpy(PulsoGraph.buf, buffer,  size_buffer);
            ROS_INFO_STREAM("BufferSize=:    " <<    size_buffer);
            //数据转换
            data_transfer_process(PulsoGraph, pm);
            pub.publish(pm);
            ROS_INFO_STREAM("DATA Published !   ");
        }
        loop_rate.sleep();
    }

    //发送停止连续采集指令
    sp.write(stop_collect, 4);
    //关闭串口
    sp.flush();
    sp.close();
    return 0;
}

//数据转换处理函数
void data_transfer_process(PULSO_DATA_UnData PulsoGraph, serial_communication::pulso_message &pm)
{
    pm.ID = PulsoGraph.Data.address;
    pm.static_pressure_1 = PulsoGraph.Data.static_pressure_1;
    pm.static_pressure_2 = PulsoGraph.Data.static_pressure_2;
    pm.static_pressure_3 = PulsoGraph.Data.static_pressure_3;
    pm.dynamic_pulse_1 = PulsoGraph.Data.dynamic_pulse_1;
    pm.dynamic_pulse_2 = PulsoGraph.Data.dynamic_pulse_2;
    pm.dynamic_pulse_3 = PulsoGraph.Data.dynamic_pulse_3;
}


