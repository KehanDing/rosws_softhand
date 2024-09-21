#ifndef __PULSOGRAPH_H
#define __PULSOGRAPH_H

#include <stdint.h>
	 
/*
/*Transfered Commandf*/

uint8_t	start_collect[4] = {0xF0, 0x2F, 0x01, 0x32};	//start the continum collecting
uint8_t	stop_collect[4] = {0xF0, 0x2F, 0x01, 0x33};	//stop the continum collecting

/*Recieved Data*/
typedef struct{
	uint8_t		Head; 		//0xF0
    uint8_t		address; 	//0x1F
    uint8_t		length;		//0x10
    uint8_t		control;	//0x32
    uint16_t	static_pressure_1;
    uint16_t 	dynamic_pulse_1;
    uint16_t 	static_pressure_2;
    uint16_t 	dynamic_pulse_2;
    uint16_t 	static_pressure_3;
    uint16_t 	dynamic_pulse_3;
    uint16_t 	EGG_signal;
    uint8_t 	check;											
}PULSO_DATA;	//19bytes

typedef union
{
    uint8_t   buf[19];    
    PULSO_DATA Data;
}PULSO_DATA_UnData;	

#endif
