
/******************************************************
名称：obtain_angle
作用：获取手指关节角度


******************************************************/

#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <string>
#include <obtain_angle/fingerpose.h>
#include <cmath>

using namespace std;

//欧拉角RPY数据 LPF:一阶低通滤波
class RPY_DATA{
  public:
    double LPF_roll[3][2];  double roll[3];     //翻滚角 z
    double LPF_pitch[3][2]; double pitch[3];    //俯仰角 x
    double LPF_yaw[3][2];   double yaw[3];      //偏航角 y

    //初始化data赋值0
    RPY_DATA(){
      for(int i=0;i<3; i++){    //0~3四个气室
        for(int j=0; j<2; j++){ //0：新值 1:旧值
          LPF_roll[i][j] = 0.0;
          LPF_pitch[i][j] = 0.0;
          LPF_yaw[i][j] = 0.0;
        }
        roll[i] = 0.0;
        pitch[i] = 0.0;
        yaw[i] = 0.0;
      }
    }
    
    //更新一阶低通滤波欧拉角数据
    //新值作为下一轮的旧值
    void Update_LPF_RPY_DATA(void){
      for (int i=0; i<3; i++){
        LPF_roll[i][1]=LPF_roll[i][0];
        LPF_pitch[i][1]=LPF_pitch[i][0];
        LPF_yaw[i][1]=LPF_yaw[i][0];
      }
    }

    //一阶低通滤波函数 
    //LPF_xxx[i][0]是新的滤波值，LPF_xxx[i][1]是上一次滤波值
    //q:滤波系数
    void LPF(double q, int i){
      Update_LPF_RPY_DATA();
      LPF_roll[i][0]=q*roll[i]+(1-q)*LPF_roll[i][1];
      LPF_pitch[i][0]=q*pitch[i]+(1-q)*LPF_pitch[i][1];
      LPF_yaw[i][0]=q*yaw[i]+(1-q)*LPF_yaw[i][1];
    }
};

void UpdateOriginFrame(const obtain_angle::fingerpose pose);//？？？？？？？？

tf::Quaternion  origin_Q1, origin_Q2, origin_Q3;  //位姿四元数 默认顺序：x, y, z, w

double sponse_rate =30.0;                   //频率 Hz
double pi = 3.1415926;
double delta_t=1.0/sponse_rate;             //周期
double LPF_cutoff=0.25;                     //低通滤波器截止频率 Hz
double LPF_q=2.0*pi*delta_t*LPF_cutoff;     //低通滤波器滤波系数 0-1

