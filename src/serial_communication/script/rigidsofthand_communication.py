#!/usr/bin/env python3
import serial
import numpy as np
import pandas as pd
from ctypes import *
import rospy
import threading
from atexit import register
from serial_communication.msg import smc_message

com_port = '/dev/ttyUSB0'
com_baundrate = 256000
com_freq = 150
data_size = 28
timeout = 1


# class Data(Structure):
#     _fields_ = [
#         ("HEAD", c_uint8),
#         ("ID", c_uint8),
#         ("control", c_uint8),
#         ("pattern", c_uint8),
#         ("time", c_uint32),
#         ("Peripheral_Data", c_float * 4),
#         ("Pressure_Data", c_float * 20),
#         ("EGaIn_Data", c_float * 20),
#         ("Joint_Angle", c_float * 20),
#         ("Input_Pressure", c_float),
#         ("Input_Temperature", c_float),
#         ("GYRO_WRIST", c_float * 10),
#         ("GYRO_PALM", c_float * 10),
#         ("checkSum", c_uint8),
#         ("num", c_uint8),
#         ("ENTER", c_uint8),
#         ("NEWLINE", c_uint8),
#     ]
class Data(Structure):
    _fields_ = [
        ("HEAD", c_uint8),
        ("ID", c_uint8),
        ("control", c_uint8),
        ("pattern", c_uint8),
        ("time", c_uint32),
        ("Target", c_float),
        ("Feedback", c_float),
        ("SMC_UC", c_float),
        ("VALVE_MODE", c_int32),
        ("checkSum", c_uint8),
        ("num", c_uint8),
        ("ENTER", c_uint8),
        ("NEWLINE", c_uint8),
    ]

class DataUnion(Union):
    _fields_ = [
        ("data", Data),
        ("buf", c_uint8 * data_size),
    ]


def hex_send(string):
    hex_data = bytes.fromhex(string)
    return hex_data


def com_open():
    com_port = rospy.get_param('port')
    com_baudrate = rospy.get_param('baudrate')
    try:
        ser = serial.Serial(port=com_port,
                            baudrate=com_baudrate,
                            parity=serial.PARITY_NONE,
                            stopbits=serial.STOPBITS_ONE,
                            bytesize=serial.EIGHTBITS,
                            timeout=timeout)
        if ser.isOpen():
            rospy.loginfo(ser.name + "open success")
            return ser
        else:
            rospy.logerr(ser.name + "open failed")
    # except rospy.ROSInterruptException:
    except KeyboardInterrupt:
        if ser.isOpen():
            ser.close()


def read_data(ser, data_union):
    try:
        while 1:
            if ser.isOpen():
                data = ser.read(data_size)
                for j in range(len(data)):
                    piece_data = np.uint8(data[j])
                    data_union.buf[j] = piece_data
                if data_union.data.HEAD != 0x55:
                    rospy.logerr('Data collected is wrong ')
                    distance = 0
                    for k in range(len(data)):
                        if data_union.buf[k] == 0x55:
                            distance = k
                            break
                    ser.read(distance)
            else:
                break
    except KeyboardInterrupt:
        if ser.isOpen():
            ser.close()


def ros_talker(ser, data_union):

    com_freq = rospy.get_param('com_freq')

    rospy.init_node('rigidsofthand_communication', anonymous=True)
    pub = rospy.Publisher('rigidsofthand_communication', smc_message, queue_size=10)
    pm = smc_message()
    stamp = 0
    rate = rospy.Rate(com_freq) 
    while not rospy.is_shutdown():
        stamp += 1  # Get Stamp
        if stamp % com_freq == 0:
            rospy.loginfo('Data collected: num = ' + str(stamp))
        # data to be send
        pm.ID = data_union.data.ID
        pm.time = data_union.data.time
        pm.target_pressure = data_union.data.Target
        pm.feedback_pressure = data_union.data.Feedback
        pm.error = pm.target_pressure - pm.feedback_pressure
        pm.smc_uc = data_union.data.SMC_UC
        pm.valve_mode = data_union.data.VALVE_MODE
        pub.publish(pm)
        rate.sleep()

@register
def _atexit():
    print('process interrupt________________atexit__________________')


if __name__ == '__main__':
    print('Com_communication')
    try:
        data_union = DataUnion()
        ser = com_open()
        t_read = threading.Thread(target=read_data, args=(ser, data_union))
        t_read.start()
        ros_talker(ser, data_union)

    except rospy.ROSInterruptException:
        pass

