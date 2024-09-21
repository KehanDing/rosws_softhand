#ifndef __NANO17__HPP__
#define __NANO17__HPP__

#include "ecrt.h"
#include <nano_17_ethercat/FT_nano17.h>

typedef struct _TARGET_NANO17 {
    int32_t data[8];
} TARGET_NANO17;	// 32.


extern ec_pdo_entry_info_t slave_1_pdo_entries[];
extern ec_pdo_info_t slave_1_pdos[];
extern ec_sync_info_t slave_1_syncs[];

void nano17DataPublisher(TARGET_NANO17 *ptr, nano_17_ethercat::FT_nano17 &ft_nano17);

#endif
