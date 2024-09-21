// serial_communication.cpp
#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <serial/serial.h>
#include <cmath>
#include <Eigen/Core>
#include <Eigen/Geometry>
#include <iostream>
#include <string.h>
//#include <obtain_angle/fingerpose.h>
#include <serial_communication/fingerpose.h>
#include <serial_communication/handpose.h>
#include <serial_communication/controler_message.h>
#include "../include/serial_communication/package.h"

using namespace std;

#define RadToDeg 57.2957795130

/*--------------------------Serial Communication------------------------*/

/* Control: only update IMU data */
//#define IMUDATA_ONLY

string port;
int baudrate = 115200;
double com_freq = 30.0;

Tx_Controler_UnData         Command;
Rx_Controler_UnData         ControlerData;
Rx_Controler_UnData_IMU     ControlerData_IMU;

#ifdef IMUDATA_ONLY
int buffer_size = sizeof(ControlerData_IMU.buf);
serial_communication::hand_imu cm;
serial_communication::fingerpose fp;
//obtain_angle::fingerpose fp;      //手指位姿对象
#else
//int buffer_size = sizeof(ControlerData.buf);
int buffer_size = sizeof(ControlerData_IMU.buf);
serial_communication::controler_message cm;
serial_communication::fingerpose fp;
serial_communication::handpose hp;
#endif

void data_transfer_process(Rx_Controler_UnData ControlerData, serial_communication::controler_message &cm);
void data_transfer_pressure(Rx_Controler_UnData ControlerData, serial_communication::controler_message &cm);
void data_transfer_egain(Rx_Controler_UnData ControlerData, serial_communication::controler_message &cm);
void data_transfer_force(Rx_Controler_UnData ControlerData, serial_communication::controler_message &cm);
void data_transfer_imu(Rx_Controler_UnData ControlerData, serial_communication::controler_message &cm);

void TF_publish(void);

/*--------------------------TF Culculate------------------------*/

tf::Quaternion  PIP_Q, DIP_Q, MCP_Q, PALM_Q;  //位姿四元数 默认顺序：x, y, z, w
tf::Quaternion  MCP_PALM, PIP_MCP, DIP_PIP;
tf::Matrix3x3   PALM_W, MCP_W, PIP_W, DIP_W;
tf::Matrix3x3   PALM_W_inv, MCP_W_inv, PIP_W_inv;
tf::Matrix3x3   MCP_PALM_R, PIP_MCP_R, DIP_PIP_R;

// Eigen::Quaterniond MCP_Origin, PIP_Origin, DIP_Origin;
// Eigen::Quaterniond PIP_MCP_Q, DIP_PIP_Q;
//Eigen::Matrix3d MCP_W, PIP_W, DIP_W;
//Eigen::Matrix3d MCP_W_inv, PIP_W_inv;
//Eigen::Matrix3d PIP_MCP_R, DIP_PIP_R;



//节点函数
int main(int argc, char **argv)
{
    ros::init(argc, argv, "serial_communication");
    ros::NodeHandle node("~");
#ifdef IMUDATA_ONLY
    ros::Publisher pub = node.advertise<serial_communication::hand_imu>("/Controler_message", 1000);
#else
    ros::Publisher pub = node.advertise<serial_communication::controler_message>("/Controler_message", 1000);
#endif
    serial::Serial sp;
    serial::Timeout to = serial::Timeout::simpleTimeout(6);

    //创建publisher，topic名为Fingerpose，消息类型obtain_angle::fingerpose，队列长度1000
    //ros::Publisher pub = node.advertise<obtain_angle::fingerpose>("Fingerpose", 1000);
    ros::Publisher pubfp = node.advertise<serial_communication::fingerpose>("Fingerpose_serial", 1000);
    ros::Publisher pubhp = node.advertise<serial_communication::handpose>("Handpose_serial", 1000);

//    obtain_angle::fingerpose fp;      //手指位姿对象

    /* TF transform */
    tf::TransformBroadcaster br;              //Broudcaster
    tf::Transform transform;                  //变换
    tf::StampedTransform s_transform;         //带时间戳的变换
    tf::TransformListener lr;                 //Listener

    /* Set Serial Port */
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

    uint8_t buffer[buffer_size];
    ros::Rate loop_rate(com_freq);

    //sp.flush();
    //sp.read(buffer, sizeof(buffer));
    while (ros::ok()){
        //获取缓冲区内的字节数,检测是否接收到数据
        size_t n = sp.available();
        if (n !=  0)
        {
#ifdef IMUDATA_ONLY
            //读出数据
             size_t size_buffer = sp.read(buffer, sizeof(buffer));
            memcpy(ControlerData_IMU.buf, buffer,  size_buffer);
            ROS_INFO_STREAM("BufferSize=:    " <<    size_buffer);
            //校验
            uint8_t cheksum = 0;
            for (int i = 0; i < size_buffer-4; i++)
                cheksum += ControlerData_IMU.buf[i];
            if (cheksum == ControlerData_IMU.Data.checkSum) {
                ROS_INFO_STREAM("DATA_STAMP=:    " << ControlerData_IMU.Data.time);
                //数据转换
                data_transfer_imu(ControlerData_IMU, cm);
                pub.publish(cm);
                ROS_INFO_STREAM("DATA Published !   ");
            }
            else {
                ROS_ERROR_STREAM("DATA ERROR !   ");
            }  
#else
            //读出数据
             size_t size_buffer = sp.read(buffer, sizeof(buffer));
            memcpy(ControlerData.buf, buffer,  size_buffer);
            ROS_INFO_STREAM("BufferSize=:    " <<    size_buffer);
            //校验
            uint8_t cheksum = 0;
            for (int i = 0; i < size_buffer-4; i++)
                cheksum += ControlerData.buf[i];
            if (cheksum == ControlerData.Data.checkSum) {
                ROS_INFO_STREAM("DATA_STAMP=:    " << ControlerData.Data.time);
                //数据转换
                data_transfer_process(ControlerData, cm);
                //pub.publish(cm);
                ROS_INFO_STREAM("DATA Published !   ");
            }
            else {
                ROS_ERROR_STREAM("DATA ERROR !   ");
            }  
#endif 
        }


/*------------------------------------ TF Calculate and Publish -------------------------------*/
        double roll, pitch, yaw;
/*----------PALM----------*/
        PALM_Q.setX(cm.IMU_Data.PALM.q0);   PALM_Q.setY(cm.IMU_Data.PALM.q1);
        PALM_Q.setZ(cm.IMU_Data.PALM.q2);   PALM_Q.setW(cm.IMU_Data.PALM.q3);
        PALM_W.setRotation(PALM_Q);
        PALM_W_inv = PALM_W.inverse();
        transform.setOrigin( tf::Vector3(0.0, 1.0, 0.0) );    //初始化Vector3:TF中定义的xyz
        transform.setRotation(PALM_Q);
        br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "PALM"));
        /* RPY */
        tf::Matrix3x3(PALM_Q).getRPY(roll, pitch, yaw);
        cm.IMU_Data.PALM.roll = roll * RadToDeg;
        cm.IMU_Data.PALM.pitch = pitch * RadToDeg;
        cm.IMU_Data.PALM.yaw = yaw * RadToDeg;
