# Rigid-Soft Finger

	# Serial communication
	sudo cutecom	//打开cutecom串口调试工具
	dmesg | grep ttyS*	//查看连接的USB设备
	sudo chmod 777 /dev/ttyUSB0	//修改USB0权限，在无法打开USB0串口时使用
	roslaunch serial_communication serial_communication.launch	//打开串口传输并发布串口数据
	rostopic echo /Controler_message	//查看topic消息
