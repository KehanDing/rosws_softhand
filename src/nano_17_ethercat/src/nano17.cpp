/* Master 0, Slave 1, "ATI EtherCAT F/T Sensor"
 * Vendor ID:       0x00000732
 * Product code:    0x26483052
 * Revision number: 0x00010111
 */
#include "ecrt.h"
#include "ros/ros.h"
#include "../include/nano_17_ethercat/nano17.hpp"

bool origin_flag = false;

ec_pdo_entry_info_t slave_1_pdo_entries[] = {
    {0x7010, 0x01, 32},
    {0x7010, 0x02, 32},
    {0x6000, 0x01, 32},
    {0x6000, 0x02, 32},
    {0x6000, 0x03, 32},
    {0x6000, 0x04, 32},
    {0x6000, 0x05, 32},
    {0x6000, 0x06, 32},
    {0x6010, 0x00, 32},
    {0x6020, 0x00, 32},
};

ec_pdo_info_t slave_1_pdos[] = {
    {0x1601, 2, slave_1_pdo_entries + 0},
    {0x1a00, 8, slave_1_pdo_entries + 2},
};

ec_sync_info_t slave_1_syncs[] = {
    {0, EC_DIR_OUTPUT, 0, NULL, EC_WD_DISABLE},
    {1, EC_DIR_INPUT, 0, NULL, EC_WD_DISABLE},
    {2, EC_DIR_OUTPUT, 1, slave_1_pdos + 0, EC_WD_ENABLE},
    {3, EC_DIR_INPUT, 1, slave_1_pdos + 1, EC_WD_DISABLE},
    {0xff}
};

void nano17DataPublisher(TARGET_NANO17 *ptr, nano_17_ethercat::FT_nano17 &ft_nano17){

    static TARGET_NANO17 ptr_first;

    float ft[6] = {0};

    if (origin_flag == true) {
        for(int i=0;i<8;i++){
            ptr_first.data[i] = ptr->data[i];
        }
        origin_flag = false;   
    }
    else{
        for(int i=0;i<6;i++){
            ft[i] = (ptr->data[i] * 1.0 - ptr_first.data[i]) / 1000000.0;
        }
    }

    ft_nano17.TORQUE_X = ft[3];
    ft_nano17.TORQUE_Y = ft[4];
    ft_nano17.TORQUE_Z = ft[5];
    ft_nano17.FORCE_X  = ft[0];
    ft_nano17.FORCE_Y  = ft[1];
    ft_nano17.FORCE_Z  = ft[2];     
}