#include <termios.h>
#include <signal.h>
#include <sys/poll.h>
#include <boost/thread/thread.hpp>
#include <ros/ros.h>
#include <obtain_angle/fingerpose.h>
#include <serial_communication/controler_message.h>
#include <vector>
#include <fstream> 

using namespace std;
 
#define KEYCODE_SPACE 0x20

int kfd = 0; 
struct termios cooked, raw;
bool Collect_STA=0;
float reference;

struct Eular_Angle{
    double Pitch;
    double Yaw;
    double Roll;
};

class Angle{
    public:
        Eular_Angle DIP;
        Eular_Angle PIP;
        Eular_Angle MCP;
}Joint_Angle;

class Trans{
    public:
        double DIP[3];
        double PIP[3];
        double MCP[3];
}Joint_Trans;

class Pressure{
    public:
        double IP;
        double MCPB;
        double MCPAL;
        double MCPAR;
}Chamber_Pressure;

class EGaIn{
    public:
        double DIP;
        double PIP;
        double MCPL;
        double MCPR;
}Joint_EGaIn;

class Force{
    public:
        double FORCE1;
        double FORCE2;
        double FORCE3;
        double FORCE4;
}Finger_Force;

class Finger{
    public:
        uint8_t ID;
        uint16_t Stamp;
        Pressure Chamber_Pressure;
        EGaIn Joint_EGaIn;
        Force Finger_Force;
}RS_Finger;

void keyboardLoop(void);
void UpdateData(const obtain_angle::fingerpose pose);
void Collect_COMPort(const serial_communication::controler_message com_msgs);
void FoundFile(void);
 
int main(int argc, char** argv){

    ros::init(argc,argv,"collect_data");
    ros::NodeHandle node;
    ros::Subscriber sub = node.subscribe("Fingerpose", 1000, UpdateData);
    ros::Subscriber com = node.subscribe("Controler_message", 1000, Collect_COMPort);	
    	 
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
                Collect_STA=1;
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
    outFile.open("/home/zhenruichen/rosws_fingerApriltag/src/set_origin/data/Collect/joint_angle.csv", ios::out);
    outFile << "INDEX" << ',' << "ID" << ',' << "STAMP"
            << ',' << "Pressure_IP"   << ',' << "Pressure_MCPB"  << ',' << "Pressure_MCPAL"  << ',' << "Pressure_MCPAR"
            << ',' << "EGaIn_DIP"     << ',' << "EGaIn_PIP"      << ',' << "EGaIn_MCPL"      << ',' << "EGaIn_MCPR"
            << ',' << "FORCE1"        << ',' << "FORCE2"         << ',' << "FORCE3"          << ',' << "FORCE4"
            << ',' << "DIP_Pitch" << "," << "DIP_Yaw" << "," << "DIP_Roll" << "," << "DIP_X" << "," << "DIP_Y" << "," << "DIP_Z" 
            << ',' << "PIP_Pitch" << "," << "PIP_Yaw" << "," << "PIP_Roll" << "," << "PIP_X" << "," << "PIP_Y" << "," << "PIP_Z" 
            << ',' << "MCP_Pitch" << "," << "MCP_Yaw" << "," << "MCP_Roll" << "," << "MCP_X" << "," << "MCP_Y" << "," << "MCP_Z"  << endl;
    outFile.close(); 
}