/*----------THUMB----------*/
        /* MCP */
        MCP_Q.setX(cm.IMU_Data.THUMB.MCP.q0);   MCP_Q.setY(cm.IMU_Data.THUMB.MCP.q1);
        MCP_Q.setZ(cm.IMU_Data.THUMB.MCP.q2);   MCP_Q.setW(cm.IMU_Data.THUMB.MCP.q3);
        MCP_W.setRotation(MCP_Q);
        MCP_W_inv = MCP_W.inverse();
        MCP_PALM_R = PALM_W_inv * MCP_W;
        MCP_PALM_R.getRotation(MCP_PALM);

        transform.setOrigin( tf::Vector3(-0.5, -1.0, 0.0) );    //初始化Vector3:TF中定义的xyz
        transform.setRotation(MCP_PALM);
        br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "PALM", "THUMB_MCP_PALM"));
        // /* MCP in World frame */
        // transform.setOrigin( tf::Vector3(-0.5, 0.0, 0.0) );    //初始化Vector3:TF中定义的xyz
        // transform.setRotation(MCP_Q);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "THUMB_MCP"));
        
        // /* PIP */
        // PIP_Q.setX(cm.IMU_Data.THUMB.PIP.q0);   PIP_Q.setY(cm.IMU_Data.THUMB.PIP.q1);
        // PIP_Q.setZ(cm.IMU_Data.THUMB.PIP.q2);   PIP_Q.setW(cm.IMU_Data.THUMB.PIP.q3);
        // PIP_W.setRotation(PIP_Q);
        // PIP_W_inv = PIP_W.inverse();
        // PIP_MCP_R = MCP_W_inv * PIP_W;
        // PIP_MCP_R.getRotation(PIP_MCP);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );
        // transform.setRotation(PIP_MCP);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "THUMB_MCP_PALM", "THUMB_PIP_MCP"));

        // /* PIP in World frame */
        // // transform.setOrigin( tf::Vector3(0.0, 0.5, 0.0) );
        // // transform.setRotation(PIP_Q);
        // // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "PIP"));

        // /* DIP */
        // DIP_Q.setX(cm.IMU_Data.THUMB.DIP.q0);   DIP_Q.setY(cm.IMU_Data.THUMB.DIP.q1);
        // DIP_Q.setZ(cm.IMU_Data.THUMB.DIP.q2);   DIP_Q.setW(cm.IMU_Data.THUMB.DIP.q3);
        // DIP_W.setRotation(DIP_Q);
        // DIP_PIP_R = PIP_W_inv * DIP_W;
        // DIP_PIP_R.getRotation(DIP_PIP);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );
        // transform.setRotation(DIP_PIP);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "THUMB_PIP_MCP", "THUMB_DIP_PIP"));

        //  /* DIP in World frame */
        // // transform.setOrigin( tf::Vector3(0.0, 0.5, 0.0) );
        // // transform.setRotation(DIP_Q);
        // // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "DIP"));

        // /* RPY */
        tf::Matrix3x3(MCP_Q).getRPY(roll, pitch, yaw);
        cm.IMU_Data.THUMB.MCP.roll = roll * RadToDeg;
        cm.IMU_Data.THUMB.MCP.pitch = pitch * RadToDeg;
        cm.IMU_Data.THUMB.MCP.yaw = yaw * RadToDeg;

        // tf::Matrix3x3(PIP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.THUMB.PIP.roll = roll * RadToDeg;
        // cm.IMU_Data.THUMB.PIP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.THUMB.PIP.yaw = yaw * RadToDeg;

        // tf::Matrix3x3(DIP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.THUMB.DIP.roll = roll * RadToDeg;
        // cm.IMU_Data.THUMB.DIP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.THUMB.DIP.yaw = yaw * RadToDeg;

        // /* hand pose */
        // tf::Matrix3x3(MCP_PALM).getRPY(roll, pitch, yaw);
        // hp.THUMB.YAW_MCP.x = roll * RadToDeg;
        // hp.THUMB.YAW_MCP.y = pitch * RadToDeg;
        // hp.THUMB.YAW_MCP.z = yaw * RadToDeg;
        // tf::Matrix3x3(PIP_MCP).getRPY(roll, pitch, yaw);
        // hp.THUMB.YAW_PIP.x = roll * RadToDeg;
        // hp.THUMB.YAW_PIP.y = pitch * RadToDeg;
        // hp.THUMB.YAW_PIP.z = yaw * RadToDeg;
        // tf::Matrix3x3(DIP_PIP).getRPY(roll, pitch, yaw);
        // hp.THUMB.YAW_DIP.x = roll * RadToDeg;
        // hp.THUMB.YAW_DIP.y = pitch * RadToDeg;
        // hp.THUMB.YAW_DIP.z = yaw * RadToDeg;


