;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::hand_imu)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'hand_imu (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::HAND_IMU")
  (make-package "SERIAL_COMMUNICATION::HAND_IMU"))

(in-package "ROS")
;;//! \htmlinclude hand_imu.msg.html


(defclass serial_communication::hand_imu
  :super ros::object
  :slots (_ID _time _THUMB _INDEX _MIDDLE _RING _LITTLE _PALM ))

(defmethod serial_communication::hand_imu
  (:init
   (&key
    ((:ID __ID) 0)
    ((:time __time) 0)
    ((:THUMB __THUMB) (instance serial_communication::finger_imu :init))
    ((:INDEX __INDEX) (instance serial_communication::finger_imu :init))
    ((:MIDDLE __MIDDLE) (instance serial_communication::finger_imu :init))
    ((:RING __RING) (instance serial_communication::finger_imu :init))
    ((:LITTLE __LITTLE) (instance serial_communication::finger_imu :init))
    ((:PALM __PALM) (instance serial_communication::imu_data :init))
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _time (round __time))
   (setq _THUMB __THUMB)
   (setq _INDEX __INDEX)
   (setq _MIDDLE __MIDDLE)
   (setq _RING __RING)
   (setq _LITTLE __LITTLE)
   (setq _PALM __PALM)
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:THUMB
   (&rest __THUMB)
   (if (keywordp (car __THUMB))
       (send* _THUMB __THUMB)
     (progn
       (if __THUMB (setq _THUMB (car __THUMB)))
       _THUMB)))
  (:INDEX
   (&rest __INDEX)
   (if (keywordp (car __INDEX))
       (send* _INDEX __INDEX)
     (progn
       (if __INDEX (setq _INDEX (car __INDEX)))
       _INDEX)))
  (:MIDDLE
   (&rest __MIDDLE)
   (if (keywordp (car __MIDDLE))
       (send* _MIDDLE __MIDDLE)
     (progn
       (if __MIDDLE (setq _MIDDLE (car __MIDDLE)))
       _MIDDLE)))
  (:RING
   (&rest __RING)
   (if (keywordp (car __RING))
       (send* _RING __RING)
     (progn
       (if __RING (setq _RING (car __RING)))
       _RING)))
  (:LITTLE
   (&rest __LITTLE)
   (if (keywordp (car __LITTLE))
       (send* _LITTLE __LITTLE)
     (progn
       (if __LITTLE (setq _LITTLE (car __LITTLE)))
       _LITTLE)))
  (:PALM
   (&rest __PALM)
   (if (keywordp (car __PALM))
       (send* _PALM __PALM)
     (progn
       (if __PALM (setq _PALM (car __PALM)))
       _PALM)))
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; uint16 _time
    2
    ;; serial_communication/finger_imu _THUMB
    (send _THUMB :serialization-length)
    ;; serial_communication/finger_imu _INDEX
    (send _INDEX :serialization-length)
    ;; serial_communication/finger_imu _MIDDLE
    (send _MIDDLE :serialization-length)
    ;; serial_communication/finger_imu _RING
    (send _RING :serialization-length)
    ;; serial_communication/finger_imu _LITTLE
    (send _LITTLE :serialization-length)
    ;; serial_communication/imu_data _PALM
    (send _PALM :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; uint16 _time
       (write-word _time s)
     ;; serial_communication/finger_imu _THUMB
       (send _THUMB :serialize s)
     ;; serial_communication/finger_imu _INDEX
       (send _INDEX :serialize s)
     ;; serial_communication/finger_imu _MIDDLE
       (send _MIDDLE :serialize s)
     ;; serial_communication/finger_imu _RING
       (send _RING :serialize s)
     ;; serial_communication/finger_imu _LITTLE
       (send _LITTLE :serialize s)
     ;; serial_communication/imu_data _PALM
       (send _PALM :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _time
     (setq _time (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; serial_communication/finger_imu _THUMB
     (send _THUMB :deserialize buf ptr-) (incf ptr- (send _THUMB :serialization-length))
   ;; serial_communication/finger_imu _INDEX
     (send _INDEX :deserialize buf ptr-) (incf ptr- (send _INDEX :serialization-length))
   ;; serial_communication/finger_imu _MIDDLE
     (send _MIDDLE :deserialize buf ptr-) (incf ptr- (send _MIDDLE :serialization-length))
   ;; serial_communication/finger_imu _RING
     (send _RING :deserialize buf ptr-) (incf ptr- (send _RING :serialization-length))
   ;; serial_communication/finger_imu _LITTLE
     (send _LITTLE :deserialize buf ptr-) (incf ptr- (send _LITTLE :serialization-length))
   ;; serial_communication/imu_data _PALM
     (send _PALM :deserialize buf ptr-) (incf ptr- (send _PALM :serialization-length))
   ;;
   self)
  )

(setf (get serial_communication::hand_imu :md5sum-) "ea982f9506f64da059eb7d3969f058f4")
(setf (get serial_communication::hand_imu :datatype-) "serial_communication/hand_imu")
(setf (get serial_communication::hand_imu :definition-)
      "uint8 ID
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



(provide :serial_communication/hand_imu "ea982f9506f64da059eb7d3969f058f4")