int main(int argc, char** argv){

  ros::init(argc, argv, "obtain_angle");    //初始化节点
  ros::NodeHandle node;                     //创建节点句柄
  //创建subscriber，订阅topic：origin_frame，注册回调函数UpdateOriginFrame
  ros::Subscriber sub = node.subscribe("origin_frame", 1000, UpdateOriginFrame);
  //创建publisher，topic名为Fingerpose，消息类型obtain_angle::fingerpose，队列长度1000
  ros::Publisher pub = node.advertise<obtain_angle::fingerpose>("Fingerpose", 1000);
  
  tf::TransformBroadcaster br;              //Broudcaster
  tf::Transform transform;                  //变换
  tf::StampedTransform s_transform;         //带时间戳的变换
  tf::TransformListener lr;                 //Listener

  string tag("tag_");
  string frame("frame_");

  obtain_angle::fingerpose fp;      //手指位姿对象

  RPY_DATA rpy;                     //重点对象 收集角度信息
  RPY_DATA trans;

  ros::Rate rate(sponse_rate);      //数据采集频率s
  while (node.ok()){

    for(int i=1; i<4; i++){         //1~3：MCP PIP DIP

      try{
        
        transform.setOrigin( tf::Vector3(0.0, 0.0, 0.0) );    //初始化Vector3:TF中定义的xyz

        switch(i){
          case 1: transform.setRotation( origin_Q1 );  break;
          case 2: transform.setRotation( origin_Q2 );  break;
          case 3: transform.setRotation( origin_Q3 );  break;
        }
        br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), tag+to_string(i), frame+to_string(i)));

        //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$0
        lr.waitForTransform(frame+to_string(i), tag+to_string(0), ros::Time(0), ros::Duration(10));
        lr.lookupTransform(frame+to_string(i), tag+to_string(0), ros::Time(0), s_transform);
        tf::Matrix3x3( s_transform.getRotation() ).getRPY(rpy.roll[i-1], rpy.pitch[i-1], rpy.yaw[i-1]);//angle
        trans.roll[i-1] = s_transform.getOrigin().getX()*1000.0;//position x
        trans.pitch[i-1] = s_transform.getOrigin().getY()*1000.0;//position y
        trans.yaw[i-1] = s_transform.getOrigin().getZ()*1000.0;//position z
        //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

        LPF_q=1.0;
        rpy.LPF(LPF_q, i-1);//低通滤波器截止频率设置 
        trans.LPF(LPF_q, i-1);

        double threshold = 180.0;

        switch(i){
          case 1: 
            fp.YAW_MCP.x=rpy.LPF_roll[i-1][0]/pi*180.0;
            if(abs(fp.YAW_MCP.x)>=threshold) fp.YAW_MCP.x=fp.YAW_MCP.x+360;
            fp.YAW_MCP.y=rpy.LPF_pitch[i-1][0]/pi*180.0;
            if(abs(fp.YAW_MCP.y)>=threshold) fp.YAW_MCP.y=fp.YAW_MCP.y+360;
            fp.YAW_MCP.z=rpy.LPF_yaw[i-1][0]/pi*180.0;
            if(abs(fp.YAW_MCP.z)>=threshold) fp.YAW_MCP.z=fp.YAW_MCP.z+360;
            fp.TRANS_MCP.x=trans.LPF_roll[i-1][0];
            fp.TRANS_MCP.y=trans.LPF_pitch[i-1][0];
            fp.TRANS_MCP.z=trans.LPF_yaw[i-1][0];
            fp.origin_Q_tag1.w=origin_Q1.getW();
            fp.origin_Q_tag1.x=origin_Q1.getX();
            fp.origin_Q_tag1.y=origin_Q1.getY();
            fp.origin_Q_tag1.z=origin_Q1.getZ();
            break;
          case 2: 
            fp.YAW_PIP.x=(rpy.LPF_roll[i-1][0]-rpy.LPF_roll[i-2][0])/pi*180.0;
            if(abs(fp.YAW_PIP.x)>=threshold) fp.YAW_PIP.x=fp.YAW_PIP.x+360;
            fp.YAW_PIP.y=(rpy.LPF_pitch[i-1][0]-rpy.LPF_pitch[i-2][0])/pi*180.0;
            if(abs(fp.YAW_PIP.y)>=threshold) fp.YAW_PIP.y=fp.YAW_PIP.y+360;
            fp.YAW_PIP.z=(rpy.LPF_yaw[i-1][0]-rpy.LPF_yaw[i-2][0])/pi*180.0;
            if(abs(fp.YAW_PIP.z)>=threshold) fp.YAW_PIP.z=fp.YAW_PIP.z+360;
            fp.TRANS_PIP.x=trans.LPF_roll[i-1][0]-trans.LPF_roll[i-2][0];
            fp.TRANS_PIP.y=trans.LPF_pitch[i-1][0]-trans.LPF_pitch[i-2][0];
            fp.TRANS_PIP.z=trans.LPF_yaw[i-1][0]-trans.LPF_yaw[i-2][0];
            fp.origin_Q_tag2.w=origin_Q2.getW();
            fp.origin_Q_tag2.x=origin_Q2.getX();
            fp.origin_Q_tag2.y=origin_Q2.getY();
            fp.origin_Q_tag2.z=origin_Q2.getZ();
            break;
          case 3: 
            fp.YAW_DIP.x=(rpy.LPF_roll[i-1][0]-rpy.LPF_roll[i-2][0])/pi*180.0;
            if(abs(fp.YAW_DIP.x)>=threshold) fp.YAW_DIP.x=fp.YAW_DIP.x+360;
            fp.YAW_DIP.y=(rpy.LPF_pitch[i-1][0]-rpy.LPF_pitch[i-2][0])/pi*180.0;
            if(abs(fp.YAW_DIP.y)>=threshold) fp.YAW_DIP.y=fp.YAW_DIP.y+360;
            fp.YAW_DIP.z=(rpy.LPF_yaw[i-1][0]-rpy.LPF_yaw[i-2][0])/pi*180.0;
            if(abs(fp.YAW_DIP.z)>=threshold) fp.YAW_DIP.z=fp.YAW_DIP.z+360;
            fp.TRANS_DIP.x=trans.LPF_roll[i-1][0]-trans.LPF_roll[i-2][0];
            fp.TRANS_DIP.y=trans.LPF_pitch[i-1][0]-trans.LPF_pitch[i-2][0];
            fp.TRANS_DIP.z=trans.LPF_yaw[i-1][0]-trans.LPF_yaw[i-2][0];
            fp.origin_Q_tag3.w=origin_Q3.getW();
            fp.origin_Q_tag3.x=origin_Q3.getX();
            fp.origin_Q_tag3.y=origin_Q3.getY();
            fp.origin_Q_tag3.z=origin_Q3.getZ();
            break;
        }
        pub.publish(fp);
      }
      catch( tf::TransformException &ex ){
        ROS_ERROR("%s", ex.what());
        ros::Duration(1.0).sleep();
        continue;
      }
    }
    ros::spinOnce();
    rate.sleep();
  }
  return 0;
}

//？？？？？
void UpdateOriginFrame(const obtain_angle::fingerpose pose){
  tf::quaternionMsgToTF(pose.origin_Q_tag1,origin_Q1);
  tf::quaternionMsgToTF(pose.origin_Q_tag2,origin_Q2);
  tf::quaternionMsgToTF(pose.origin_Q_tag3,origin_Q3);
}