/*----------INDEX----------*/
        // /* MCP */
        // MCP_Q.setX(cm.IMU_Data.INDEX.MCP.q0);   MCP_Q.setY(cm.IMU_Data.INDEX.MCP.q1);
        // MCP_Q.setZ(cm.IMU_Data.INDEX.MCP.q2);   MCP_Q.setW(cm.IMU_Data.INDEX.MCP.q3);
        // MCP_W.setRotation(MCP_Q);
        // MCP_W_inv = MCP_W.inverse();
        // MCP_PALM_R = PALM_W_inv * MCP_W;
        // MCP_PALM_R.getRotation(MCP_PALM);

        // transform.setOrigin( tf::Vector3(0.3, -0.5, 0.0) );    //初始化Vector3:TF中定义的xyz
        // transform.setRotation(MCP_PALM);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "PALM", "INDEX_MCP_PALM"));
        // /* MCP in World frame */
        // // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );    //初始化Vector3:TF中定义的xyz
        // // transform.setRotation(MCP_Q);
        // // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "INDEX_MCP"));
        
        // /* PIP */
        // PIP_Q.setX(cm.IMU_Data.INDEX.PIP.q0);   PIP_Q.setY(cm.IMU_Data.INDEX.PIP.q1);
        // PIP_Q.setZ(cm.IMU_Data.INDEX.PIP.q2);   PIP_Q.setW(cm.IMU_Data.INDEX.PIP.q3);
        // PIP_W.setRotation(PIP_Q);
        // PIP_W_inv = PIP_W.inverse();
        // PIP_MCP_R = MCP_W_inv * PIP_W;
        // PIP_MCP_R.getRotation(PIP_MCP);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );
        // transform.setRotation(PIP_MCP);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "INDEX_MCP_PALM", "INDEX_PIP_MCP"));

        // /* DIP */
        // DIP_Q.setX(cm.IMU_Data.INDEX.DIP.q0);   DIP_Q.setY(cm.IMU_Data.INDEX.DIP.q1);
        // DIP_Q.setZ(cm.IMU_Data.INDEX.DIP.q2);   DIP_Q.setW(cm.IMU_Data.INDEX.DIP.q3);
        // DIP_W.setRotation(DIP_Q);
        // DIP_PIP_R = PIP_W_inv * DIP_W;
        // DIP_PIP_R.getRotation(DIP_PIP);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );
        // transform.setRotation(DIP_PIP);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "INDEX_PIP_MCP", "INDEX_DIP_PIP"));

        // /* RPY */
        // tf::Matrix3x3(MCP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.INDEX.MCP.roll = roll * RadToDeg;
        // cm.IMU_Data.INDEX.MCP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.INDEX.MCP.yaw = yaw * RadToDeg;

        // tf::Matrix3x3(PIP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.INDEX.PIP.roll = roll * RadToDeg;
        // cm.IMU_Data.INDEX.PIP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.INDEX.PIP.yaw = yaw * RadToDeg;

        // tf::Matrix3x3(DIP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.INDEX.DIP.roll = roll * RadToDeg;
        // cm.IMU_Data.INDEX.DIP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.INDEX.DIP.yaw = yaw * RadToDeg;

        // /* hand pose */
        // tf::Matrix3x3(MCP_PALM).getRPY(roll, pitch, yaw);
        // hp.INDEX.YAW_MCP.x = roll * RadToDeg;
        // hp.INDEX.YAW_MCP.y = pitch * RadToDeg;
        // hp.INDEX.YAW_MCP.z = yaw * RadToDeg;
        // tf::Matrix3x3(PIP_MCP).getRPY(roll, pitch, yaw);
        // hp.INDEX.YAW_PIP.x = roll * RadToDeg;
        // hp.INDEX.YAW_PIP.y = pitch * RadToDeg;
        // hp.INDEX.YAW_PIP.z = yaw * RadToDeg;
        // tf::Matrix3x3(DIP_PIP).getRPY(roll, pitch, yaw);
        // hp.INDEX.YAW_DIP.x = roll * RadToDeg;
        // hp.INDEX.YAW_DIP.y = pitch * RadToDeg;
        // hp.INDEX.YAW_DIP.z = yaw * RadToDeg;

