import serial
import serial.tools.list_ports

# 获取所有串口设备实例。
# 如果没找到串口设备，则输出：“无串口设备。”
# 如果找到串口设备，则依次输出每个设备对应的串口号和描述信息。
ports_list = list(serial.tools.list_ports.comports())
if len(ports_list) <= 0:
    print("无串口设备。")
else:
    print("可用的串口设备如下：")
    for comport in ports_list:
        print(list(comport)[0], list(comport)[1])

ser = serial.Serial()


def port_open_recv():#对串口的参数进行配置
    ser.port='com3'
    ser.baudrate=115200
    ser.bytesize=8
    ser.stopbits=1
    ser.parity="N"#奇偶校验位
    ser.open()
    if ser.isOpen:
        print("串口打开成功！")
    else:
        print("串口打开失败！")
#isOpen()函数来查看串口的开闭状态


def port_close():
    ser.close()
    if ser.isOpen:
        print("串口关闭失败！")
    else:
        print("串口关闭成功！")


def send_message(send_data):
    if ser.isOpen:
        ser.write(send_data.encode('gbk'))#编码
        print("发送成功",send_data)
    else:
        print("发送失败！")


def read_message():
    if ser.isOpen:
        receive_data = ser.read(ser.inWaiting())
        receive_data.decode('ascii', 'ignore')  # 以字符串的格式接收需要重新转码
        receive_data = str(receive_data, 'gbk')  # 转换成 'gbk' 编码
        print("接受数据：", receive_data)
    else:
        print("发送失败！")


if __name__ == '__main__':
    ser = serial.Serial('COM2', 115200, timeout=5)  ##连接串口，打开

    Write = ser.write(b'Hello\n')  ##发送数据
    Read = ser.read()  ###接收1个字节数据
    print(Read)

    Write = ser.write(b'Hello\n')  ##发送数据
    Read = ser.readline()  ##接收一行数据
    print(Read)

    Write = ser.write(b'Hello\n')  ##发送数据
    Read = ser.read_all()  ###接收所有数据
    print(Read)

    Write = ser.write(b'Hello\n')  ##发送数据
    Read = ser.readlines()  ###读多行数据
    print(Read)

    ser.close()  ###关闭串口连接