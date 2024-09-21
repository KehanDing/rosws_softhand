#include <termios.h>
#include <signal.h>
#include <sys/poll.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <string>
#include <boost/thread/thread.hpp>
#include <ros/ros.h>
#include <obtain_angle/fingerpose.h>

using namespace std;
 
#define KEYCODE_W_CAP 0x57
 
void keyboardLoop(void);
void OriginUpdate(void);
void PublisherInit(void);

int kfd = 0;
struct termios cooked, raw;
obtain_angle::fingerpose fp;
 
int main(int argc, char** argv){

    ros::init(argc,argv,"set_origin");
    ros::NodeHandle node;
    ros::Publisher pub = node.advertise<obtain_angle::fingerpose>("origin_frame", 1000);
    	 
    boost::thread t = boost::thread(&keyboardLoop);

    PublisherInit();

    ros::Rate rate(30.0);
    while (ros::ok())
    {
        pub.publish(fp); 
        ros::spinOnce();
        rate.sleep();
    }
    
    t.interrupt();
    t.join();
    tcsetattr(kfd, TCSANOW, &cooked);    
    return(0);
}
 
void keyboardLoop(void){
    char c;
    
    // get the console in raw mode
    tcgetattr(kfd, &cooked);
    memcpy(&raw, &cooked, sizeof(struct termios));
    raw.c_lflag &=~ (ICANON | ECHO);
    raw.c_cc[VEOL] = 1;
    raw.c_cc[VEOF] = 2;
    tcsetattr(kfd, TCSANOW, &raw);
    
    ROS_INFO_STREAM("keyboard control set");
    
    struct pollfd ufd;
    ufd.fd = kfd;
    ufd.events = POLLIN;
    
    for(;;){
        boost::this_thread::interruption_point();
        
        // get the next event from the keyboard
        int num;
        
        if ((num = poll(&ufd, 1, 250)) < 0){
            perror("poll():");
            return;
        }
        else if(num > 0){
            if(read(kfd, &c, 1) < 0){
                perror("read():");
                return;
            }
        }
        else{           
            continue;
        }
        
        switch(c)
        {                
            case KEYCODE_W_CAP:
                ROS_INFO_STREAM("SET_ORIGIN");
                OriginUpdate();
                break;           
            default:
                ;
                              
        }
    }
}

void OriginUpdate(void){
  
  tf::TransformBroadcaster br;
  tf::Transform transform;
  tf::StampedTransform s_transform;
  tf::TransformListener lr;

  string tag("tag_");
  string frame("frame_");

  for(int i=1; i<4; i++){
    try{
      lr.waitForTransform(tag+to_string(i), "tag_0", ros::Time(0), ros::Duration(10));
      lr.lookupTransform(tag+to_string(i), "tag_0", ros::Time(0), s_transform);
    }
    catch( tf::TransformException &ex ){
      ROS_ERROR("%s", ex.what());
      ros::Duration(1.0).sleep();
      continue;
    }
    
    switch(i){
        case 1:
            fp.origin_Q_tag1.w=s_transform.getRotation().getW();
            fp.origin_Q_tag1.x=s_transform.getRotation().getX();
            fp.origin_Q_tag1.y=s_transform.getRotation().getY();
            fp.origin_Q_tag1.z=s_transform.getRotation().getZ();
            break;
        case 2:
            fp.origin_Q_tag2.w=s_transform.getRotation().getW();
            fp.origin_Q_tag2.x=s_transform.getRotation().getX();
            fp.origin_Q_tag2.y=s_transform.getRotation().getY();
            fp.origin_Q_tag2.z=s_transform.getRotation().getZ();
            break;
        case 3:
            fp.origin_Q_tag3.w=s_transform.getRotation().getW();
            fp.origin_Q_tag3.x=s_transform.getRotation().getX();
            fp.origin_Q_tag3.y=s_transform.getRotation().getY();
            fp.origin_Q_tag3.z=s_transform.getRotation().getZ();
            break;
    }
  }
}

void PublisherInit(void){
    fp.origin_Q_tag1.w=1.0;
    fp.origin_Q_tag1.x=0.0;
    fp.origin_Q_tag1.y=0.0;
    fp.origin_Q_tag1.z=0.0;

    fp.origin_Q_tag2.w=1.0;
    fp.origin_Q_tag2.x=0.0;
    fp.origin_Q_tag2.y=0.0;
    fp.origin_Q_tag2.z=0.0;

    fp.origin_Q_tag3.w=1.0;
    fp.origin_Q_tag3.x=0.0;
    fp.origin_Q_tag3.y=0.0;
    fp.origin_Q_tag3.z=0.0;
}