/*----------MIDDLE----------*/
        // /* MCP */
        // MCP_Q.setX(cm.IMU_Data.MIDDLE.MCP.q0);   MCP_Q.setY(cm.IMU_Data.MIDDLE.MCP.q1);
        // MCP_Q.setZ(cm.IMU_Data.MIDDLE.MCP.q2);   MCP_Q.setW(cm.IMU_Data.MIDDLE.MCP.q3);
        // MCP_W.setRotation(MCP_Q);
        // MCP_W_inv = MCP_W.inverse();
        // MCP_PALM_R = PALM_W_inv * MCP_W;
        // MCP_PALM_R.getRotation(MCP_PALM);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );    //初始化Vector3:TF中定义的xyz
        // transform.setRotation(MCP_PALM);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "PALM", "MIDDLE_MCP_PALM"));
        // /* MCP in World frame */
        // // transform.setOrigin( tf::Vector3(1.0, 0.0, 0.0) );    //初始化Vector3:TF中定义的xyz
        // // transform.setRotation(MCP_Q);
        // // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "MIDDLE_MCP"));
        
        // /* PIP */
        // PIP_Q.setX(cm.IMU_Data.MIDDLE.PIP.q0);   PIP_Q.setY(cm.IMU_Data.MIDDLE.PIP.q1);
        // PIP_Q.setZ(cm.IMU_Data.MIDDLE.PIP.q2);   PIP_Q.setW(cm.IMU_Data.MIDDLE.PIP.q3);
        // PIP_W.setRotation(PIP_Q);
        // PIP_W_inv = PIP_W.inverse();
        // PIP_MCP_R = MCP_W_inv * PIP_W;
        // PIP_MCP_R.getRotation(PIP_MCP);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );
        // transform.setRotation(PIP_MCP);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "MIDDLE_MCP_PALM", "MIDDLE_PIP_MCP"));

        // /* DIP */
        // DIP_Q.setX(cm.IMU_Data.MIDDLE.DIP.q0);   DIP_Q.setY(cm.IMU_Data.MIDDLE.DIP.q1);
        // DIP_Q.setZ(cm.IMU_Data.MIDDLE.DIP.q2);   DIP_Q.setW(cm.IMU_Data.MIDDLE.DIP.q3);
        // DIP_W.setRotation(DIP_Q);
        // DIP_PIP_R = PIP_W_inv * DIP_W;
        // DIP_PIP_R.getRotation(DIP_PIP);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );
        // transform.setRotation(DIP_PIP);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "MIDDLE_PIP_MCP", "MIDDLE_DIP_PIP"));

        // /* RPY */
        // tf::Matrix3x3(MCP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.MIDDLE.MCP.roll = roll * RadToDeg;
        // cm.IMU_Data.MIDDLE.MCP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.MIDDLE.MCP.yaw = yaw * RadToDeg;

        // tf::Matrix3x3(PIP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.MIDDLE.PIP.roll = roll * RadToDeg;
        // cm.IMU_Data.MIDDLE.PIP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.MIDDLE.PIP.yaw = yaw * RadToDeg;

        // tf::Matrix3x3(DIP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.MIDDLE.DIP.roll = roll * RadToDeg;
        // cm.IMU_Data.MIDDLE.DIP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.MIDDLE.DIP.yaw = yaw * RadToDeg;

        // /* hand pose */
        // tf::Matrix3x3(MCP_PALM).getRPY(roll, pitch, yaw);
        // hp.MIDDLE.YAW_MCP.x = roll * RadToDeg;
        // hp.MIDDLE.YAW_MCP.y = pitch * RadToDeg;
        // hp.MIDDLE.YAW_MCP.z = yaw * RadToDeg;
        // tf::Matrix3x3(PIP_MCP).getRPY(roll, pitch, yaw);
        // hp.MIDDLE.YAW_PIP.x = roll * RadToDeg;
        // hp.MIDDLE.YAW_PIP.y = pitch * RadToDeg;
        // hp.MIDDLE.YAW_PIP.z = yaw * RadToDeg;
        // tf::Matrix3x3(DIP_PIP).getRPY(roll, pitch, yaw);
        // hp.MIDDLE.YAW_DIP.x = roll * RadToDeg;
        // hp.MIDDLE.YAW_DIP.y = pitch * RadToDeg;
        // hp.MIDDLE.YAW_DIP.z = yaw * RadToDeg;

