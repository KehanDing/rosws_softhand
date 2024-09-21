#ifndef __PACKAGE_H
#define __PACKAGE_H

#include <stdint.h>
	 
/*
	Finger_Channel_Pressure[]
	thumb 0-4 else 0-2
	0 float IP_Pressure;				// 0-250kPa
	1 float MCP_Bending_Pressure;		//MCPB -250kPa - +250kPa 
	2 float MCP_Abduction_Pressure;		//MCPA -250kPa - +250kPa 
	3 float CMC_Bending_Pressure;		//CMC B-250kPa - +250kPa 
	4 float CMC_Abduction_Pressure;		//CMCA-250kPa - +250kPa 
	*/

/*Transfered Commandf*/
typedef struct 
{
    uint8_t 	Head;											
	uint8_t   	ID;												
	uint8_t   	control;										
	uint8_t   	pattern;																			
	uint32_t	time;	
	float   	Peripheral_Target[4];										
    float   	THUMB_Channel_Pressure[4];	
	float   	INDEX_Channel_Pressure[4];	
	float   	MIDDLE_Channel_Pressure[4];		
	float   	RING_Channel_Pressure[4];			
	float   	LITTLE_Channel_Pressure[4];			
	float    	Other_Target;								
    uint8_t   	checkSum;											
	uint8_t   	num;												   	
	uint8_t   	ENTER;												
	uint8_t  	NEWLINE;												
}TX_Controler_Value;//112bytes

typedef union
{
    uint8_t   buf[112];    
    TX_Controler_Value Data;
}Tx_Controler_UnData;					


/*Recieved Data*/
typedef struct 
{
    // uint8_t 	 Head;											
	// uint8_t   	 ID;												
	// uint8_t   	 control;										
	// uint8_t   	 pattern;																			
	// uint32_t	 time;
	// float		 Peripheral_Data[4];											
    // float		 Pressure_Data[20];		
	// float		 MPU_Data[16][7];		
	// float        EGaIn_Data[20];						
	// float   	 Joint_Angle[20];	
	// float		 Input_Pressure;
	// float		 Input_Temperature;
	// float		 GYRO_WRIST[10];	
	// float		 GYRO_PALM[10];									
    // uint8_t   	 checkSum;									
	// uint8_t   	 num;									
	// uint8_t   	 ENTER;							
	// uint8_t  	 NEWLINE;		

	uint8_t 	 Head;											
	uint8_t   	 ID;												
	uint8_t   	 control;										
	uint8_t   	 pattern;																			
	uint32_t	 time;	
	int16_t		 MPU_Data[16][4];	
	float		 Pressure_Data[20];
    uint8_t   	 checkSum;									
	uint8_t   	 num;									
	uint8_t   	 ENTER;							
	uint8_t  	 NEWLINE;							
}Rx_Controler_Value;//356 + 448 = 804bytes

typedef union
{
    uint8_t   buf[220];    
    Rx_Controler_Value Data;
}Rx_Controler_UnData;



/* only IMU data */
typedef struct 
{
    uint8_t 	 Head;											
	uint8_t   	 ID;												
	uint8_t   	 control;										
	uint8_t   	 pattern;																			
	uint32_t	 time;
//	float		 MPU_Data[9][7];	
	int16_t		 MPU_Data[16][4];	
	float		 Pressure_Data[20];
    uint8_t   	 checkSum;									
	uint8_t   	 num;									
	uint8_t   	 ENTER;							
	uint8_t  	 NEWLINE;								
}Rx_Controler_Value_IMU;//12 + 448 = 460bytes

typedef union
{
//    uint8_t   buf[264];    
	// uint8_t   buf[96];
	// uint8_t   buf[268];
	uint8_t   buf[220];
    Rx_Controler_Value_IMU Data;
}Rx_Controler_UnData_IMU;




#endif
