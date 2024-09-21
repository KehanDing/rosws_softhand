#include <termios.h>
#include <signal.h>
#include <sys/poll.h>
#include <boost/thread/thread.hpp>
#include <ros/ros.h>
#include <obtain_angle/fingerpose.h>
#include <vector>
#include <fstream> 

using namespace std;
 
#define KEYCODE_SPACE 0x20
#define DATA_MAX_SIZE 100

int kfd = 0;
struct termios cooked, raw;
bool Collect_STA=0;
float reference;

struct Eular_Angle{
    vector<double>Pitch;
    vector<double>Yaw;
    vector<double>Roll;
};

class Angle{
    public:
        Eular_Angle DIP;
        Eular_Angle PIP;
        Eular_Angle MCP;
}Joint_Angle;

void keyboardLoop(void);
void UpdateDataVector(const obtain_angle::fingerpose pose);
void FoundFile(void);
 
int main(int argc, char** argv){

    ros::init(argc,argv,"collect_data");
    ros::NodeHandle node;
    ros::Subscriber sub = node.subscribe("Fingerpose", 1000, UpdateDataVector);	
    	 
    boost::thread t = boost::thread(&keyboardLoop);

    FoundFile();

    ros::spin();
    
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
    
    ROS_INFO_STREAM(" keyboard control set ");
    
    struct pollfd ufd;
    ufd.fd = kfd;
    ufd.events = POLLIN;
    
    for(;;){
        boost::this_thread::interruption_point();
        
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
            case KEYCODE_SPACE:
                ROS_INFO_STREAM(" SET_REFERENCE = ");
                scanf("%f",&reference);
                Collect_STA++;
                printf("set reference to %f \n", reference);
                ROS_INFO_STREAM(" SET_REFERENCE SUCCESS ");
                break;           
            default:
                ;
                              
        }
    }
}

void FoundFile(void){
    ofstream outFile;
    //DIP
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Cali/DIP_angle_P.csv", ios::out);
    outFile << "角度" << ','<< "测量值" << endl;
    outFile.close(); 
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Cali/DIP_angle_Y.csv", ios::out);
    outFile << "角度" << ','<< "测量值" << endl;
    outFile.close(); 
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Cali/DIP_angle_R.csv", ios::out);
    outFile << "角度" << ','<< "测量值" << endl;
    outFile.close(); 
    //PIP
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Cali/PIP_angle_P.csv", ios::out);
    outFile << "角度" << ','<< "测量值" << endl;
    outFile.close(); 
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Cali/PIP_angle_Y.csv", ios::out);
    outFile << "角度" << ','<< "测量值" << endl;
    outFile.close(); 
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Cali/PIP_angle_R.csv", ios::out);
    outFile << "角度" << ','<< "测量值" << endl;
    outFile.close(); 
    //MCP
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Cali/MCP_angle_P.csv", ios::out);
    outFile << "角度" << ','<< "测量值" << endl;
    outFile.close(); 
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Cali/MCP_angle_Y.csv", ios::out);
    outFile << "角度" << ','<< "测量值" << endl;
    outFile.close(); 
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Cali/MCP_angle_R.csv", ios::out);
    outFile << "角度" << ','<< "测量值" << endl;
    outFile.close(); 
    //ERROR
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Cali/MCP_ERROR_P.csv", ios::out);
    outFile << "角度" << ','<< "误差" << endl;
    outFile.close(); 
}