/*----------RING----------*/
        // /* MCP */
        // MCP_Q.setX(cm.IMU_Data.RING.MCP.q0);   MCP_Q.setY(cm.IMU_Data.RING.MCP.q1);
        // MCP_Q.setZ(cm.IMU_Data.RING.MCP.q2);   MCP_Q.setW(cm.IMU_Data.RING.MCP.q3);
        // MCP_W.setRotation(MCP_Q);
        // MCP_W_inv = MCP_W.inverse();
        // MCP_PALM_R = PALM_W_inv * MCP_W;
        // MCP_PALM_R.getRotation(MCP_PALM);

        // transform.setOrigin( tf::Vector3(0.3, 0.5, 0.0) );    //初始化Vector3:TF中定义的xyz
        // transform.setRotation(MCP_PALM);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "PALM", "RING_MCP_PALM"));
        // /* MCP in World frame */
        // // transform.setOrigin( tf::Vector3(1.5, 0.0, 0.0) );    //初始化Vector3:TF中定义的xyz
        // // transform.setRotation(MCP_Q);
        // // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "RING_MCP"));
        
        // /* PIP */
        // PIP_Q.setX(cm.IMU_Data.RING.PIP.q0);   PIP_Q.setY(cm.IMU_Data.RING.PIP.q1);
        // PIP_Q.setZ(cm.IMU_Data.RING.PIP.q2);   PIP_Q.setW(cm.IMU_Data.RING.PIP.q3);
        // PIP_W.setRotation(PIP_Q);
        // PIP_W_inv = PIP_W.inverse();
        // PIP_MCP_R = MCP_W_inv * PIP_W;
        // PIP_MCP_R.getRotation(PIP_MCP);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );
        // transform.setRotation(PIP_MCP);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "RING_MCP_PALM", "RING_PIP_MCP"));

        // /* DIP */
        // DIP_Q.setX(cm.IMU_Data.RING.DIP.q0);   DIP_Q.setY(cm.IMU_Data.RING.DIP.q1);
        // DIP_Q.setZ(cm.IMU_Data.RING.DIP.q2);   DIP_Q.setW(cm.IMU_Data.RING.DIP.q3);
        // DIP_W.setRotation(DIP_Q);
        // DIP_PIP_R = PIP_W_inv * DIP_W;
        // DIP_PIP_R.getRotation(DIP_PIP);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );
        // transform.setRotation(DIP_PIP);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "RING_PIP_MCP", "RING_DIP_PIP"));

        // /* RPY */
        // tf::Matrix3x3(MCP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.RING.MCP.roll = roll * RadToDeg;
        // cm.IMU_Data.RING.MCP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.RING.MCP.yaw = yaw * RadToDeg;

        // tf::Matrix3x3(PIP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.RING.PIP.roll = roll * RadToDeg;
        // cm.IMU_Data.RING.PIP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.RING.PIP.yaw = yaw * RadToDeg;

        // tf::Matrix3x3(DIP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.RING.DIP.roll = roll * RadToDeg;
        // cm.IMU_Data.RING.DIP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.RING.DIP.yaw = yaw * RadToDeg;

        // /* hand pose */
        // tf::Matrix3x3(MCP_PALM).getRPY(roll, pitch, yaw);
        // hp.RING.YAW_MCP.x = roll * RadToDeg;
        // hp.RING.YAW_MCP.y = pitch * RadToDeg;
        // hp.RING.YAW_MCP.z = yaw * RadToDeg;
        // tf::Matrix3x3(PIP_MCP).getRPY(roll, pitch, yaw);
        // hp.RING.YAW_PIP.x = roll * RadToDeg;
        // hp.RING.YAW_PIP.y = pitch * RadToDeg;
        // hp.RING.YAW_PIP.z = yaw * RadToDeg;
        // tf::Matrix3x3(DIP_PIP).getRPY(roll, pitch, yaw);
        // hp.RING.YAW_DIP.x = roll * RadToDeg;
        // hp.RING.YAW_DIP.y = pitch * RadToDeg;
        // hp.RING.YAW_DIP.z = yaw * RadToDeg;
        

/*----------LITTLE----------*/
        // /* MCP */
        // MCP_Q.setX(cm.IMU_Data.LITTLE.MCP.q0);   MCP_Q.setY(cm.IMU_Data.LITTLE.MCP.q1);
        // MCP_Q.setZ(cm.IMU_Data.LITTLE.MCP.q2);   MCP_Q.setW(cm.IMU_Data.LITTLE.MCP.q3);
        // MCP_W.setRotation(MCP_Q);
        // MCP_W_inv = MCP_W.inverse();
        // MCP_PALM_R = PALM_W_inv * MCP_W;
        // MCP_PALM_R.getRotation(MCP_PALM);

        // transform.setOrigin( tf::Vector3(0.0, 1.0, 0.0) );    //初始化Vector3:TF中定义的xyz
        // transform.setRotation(MCP_PALM);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "PALM", "LITTLE_MCP_PALM"));
        // /* MCP in World frame */
        // // transform.setOrigin( tf::Vector3(2.0, 0.0, 0.0) );    //初始化Vector3:TF中定义的xyz
        // // transform.setRotation(MCP_Q);
        // // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "LITTLE_MCP"));
        
        // /* PIP */
        // PIP_Q.setX(cm.IMU_Data.LITTLE.PIP.q0);   PIP_Q.setY(cm.IMU_Data.LITTLE.PIP.q1);
        // PIP_Q.setZ(cm.IMU_Data.LITTLE.PIP.q2);   PIP_Q.setW(cm.IMU_Data.LITTLE.PIP.q3);
        // PIP_W.setRotation(PIP_Q);
        // PIP_W_inv = PIP_W.inverse();
        // PIP_MCP_R = MCP_W_inv * PIP_W;
        // PIP_MCP_R.getRotation(PIP_MCP);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );
        // transform.setRotation(PIP_MCP);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "LITTLE_MCP_PALM", "LITTLE_PIP_MCP"));

        // /* DIP */
        // DIP_Q.setX(cm.IMU_Data.LITTLE.DIP.q0);   DIP_Q.setY(cm.IMU_Data.LITTLE.DIP.q1);
        // DIP_Q.setZ(cm.IMU_Data.LITTLE.DIP.q2);   DIP_Q.setW(cm.IMU_Data.LITTLE.DIP.q3);
        // DIP_W.setRotation(DIP_Q);
        // DIP_PIP_R = PIP_W_inv * DIP_W;
        // DIP_PIP_R.getRotation(DIP_PIP);

        // transform.setOrigin( tf::Vector3(0.5, 0.0, 0.0) );
        // transform.setRotation(DIP_PIP);
        // br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "LITTLE_PIP_MCP", "LITTLE_DIP_PIP"));

        // /* RPY */
        // tf::Matrix3x3(MCP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.LITTLE.MCP.roll = roll * RadToDeg;
        // cm.IMU_Data.LITTLE.MCP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.LITTLE.MCP.yaw = yaw * RadToDeg;

        // tf::Matrix3x3(PIP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.LITTLE.PIP.roll = roll * RadToDeg;
        // cm.IMU_Data.LITTLE.PIP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.LITTLE.PIP.yaw = yaw * RadToDeg;

        // tf::Matrix3x3(DIP_Q).getRPY(roll, pitch, yaw);
        // cm.IMU_Data.LITTLE.DIP.roll = roll * RadToDeg;
        // cm.IMU_Data.LITTLE.DIP.pitch = pitch * RadToDeg;
        // cm.IMU_Data.LITTLE.DIP.yaw = yaw * RadToDeg;

        // /* hand pose */
        // tf::Matrix3x3(MCP_PALM).getRPY(roll, pitch, yaw);
        // hp.LITTLE.YAW_MCP.x = roll * RadToDeg;
        // hp.LITTLE.YAW_MCP.y = pitch * RadToDeg;
        // hp.LITTLE.YAW_MCP.z = yaw * RadToDeg;
        // tf::Matrix3x3(PIP_MCP).getRPY(roll, pitch, yaw);
        // hp.LITTLE.YAW_PIP.x = roll * RadToDeg;
        // hp.LITTLE.YAW_PIP.y = pitch * RadToDeg;
        // hp.LITTLE.YAW_PIP.z = yaw * RadToDeg;
        // tf::Matrix3x3(DIP_PIP).getRPY(roll, pitch, yaw);
        // hp.LITTLE.YAW_DIP.x = roll * RadToDeg;
        // hp.LITTLE.YAW_DIP.y = pitch * RadToDeg;
        // hp.LITTLE.YAW_DIP.z = yaw * RadToDeg;



