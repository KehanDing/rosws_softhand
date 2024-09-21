#!/usr/bin/env python3
import serial
import numpy as np
import pandas as pd
from ctypes import *
import rospy
import threading
from atexit import register
from serial_communication.msg import lzq

com_port = '/dev/ttyUSB0'
com_baundrate = 115200
com_freq = 20
timeout = 1


class Data(Structure):
    _fields_ = [
        ("HEAD", c_uint8),
        ("ADDRESS", c_uint8),
        ("LENGTH", c_uint8),
        ("CONTROL", c_uint8),
        ("thumb", c_float),
        ("index", c_float),
        ("middle", c_float),
        ("ring", c_float),
        ("little", c_float),
    ]


class DataUnion(Union):
    _fields_ = [
        ("data", Data),
        ("buf", c_uint8 * 24),
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
                data = ser.read(24)
                for j in range(len(data)):
                    piece_data = np.uint8(data[j])
                    data_union.buf[j] = piece_data
                if data_union.data.HEAD != 0x44:
                    rospy.logerr('Data collected is wrong ')
                    distance = 0
                    for k in range(len(data)):
                        if data_union.buf[k] == 0x44:
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

    rospy.init_node('lzq_communication', anonymous=True)
    pub = rospy.Publisher('lzq_communication', lzq, queue_size=10)
    pm = lzq()
    stamp = 0
    rate = rospy.Rate(com_freq) 
    while not rospy.is_shutdown():
        stamp += 1  # Get Stamp
        if stamp % com_freq == 0:
            rospy.loginfo('Data collected: num = ' + str(stamp))
        pm.num = stamp
        pm.thumb = data_union.data.thumb
        pm.index = data_union.data.index
        pm.middle = data_union.data.middle
        pm.ring = data_union.data.ring
        pm.little = data_union.data.little
        pub.publish(pm)
        rate.sleep()

    if output_select:
        if ser.isOpen():
            ser.close()

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

