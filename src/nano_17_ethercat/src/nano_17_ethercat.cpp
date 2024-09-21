#include <iostream>
#include <string>
#include <signal.h>
#include <sstream>
#include <time.h>
#include <thread>
#include <termios.h>
#include <sys/poll.h>
#include <string>
using namespace std;

#include "ecrt.h"
#include "../include/nano_17_ethercat/nano17.hpp"

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64MultiArray.h"
#include <boost/thread/thread.hpp>
#include <nano_17_ethercat/FT_nano17.h>


#if MS_1
#define PERIOD_NS   (500000)//398300
#else 
#define PERIOD_NS   (398300)//398300
#endif

#define PERIOD_MS   (1000000)

/* Constants */
#define NSEC_PER_SEC (1000000000)
#define FREQUENCY (NSEC_PER_SEC / PERIOD_MS)    //Freq = 1000Hz

//#define PALM
#define FT_NANO17

static unsigned int counter = 0;

// process data
static uint8_t *domain1_pd = NULL;

// EtherCAT
static ec_master_t *master = NULL;
static ec_master_state_t master_state = {};

static ec_domain_t *domain1 = NULL;
static ec_domain_state_t domain1_state = {};

#ifdef PALM
#define PalmPos  0, 0
#define MicroChipLan9252 0xe00004d8, 0x00009252
static ec_slave_config_t *sc_ana_in = NULL;
static ec_slave_config_state_t sc_ana_in_state = {};
#endif

#ifdef FT_NANO17

#ifdef PALM
#define Nano17Pos  0, 1
#else
#define Nano17Pos  0, 0
#endif

#define Nano17ChipLan    0x00000732, 0x26483052
static ec_slave_config_t *sc_ana_in_nano17 = NULL;
static ec_slave_config_state_t sc_ana_in_state_nano17 = {};
#endif

static unsigned int off_ana_in_status;
static unsigned int off_ana_out_status;

static unsigned int off_ana_in_status_nano17;
static unsigned int off_ana_out_status_nano17;

const static ec_pdo_entry_reg_t domain1_regs[] = {
#ifdef PALM
    {PalmPos,  MicroChipLan9252, 0x6001, 1, &off_ana_in_status},
    {PalmPos,  MicroChipLan9252, 0x7010, 1, &off_ana_out_status},
#endif
#ifdef FT_NANO17
    {Nano17Pos,  Nano17ChipLan, 0x6000, 1, &off_ana_in_status_nano17},
    {Nano17Pos,  Nano17ChipLan, 0x7010, 1, &off_ana_out_status_nano17},
#endif
    {}
};

#define KEYCODE_W_CAP 0x57

int kfd = 0;
struct termios cooked, raw;
TARGET_NANO17 Nano17_info;
double ros_freq = 100.0;
int32_t NO_DATA = 0;
extern bool origin_flag;
nano_17_ethercat::FT_nano17 ft_nano17;
ros::Publisher pub;

/*****************************************************************************/

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
                origin_flag = true;
                break;           
            default:
                ;
                              
        }
    }
}

/*****************************************************************************/

void check_domain1_state(void)
{
    ec_domain_state_t ds;

    ecrt_domain_state(domain1, &ds);

    if (ds.working_counter != domain1_state.working_counter) {
        ROS_INFO("Domain1: WC %u.", ds.working_counter);
        //vpoint_2.DomainWC = ds.working_counter;
    }
    if (ds.wc_state != domain1_state.wc_state) {
        ROS_INFO("Domain1: State %u.", ds.wc_state);
       // vpoint_2.DomainState = ds.wc_state;
    }

    domain1_state = ds;
}

/*****************************************************************************/

void check_master_state(void)
{
    ec_master_state_t ms;
    ecrt_master_state(master, &ms);

    if (ms.slaves_responding != master_state.slaves_responding) {
        ROS_INFO("%u slave(s).", ms.slaves_responding);
    }
    if (ms.al_states != master_state.al_states) {
        ROS_INFO("AL states: 0x%02X.", ms.al_states);
    }
    if (ms.link_up != master_state.link_up) {
        ROS_INFO("Link is %s.", ms.link_up ? "up" : "down");
    }

    master_state = ms;
}

/*****************************************************************************/