/*------------------------------------ Hand Joint Pose Calculate -------------------------------*/
        
        /* euler angle to joint angle */

        // hp.THUMB.YAW_DIP.x = cm.IMU_Data.THUMB.DIP.roll - cm.IMU_Data.THUMB.PIP.roll;
        // hp.THUMB.YAW_DIP.y = cm.IMU_Data.THUMB.DIP.pitch - cm.IMU_Data.THUMB.PIP.pitch;
        // hp.THUMB.YAW_DIP.z = cm.IMU_Data.THUMB.DIP.yaw - cm.IMU_Data.THUMB.PIP.yaw;

        // hp.THUMB.YAW_PIP.x = cm.IMU_Data.THUMB.PIP.roll - cm.IMU_Data.THUMB.MCP.roll;
        // hp.THUMB.YAW_PIP.y = cm.IMU_Data.THUMB.PIP.pitch - cm.IMU_Data.THUMB.MCP.pitch;
        // hp.THUMB.YAW_PIP.z = cm.IMU_Data.THUMB.PIP.yaw - cm.IMU_Data.THUMB.MCP.yaw;

        //pubfp.publish(fp);

        pub.publish(cm);
        pubhp.publish(hp);


        loop_rate.sleep();
    }

    //关闭串口
    sp.flush();
    sp.close();
    return 0;
}

//整手姿态计算与发布
void TF_publish(void)
{


}



//数据转换处理函数
void data_transfer_process(Rx_Controler_UnData ControlerData, serial_communication::controler_message &cm)
{
    cm.ID = ControlerData.Data.ID;
    cm.time = ControlerData.Data.time;
    data_transfer_pressure(ControlerData, cm);
    // data_transfer_egain(ControlerData, cm);

    data_transfer_imu(ControlerData, cm);

    // data_transfer_force(ControlerData, cm);
}

void data_transfer_pressure(Rx_Controler_UnData ControlerData, serial_communication::controler_message &cm)
{
    cm.Pressure_Data.THUMB1.IP = ControlerData.Data.Pressure_Data[0];
    cm.Pressure_Data.THUMB1.MCPB = ControlerData.Data.Pressure_Data[1];
    cm.Pressure_Data.THUMB1.MCPAL = ControlerData.Data.Pressure_Data[2];
    cm.Pressure_Data.THUMB1.MCPAR = ControlerData.Data.Pressure_Data[3];
    cm.Pressure_Data.INDEX.IP = ControlerData.Data.Pressure_Data[4];
    cm.Pressure_Data.INDEX.MCPB = ControlerData.Data.Pressure_Data[5];
    cm.Pressure_Data.INDEX.MCPAL = ControlerData.Data.Pressure_Data[6];
    cm.Pressure_Data.INDEX.MCPAR = ControlerData.Data.Pressure_Data[7];
    cm.Pressure_Data.MIDDLE.IP = ControlerData.Data.Pressure_Data[8];
    cm.Pressure_Data.MIDDLE.MCPB = ControlerData.Data.Pressure_Data[9];
    cm.Pressure_Data.MIDDLE.MCPAL = ControlerData.Data.Pressure_Data[10];
    cm.Pressure_Data.MIDDLE.MCPAR = ControlerData.Data.Pressure_Data[11];
    cm.Pressure_Data.RING.IP = ControlerData.Data.Pressure_Data[12];
    cm.Pressure_Data.RING.MCPB = ControlerData.Data.Pressure_Data[13];
    cm.Pressure_Data.RING.MCPAL = ControlerData.Data.Pressure_Data[14];
    cm.Pressure_Data.RING.MCPAR = ControlerData.Data.Pressure_Data[15];
    cm.Pressure_Data.LITTLE.IP = ControlerData.Data.Pressure_Data[16];
    cm.Pressure_Data.LITTLE.MCPB = ControlerData.Data.Pressure_Data[17];
    cm.Pressure_Data.LITTLE.MCPAL = ControlerData.Data.Pressure_Data[18];
    cm.Pressure_Data.LITTLE.MCPAR = ControlerData.Data.Pressure_Data[19];   
}