void UpdateData(const obtain_angle::fingerpose pose){
    if(Collect_STA==1){

        Joint_Angle.DIP.Roll = pose.YAW_DIP.x;
        Joint_Angle.DIP.Pitch = pose.YAW_DIP.y;
        Joint_Angle.DIP.Yaw = pose.YAW_DIP.z;
        Joint_Trans.DIP[0] = pose.TRANS_DIP.x;
        Joint_Trans.DIP[1] = pose.TRANS_DIP.y;
        Joint_Trans.DIP[2] = pose.TRANS_DIP.z;

        Joint_Angle.PIP.Roll = pose.YAW_PIP.x;
        Joint_Angle.PIP.Pitch = pose.YAW_PIP.y;
        Joint_Angle.PIP.Yaw = pose.YAW_PIP.z;
        Joint_Trans.PIP[0] = pose.TRANS_PIP.x;
        Joint_Trans.PIP[1] = pose.TRANS_PIP.y;
        Joint_Trans.PIP[2] = pose.TRANS_PIP.z;
 
        Joint_Angle.MCP.Roll = pose.YAW_MCP.x;
        Joint_Angle.MCP.Pitch = pose.YAW_MCP.y;
        Joint_Angle.MCP.Yaw = pose.YAW_MCP.z;
        Joint_Trans.MCP[0] = pose.TRANS_MCP.x;
        Joint_Trans.MCP[1] = pose.TRANS_MCP.y;
        Joint_Trans.MCP[2] = pose.TRANS_MCP.z;


        ofstream outFile;
        outFile.open("/home/zhenruichen/rosWS_fingerApriltag/src/set_origin/data/Collect/joint_angle.csv", ios::app);
        outFile << reference << ',' << RS_Finger.ID << ',' << RS_Finger.Stamp
                << ',' << RS_Finger.Chamber_Pressure.IP    << ',' << RS_Finger.Chamber_Pressure.MCPB 
                << ',' << RS_Finger.Chamber_Pressure.MCPAL << ',' << RS_Finger.Chamber_Pressure.MCPAR
                << ',' << RS_Finger.Joint_EGaIn.DIP        << ',' << RS_Finger.Joint_EGaIn.PIP       
                << ',' << RS_Finger.Joint_EGaIn.MCPL       << ',' << RS_Finger.Joint_EGaIn.MCPR
                << ',' << RS_Finger.Finger_Force.FORCE1    << ',' << RS_Finger.Finger_Force.FORCE2   
                << ',' << RS_Finger.Finger_Force.FORCE3    << ',' << RS_Finger.Finger_Force.FORCE4
                << ',' << Joint_Angle.DIP.Pitch << ',' << Joint_Angle.DIP.Yaw << ',' << Joint_Angle.DIP.Roll
                << ',' << Joint_Trans.DIP[0]    << ',' << Joint_Trans.DIP[1]  << ',' << Joint_Trans.DIP[2]
                << ',' << Joint_Angle.PIP.Pitch << ',' << Joint_Angle.PIP.Yaw << ',' << Joint_Angle.PIP.Roll
                << ',' << Joint_Trans.PIP[0]    << ',' << Joint_Trans.PIP[1]  << ',' << Joint_Trans.PIP[2]
                << ',' << Joint_Angle.MCP.Pitch << ',' << Joint_Angle.MCP.Yaw << ',' << Joint_Angle.MCP.Roll
                << ',' << Joint_Trans.MCP[0]    << ',' << Joint_Trans.MCP[1]  << ',' << Joint_Trans.MCP[2]<< endl;
        outFile.close(); 

        ROS_INFO_STREAM(" COLLECT_COMPLETE ");
        Collect_STA=0;
    }
}

void Collect_COMPort(const serial_communication::controler_message com_msgs)
{
    RS_Finger.ID = com_msgs.ID;
    RS_Finger.Stamp = com_msgs.time;
    RS_Finger.Chamber_Pressure.IP = com_msgs.Pressure_Data.MIDDLE.IP;
    RS_Finger.Chamber_Pressure.MCPB = com_msgs.Pressure_Data.MIDDLE.MCPB;
    RS_Finger.Chamber_Pressure.MCPAL = com_msgs.Pressure_Data.MIDDLE.MCPAL;
    RS_Finger.Chamber_Pressure.MCPAR = com_msgs.Pressure_Data.MIDDLE.MCPAR;
    RS_Finger.Joint_EGaIn.DIP = com_msgs.EGaIn_Data.MIDDLE.DIP;
    RS_Finger.Joint_EGaIn.PIP = com_msgs.EGaIn_Data.MIDDLE.PIP;
    RS_Finger.Joint_EGaIn.MCPL = com_msgs.EGaIn_Data.MIDDLE.MCPL;
    RS_Finger.Joint_EGaIn.MCPR = com_msgs.EGaIn_Data.MIDDLE.MCPR;
    RS_Finger.Finger_Force.FORCE1 = com_msgs.Force_Data.MIDDLE.FORCE1;
    RS_Finger.Finger_Force.FORCE2 = com_msgs.Force_Data.MIDDLE.FORCE2;
    RS_Finger.Finger_Force.FORCE3 = com_msgs.Force_Data.MIDDLE.FORCE3;
    RS_Finger.Finger_Force.FORCE4 = com_msgs.Force_Data.MIDDLE.FORCE4;
}

