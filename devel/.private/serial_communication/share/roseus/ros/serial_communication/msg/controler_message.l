;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::controler_message)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'controler_message (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::CONTROLER_MESSAGE")
  (make-package "SERIAL_COMMUNICATION::CONTROLER_MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude controler_message.msg.html


(defclass serial_communication::controler_message
  :super ros::object
  :slots (_ID _time _Pressure_Data _EGaIn_Data _Force_Data _IMU_Data ))

(defmethod serial_communication::controler_message
  (:init
   (&key
    ((:ID __ID) 0)
    ((:time __time) 0)
    ((:Pressure_Data __Pressure_Data) (instance serial_communication::hand_pressure :init))
    ((:EGaIn_Data __EGaIn_Data) (instance serial_communication::hand_egain :init))
    ((:Force_Data __Force_Data) (instance serial_communication::hand_force :init))
    ((:IMU_Data __IMU_Data) (instance serial_communication::hand_imu :init))
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _time (round __time))
   (setq _Pressure_Data __Pressure_Data)
   (setq _EGaIn_Data __EGaIn_Data)
   (setq _Force_Data __Force_Data)
   (setq _IMU_Data __IMU_Data)
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:Pressure_Data
   (&rest __Pressure_Data)
   (if (keywordp (car __Pressure_Data))
       (send* _Pressure_Data __Pressure_Data)
     (progn
       (if __Pressure_Data (setq _Pressure_Data (car __Pressure_Data)))
       _Pressure_Data)))
  (:EGaIn_Data
   (&rest __EGaIn_Data)
   (if (keywordp (car __EGaIn_Data))
       (send* _EGaIn_Data __EGaIn_Data)
     (progn
       (if __EGaIn_Data (setq _EGaIn_Data (car __EGaIn_Data)))
       _EGaIn_Data)))
  (:Force_Data
   (&rest __Force_Data)
   (if (keywordp (car __Force_Data))
       (send* _Force_Data __Force_Data)
     (progn
       (if __Force_Data (setq _Force_Data (car __Force_Data)))
       _Force_Data)))
  (:IMU_Data
   (&rest __IMU_Data)
   (if (keywordp (car __IMU_Data))
       (send* _IMU_Data __IMU_Data)
     (progn
       (if __IMU_Data (setq _IMU_Data (car __IMU_Data)))
       _IMU_Data)))
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; uint16 _time
    2
    ;; serial_communication/hand_pressure _Pressure_Data
    (send _Pressure_Data :serialization-length)
    ;; serial_communication/hand_egain _EGaIn_Data
    (send _EGaIn_Data :serialization-length)
    ;; serial_communication/hand_force _Force_Data
    (send _Force_Data :serialization-length)
    ;; serial_communication/hand_imu _IMU_Data
    (send _IMU_Data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; uint16 _time
       (write-word _time s)
     ;; serial_communication/hand_pressure _Pressure_Data
       (send _Pressure_Data :serialize s)
     ;; serial_communication/hand_egain _EGaIn_Data
       (send _EGaIn_Data :serialize s)
     ;; serial_communication/hand_force _Force_Data
       (send _Force_Data :serialize s)
     ;; serial_communication/hand_imu _IMU_Data
       (send _IMU_Data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _time
     (setq _time (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; serial_communication/hand_pressure _Pressure_Data
     (send _Pressure_Data :deserialize buf ptr-) (incf ptr- (send _Pressure_Data :serialization-length))
   ;; serial_communication/hand_egain _EGaIn_Data
     (send _EGaIn_Data :deserialize buf ptr-) (incf ptr- (send _EGaIn_Data :serialization-length))
   ;; serial_communication/hand_force _Force_Data
     (send _Force_Data :deserialize buf ptr-) (incf ptr- (send _Force_Data :serialization-length))
   ;; serial_communication/hand_imu _IMU_Data
     (send _IMU_Data :deserialize buf ptr-) (incf ptr- (send _IMU_Data :serialization-length))
   ;;
   self)
  )

(setf (get serial_communication::controler_message :md5sum-) "01633c681b9e513b3493801e5ce828b9")
(setf (get serial_communication::controler_message :datatype-) "serial_communication/controler_message")
(setf (get serial_communication::controler_message :definition-)
      "uint8 ID
uint16 time
hand_pressure Pressure_Data
hand_egain EGaIn_Data
hand_force Force_Data
hand_imu IMU_Data
================================================================================
MSG: serial_communication/hand_pressure
finger_pressure THUMB0
finger_pressure THUMB1
finger_pressure INDEX
finger_pressure MIDDLE
finger_pressure RING
finger_pressure LITTLE

================================================================================
MSG: serial_communication/finger_pressure
float32 IP
float32 MCPB
float32 MCPAL
float32 MCPAR

================================================================================
MSG: serial_communication/hand_egain
finger_egain THUMB0
finger_egain THUMB1
finger_egain INDEX
finger_egain MIDDLE
finger_egain RING
finger_egain LITTLE

================================================================================
MSG: serial_communication/finger_egain
float32 DIP
float32 PIP
float32 MCPL
float32 MCPR

================================================================================
MSG: serial_communication/hand_force
finger_force THUMB0
finger_force THUMB1
finger_force INDEX
finger_force MIDDLE
finger_force RING
finger_force LITTLE

================================================================================
MSG: serial_communication/finger_force
float32 FORCE1
float32 FORCE2
float32 FORCE3
float32 FORCE4

================================================================================
MSG: serial_communication/hand_imu
uint8 ID
uint16 time
finger_imu THUMB
finger_imu INDEX
finger_imu MIDDLE
finger_imu RING
finger_imu LITTLE
imu_data PALM
================================================================================
MSG: serial_communication/finger_imu
imu_data PIP
imu_data DIP
imu_data MCP
================================================================================
MSG: serial_communication/imu_data
float32 q0
float32 q1
float32 q2
float32 q3
float32 roll
float32 pitch
float32 yaw
")



(provide :serial_communication/controler_message "01633c681b9e513b3493801e5ce828b9")