void UpdateDataVector(const obtain_angle::fingerpose pose){
    if(Collect_STA==1){

        Joint_Angle.DIP.Pitch.push_back(pose.YAW_DIP.z);
        Joint_Angle.DIP.Yaw.push_back(pose.YAW_DIP.y);
        Joint_Angle.DIP.Roll.push_back(pose.YAW_DIP.x);
        Joint_Angle.PIP.Pitch.push_back(pose.YAW_PIP.z);
        Joint_Angle.PIP.Yaw.push_back(pose.YAW_PIP.y);
        Joint_Angle.PIP.Roll.push_back(pose.YAW_PIP.x);
        Joint_Angle.MCP.Pitch.push_back(pose.YAW_MCP.z);
        Joint_Angle.MCP.Yaw.push_back(pose.YAW_MCP.y);
        Joint_Angle.MCP.Roll.push_back(pose.YAW_MCP.x);

        if(Joint_Angle.DIP.Pitch.size()==DATA_MAX_SIZE){
            ofstream outFile;
            //DIP
            outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Cali/DIP_angle_P.csv", ios::app);
            outFile << reference << ',';
            for(int i=0;i<Joint_Angle.DIP.Pitch.size(); i++){
                outFile << Joint_Angle.DIP.Pitch[i]<< ',';  
            }
            outFile << endl;
            outFile.close(); 
            Joint_Angle.DIP.Pitch.clear();
            outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Cali/DIP_angle_Y.csv", ios::app);
            outFile << reference << ',';
            for(int i=0;i<Joint_Angle.DIP.Yaw.size(); i++){
                outFile << Joint_Angle.DIP.Yaw[i]<< ',';  
            }
            outFile << endl;
            outFile.close(); 
            Joint_Angle.DIP.Yaw.clear();
            outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Cali/DIP_angle_R.csv", ios::app);
            outFile << reference << ',';
            for(int i=0;i<Joint_Angle.DIP.Roll.size(); i++){
                outFile << Joint_Angle.DIP.Roll[i]<< ',';  
            }
            outFile << endl;
            outFile.close(); 
            Joint_Angle.DIP.Roll.clear();
            //PIP
            outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Cali/PIP_angle_P.csv", ios::app);
            outFile << reference << ',';
            for(int i=0;i<Joint_Angle.PIP.Pitch.size(); i++){
                outFile << Joint_Angle.PIP.Pitch[i]<< ',';  
            }
            outFile << endl;
            outFile.close(); 
            Joint_Angle.PIP.Pitch.clear();
            outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Cali/PIP_angle_Y.csv", ios::app);
            outFile << reference << ',';
            for(int i=0;i<Joint_Angle.PIP.Yaw.size(); i++){
                outFile << Joint_Angle.PIP.Yaw[i]<< ',';  
            }
            outFile << endl;
            outFile.close(); 
            Joint_Angle.PIP.Yaw.clear();
            outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Cali/PIP_angle_R.csv", ios::app);
            outFile << reference << ',';
            for(int i=0;i<Joint_Angle.PIP.Roll.size(); i++){
                outFile << Joint_Angle.PIP.Roll[i]<< ',';  
            }
            outFile << endl;
            outFile.close(); 
            Joint_Angle.PIP.Roll.clear();
            //ERROR
            outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Cali/MCP_ERROR_P.csv", ios::app);
            outFile << reference << ',';
            for(int i=0;i<Joint_Angle.MCP.Pitch.size(); i++){
                outFile << Joint_Angle.MCP.Pitch[i]-reference<< ',';  
            }
            outFile << endl;
            outFile.close(); 
            //MCP
            outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Cali/MCP_angle_P.csv", ios::app);
            outFile << reference << ',';
            for(int i=0;i<Joint_Angle.MCP.Pitch.size(); i++){
                outFile << Joint_Angle.MCP.Pitch[i]<< ',';  
            }
            outFile << endl;
            outFile.close(); 
            Joint_Angle.MCP.Pitch.clear();
            outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Cali/MCP_angle_Y.csv", ios::app);
            outFile << reference << ',';
            for(int i=0;i<Joint_Angle.MCP.Yaw.size(); i++){
                outFile << Joint_Angle.MCP.Yaw[i]<< ',';  
            }
            outFile << endl;
            outFile.close(); 
            Joint_Angle.MCP.Yaw.clear();
            outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Cali/MCP_angle_R.csv", ios::app);
            outFile << reference << ',';
            for(int i=0;i<Joint_Angle.MCP.Roll.size(); i++){
                outFile << Joint_Angle.MCP.Roll[i]<< ',';  
            }
            outFile << endl;
            outFile.close(); 
            Joint_Angle.MCP.Roll.clear();

            ROS_INFO_STREAM(" COLLECT_COMPLETE ");
            Collect_STA=0;
        }
    }
}