void data_transfer_imu(Rx_Controler_UnData ControlerData, serial_communication::controler_message &cm)
{
    cm.ID = ControlerData.Data.ID;
    cm.time = ControlerData.Data.time;
/* THUMB SPI2 */
    cm.IMU_Data.THUMB.DIP.q0 = (float)ControlerData.Data.MPU_Data[0][1] / 30000;
    cm.IMU_Data.THUMB.DIP.q1 = (float)ControlerData.Data.MPU_Data[0][2] / 30000;
    cm.IMU_Data.THUMB.DIP.q2 = (float)ControlerData.Data.MPU_Data[0][3] / 30000;
    cm.IMU_Data.THUMB.DIP.q3 = (float)ControlerData.Data.MPU_Data[0][0] / 30000;

    cm.IMU_Data.THUMB.PIP.q0 = (float)ControlerData.Data.MPU_Data[1][1] / 30000;
    cm.IMU_Data.THUMB.PIP.q1 = (float)ControlerData.Data.MPU_Data[1][2] / 30000;
    cm.IMU_Data.THUMB.PIP.q2 = (float)ControlerData.Data.MPU_Data[1][3] / 30000;
    cm.IMU_Data.THUMB.PIP.q3 = (float)ControlerData.Data.MPU_Data[1][0] / 30000;

    cm.IMU_Data.THUMB.MCP.q0 = (float)ControlerData.Data.MPU_Data[2][1] / 30000;
    cm.IMU_Data.THUMB.MCP.q1 = (float)ControlerData.Data.MPU_Data[2][2] / 30000;
    cm.IMU_Data.THUMB.MCP.q2 = (float)ControlerData.Data.MPU_Data[2][3] / 30000;
    cm.IMU_Data.THUMB.MCP.q3 = (float)ControlerData.Data.MPU_Data[2][0] / 30000;

/* INDEX SPI3 */
    cm.IMU_Data.INDEX.DIP.q0 = (float)ControlerData.Data.MPU_Data[3][1] / 30000;
    cm.IMU_Data.INDEX.DIP.q1 = (float)ControlerData.Data.MPU_Data[3][2] / 30000;
    cm.IMU_Data.INDEX.DIP.q2 = (float)ControlerData.Data.MPU_Data[3][3] / 30000;
    cm.IMU_Data.INDEX.DIP.q3 = (float)ControlerData.Data.MPU_Data[3][0] / 30000;

    cm.IMU_Data.INDEX.PIP.q0 = (float)ControlerData.Data.MPU_Data[4][1] / 30000;
    cm.IMU_Data.INDEX.PIP.q1 = (float)ControlerData.Data.MPU_Data[4][2] / 30000;
    cm.IMU_Data.INDEX.PIP.q2 = (float)ControlerData.Data.MPU_Data[4][3] / 30000;
    cm.IMU_Data.INDEX.PIP.q3 = (float)ControlerData.Data.MPU_Data[4][0] / 30000;

    cm.IMU_Data.INDEX.MCP.q0 = (float)ControlerData.Data.MPU_Data[5][1] / 30000;
    cm.IMU_Data.INDEX.MCP.q1 = (float)ControlerData.Data.MPU_Data[5][2] / 30000;
    cm.IMU_Data.INDEX.MCP.q2 = (float)ControlerData.Data.MPU_Data[5][3] / 30000;
    cm.IMU_Data.INDEX.MCP.q3 = (float)ControlerData.Data.MPU_Data[5][0] / 30000;

/* MIDDLE SPI6 */
    cm.IMU_Data.MIDDLE.DIP.q0 = (float)ControlerData.Data.MPU_Data[12][1] / 30000;
    cm.IMU_Data.MIDDLE.DIP.q1 = (float)ControlerData.Data.MPU_Data[12][2] / 30000;
    cm.IMU_Data.MIDDLE.DIP.q2 = (float)ControlerData.Data.MPU_Data[12][3] / 30000;
    cm.IMU_Data.MIDDLE.DIP.q3 = (float)ControlerData.Data.MPU_Data[12][0] / 30000;

    cm.IMU_Data.MIDDLE.PIP.q0 = (float)ControlerData.Data.MPU_Data[13][1] / 30000;
    cm.IMU_Data.MIDDLE.PIP.q1 = (float)ControlerData.Data.MPU_Data[13][2] / 30000;
    cm.IMU_Data.MIDDLE.PIP.q2 = (float)ControlerData.Data.MPU_Data[13][3] / 30000;
    cm.IMU_Data.MIDDLE.PIP.q3 = (float)ControlerData.Data.MPU_Data[13][0] / 30000;

    cm.IMU_Data.MIDDLE.MCP.q0 = (float)ControlerData.Data.MPU_Data[14][1] / 30000;
    cm.IMU_Data.MIDDLE.MCP.q1 = (float)ControlerData.Data.MPU_Data[14][2] / 30000;
    cm.IMU_Data.MIDDLE.MCP.q2 = (float)ControlerData.Data.MPU_Data[14][3] / 30000;
    cm.IMU_Data.MIDDLE.MCP.q3 = (float)ControlerData.Data.MPU_Data[14][0] / 30000;
    
/* RING SPI4 */
    cm.IMU_Data.RING.DIP.q0 = (float)ControlerData.Data.MPU_Data[6][1] / 30000;
    cm.IMU_Data.RING.DIP.q1 = (float)ControlerData.Data.MPU_Data[6][2] / 30000;
    cm.IMU_Data.RING.DIP.q2 = (float)ControlerData.Data.MPU_Data[6][3] / 30000;
    cm.IMU_Data.RING.DIP.q3 = (float)ControlerData.Data.MPU_Data[6][0] / 30000;

    cm.IMU_Data.RING.PIP.q0 = (float)ControlerData.Data.MPU_Data[7][1] / 30000;
    cm.IMU_Data.RING.PIP.q1 = (float)ControlerData.Data.MPU_Data[7][2] / 30000;
    cm.IMU_Data.RING.PIP.q2 = (float)ControlerData.Data.MPU_Data[7][3] / 30000;
    cm.IMU_Data.RING.PIP.q3 = (float)ControlerData.Data.MPU_Data[7][0] / 30000;

    cm.IMU_Data.RING.MCP.q0 = (float)ControlerData.Data.MPU_Data[8][1] / 30000;
    cm.IMU_Data.RING.MCP.q1 = (float)ControlerData.Data.MPU_Data[8][2] / 30000;
    cm.IMU_Data.RING.MCP.q2 = (float)ControlerData.Data.MPU_Data[8][3] / 30000;
    cm.IMU_Data.RING.MCP.q3 = (float)ControlerData.Data.MPU_Data[8][0] / 30000;

/* LITTLE SPI5 */
    cm.IMU_Data.LITTLE.DIP.q0 = (float)ControlerData.Data.MPU_Data[9][1] / 30000;
    cm.IMU_Data.LITTLE.DIP.q1 = (float)ControlerData.Data.MPU_Data[9][2] / 30000;
    cm.IMU_Data.LITTLE.DIP.q2 = (float)ControlerData.Data.MPU_Data[9][3] / 30000;
    cm.IMU_Data.LITTLE.DIP.q3 = (float)ControlerData.Data.MPU_Data[9][0] / 30000;

    cm.IMU_Data.LITTLE.PIP.q0 = (float)ControlerData.Data.MPU_Data[10][1] / 30000;
    cm.IMU_Data.LITTLE.PIP.q1 = (float)ControlerData.Data.MPU_Data[10][2] / 30000;
    cm.IMU_Data.LITTLE.PIP.q2 = (float)ControlerData.Data.MPU_Data[10][3] / 30000;
    cm.IMU_Data.LITTLE.PIP.q3 = (float)ControlerData.Data.MPU_Data[10][0] / 30000;

    cm.IMU_Data.LITTLE.MCP.q0 = (float)ControlerData.Data.MPU_Data[11][1] / 30000;
    cm.IMU_Data.LITTLE.MCP.q1 = (float)ControlerData.Data.MPU_Data[11][2] / 30000;
    cm.IMU_Data.LITTLE.MCP.q2 = (float)ControlerData.Data.MPU_Data[11][3] / 30000;
    cm.IMU_Data.LITTLE.MCP.q3 = (float)ControlerData.Data.MPU_Data[11][0] / 30000;

/* PALM SPI6 */
    cm.IMU_Data.PALM.q0 = (float)ControlerData.Data.MPU_Data[15][1] / 30000;
    cm.IMU_Data.PALM.q1 = (float)ControlerData.Data.MPU_Data[15][2] / 30000;
    cm.IMU_Data.PALM.q2 = (float)ControlerData.Data.MPU_Data[15][3] / 30000;
    cm.IMU_Data.PALM.q3 = (float)ControlerData.Data.MPU_Data[15][0] / 30000;
}