void check_slave_config_states(string &name, ec_slave_config_t* &sc_in,ec_slave_config_state_t &sc_sta)
{
    ec_slave_config_state_t s;

    ecrt_slave_config_state(sc_in, &s);

    if (s.al_state != sc_sta.al_state) {
        ROS_INFO("%s: State 0x%02X.", name.c_str(),s.al_state);
        // printf("AnaIn: State 0x%02X.\n", s.al_state);
    }
    if (s.online != sc_sta.online) {
        ROS_INFO("%s: %s.", name.c_str(),s.online ? "online" : "offline");
    }
    if (s.operational != sc_sta.operational) {
        ROS_INFO("%s: %soperational.\n", name.c_str(),s.operational ? "" : "Not ");
    }

    sc_sta = s;
}

void ros_receive() { 

	master = ecrt_request_master(0);
    if (!master) {
        return ;
    }
	domain1 = ecrt_master_create_domain(master);
    if (!domain1) {
        return ;
    }

#ifdef PALM
	ROS_INFO("%s", "Configuring PDOs...");
    if (!(sc_ana_in = ecrt_master_slave_config(
                    master, PalmPos, MicroChipLan9252))) {
		ROS_INFO("%s", "Failed to get slave configuration.");
        return ;
    }

	if (ecrt_slave_config_pdos(sc_ana_in, EC_END, slave_0_syncs)) {
		ROS_INFO("%s", "Failed to configure PDOs.");
        return ;
    }
#endif

#ifdef FT_NANO17
    ROS_INFO("%s", "Configuring Nano17 PDOs...");
    if (!(sc_ana_in_nano17 = ecrt_master_slave_config(
                    master, Nano17Pos, Nano17ChipLan))) {
		ROS_INFO("%s", "Failed to get nano17 slave configuration.");
        return ;
    }

    if (ecrt_slave_config_pdos(sc_ana_in_nano17, EC_END, slave_1_syncs)) {
		ROS_INFO("%s", "Failed to configure nano17 PDOs.");
        return ;
    }
#endif

	if (ecrt_domain_reg_pdo_entry_list(domain1, domain1_regs)) {
        fprintf(stderr, "PDO entry registration failed!\n");
        return ;
    }

    ROS_INFO("Domain1: IN %u, OUT %u.", off_ana_in_status, off_ana_out_status);

#ifdef FT_NANO17
    ROS_INFO("Domain1 Nano17: IN %u, OUT %u.\n", off_ana_in_status_nano17, off_ana_out_status_nano17);
#endif

	ROS_INFO("%s", "Activating master...");

    if (ecrt_master_activate(master)) {
        return ;
    }

	if (!(domain1_pd = ecrt_domain_data(domain1))) {
        return ;
    }

    string name ;
    ros::Rate loop_rate(ros_freq);

	while(ros::ok())
	{
        ecrt_master_receive(master);
        ecrt_domain_process(domain1);
        check_domain1_state();

        if (counter) {
            counter--;
        }
         else { // do this at 1 Hz
            counter = FREQUENCY;

            // check for master state (optional)
            check_master_state();

            // check for slave configuration state(s) (optional)
            #ifdef PALM
            name =  "palm";
            check_slave_config_states(name, sc_ana_in,sc_ana_in_state);
            #endif  
            #ifdef FT_NANO17
            name =  "nano17";
            check_slave_config_states(name,sc_ana_in_nano17,sc_ana_in_state_nano17);
            #endif 
        }

#ifdef FT_NANO17
        memcpy(&Nano17_info, domain1_pd + off_ana_in_status_nano17, 4*8);//*sizeof(TARGET_NANO17)
#endif 
        nano17DataPublisher(&Nano17_info, ft_nano17);  

        // send process data
        ecrt_domain_queue(domain1);//
        //rt_task_wait_period(NULL);//
        ecrt_master_send(master);//
  
        pub.publish(ft_nano17);
        NO_DATA ++;
        ROS_INFO_STREAM("NANO17 DATA PUBLISHED ...  NO. "<<NO_DATA);

        ros::spinOnce();
        //rt_task_wait_period(NULL);
        loop_rate.sleep();
	} 

    return;   
}



int main(int argc, char** argv)
{
	ros::init(argc, argv, "nano_17_ethercat");
    ros::NodeHandle n("~");
    pub = n.advertise<nano_17_ethercat::FT_nano17>("/EtherCAT/FT_nano17", 1000);
    n.param("ros_freq",ros_freq,ros_freq);

    boost::thread t = boost::thread(&keyboardLoop);

    ROS_INFO_STREAM("NANO17 MASTER START ...");
    ros_receive();
    ROS_INFO_STREAM("NANO17 MASTER END ...");

    t.interrupt();
    t.join();
    tcsetattr(kfd, TCSANOW, &cooked);    

    return 0;
}