void data_transfer_egain(Rx_Controler_UnData ControlerData, serial_communication::controler_message &cm)
{
    // cm.EGaIn_Data.THUMB1.DIP = ControlerData.Data.EGaIn_Data[0];
    // cm.EGaIn_Data.THUMB1.PIP = ControlerData.Data.EGaIn_Data[1];
    // cm.EGaIn_Data.THUMB1.MCPL = ControlerData.Data.EGaIn_Data[2];
    // cm.EGaIn_Data.THUMB1.MCPR = ControlerData.Data.EGaIn_Data[3];
    // cm.EGaIn_Data.INDEX.DIP = ControlerData.Data.EGaIn_Data[4];
    // cm.EGaIn_Data.INDEX.PIP = ControlerData.Data.EGaIn_Data[5];
    // cm.EGaIn_Data.INDEX.MCPL = ControlerData.Data.EGaIn_Data[6];
    // cm.EGaIn_Data.INDEX.MCPR = ControlerData.Data.EGaIn_Data[7];
    // cm.EGaIn_Data.MIDDLE.DIP = ControlerData.Data.EGaIn_Data[8];
    // cm.EGaIn_Data.MIDDLE.PIP = ControlerData.Data.EGaIn_Data[9];
    // cm.EGaIn_Data.MIDDLE.MCPL = ControlerData.Data.EGaIn_Data[10];
    // cm.EGaIn_Data.MIDDLE.MCPR = ControlerData.Data.EGaIn_Data[11];
    // cm.EGaIn_Data.RING.DIP = ControlerData.Data.EGaIn_Data[12];
    // cm.EGaIn_Data.RING.PIP = ControlerData.Data.EGaIn_Data[13];
    // cm.EGaIn_Data.RING.MCPL = ControlerData.Data.EGaIn_Data[14];
    // cm.EGaIn_Data.RING.MCPR = ControlerData.Data.EGaIn_Data[15];
    // cm.EGaIn_Data.LITTLE.DIP = ControlerData.Data.EGaIn_Data[16];
    // cm.EGaIn_Data.LITTLE.PIP = ControlerData.Data.EGaIn_Data[17];
    // cm.EGaIn_Data.LITTLE.MCPL = ControlerData.Data.EGaIn_Data[18];
    // cm.EGaIn_Data.LITTLE.MCPR = ControlerData.Data.EGaIn_Data[19];   
}

void data_transfer_force(Rx_Controler_UnData ControlerData, serial_communication::controler_message &cm)
{
    // cm.Force_Data.MIDDLE.FORCE1 = ControlerData.Data.Peripheral_Data[0];
    // cm.Force_Data.MIDDLE.FORCE2 = ControlerData.Data.Peripheral_Data[1];
    // cm.Force_Data.MIDDLE.FORCE3 = ControlerData.Data.Peripheral_Data[2];
    // cm.Force_Data.MIDDLE.FORCE4 = ControlerData.Data.Peripheral_Data[3];
}
