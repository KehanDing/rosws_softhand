;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::finger_imu)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'finger_imu (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::FINGER_IMU")
  (make-package "SERIAL_COMMUNICATION::FINGER_IMU"))

(in-package "ROS")
;;//! \htmlinclude finger_imu.msg.html


(defclass serial_communication::finger_imu
  :super ros::object
  :slots (_PIP _DIP _MCP ))

(defmethod serial_communication::finger_imu
  (:init
   (&key
    ((:PIP __PIP) (instance serial_communication::imu_data :init))
    ((:DIP __DIP) (instance serial_communication::imu_data :init))
    ((:MCP __MCP) (instance serial_communication::imu_data :init))
    )
   (send-super :init)
   (setq _PIP __PIP)
   (setq _DIP __DIP)
   (setq _MCP __MCP)
   self)
  (:PIP
   (&rest __PIP)
   (if (keywordp (car __PIP))
       (send* _PIP __PIP)
     (progn
       (if __PIP (setq _PIP (car __PIP)))
       _PIP)))
  (:DIP
   (&rest __DIP)
   (if (keywordp (car __DIP))
       (send* _DIP __DIP)
     (progn
       (if __DIP (setq _DIP (car __DIP)))
       _DIP)))
  (:MCP
   (&rest __MCP)
   (if (keywordp (car __MCP))
       (send* _MCP __MCP)
     (progn
       (if __MCP (setq _MCP (car __MCP)))
       _MCP)))
  (:serialization-length
   ()
   (+
    ;; serial_communication/imu_data _PIP
    (send _PIP :serialization-length)
    ;; serial_communication/imu_data _DIP
    (send _DIP :serialization-length)
    ;; serial_communication/imu_data _MCP
    (send _MCP :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; serial_communication/imu_data _PIP
       (send _PIP :serialize s)
     ;; serial_communication/imu_data _DIP
       (send _DIP :serialize s)
     ;; serial_communication/imu_data _MCP
       (send _MCP :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; serial_communication/imu_data _PIP
     (send _PIP :deserialize buf ptr-) (incf ptr- (send _PIP :serialization-length))
   ;; serial_communication/imu_data _DIP
     (send _DIP :deserialize buf ptr-) (incf ptr- (send _DIP :serialization-length))
   ;; serial_communication/imu_data _MCP
     (send _MCP :deserialize buf ptr-) (incf ptr- (send _MCP :serialization-length))
   ;;
   self)
  )

(setf (get serial_communication::finger_imu :md5sum-) "6bf62a0961009be9a01fecdc8cf84a21")
(setf (get serial_communication::finger_imu :datatype-) "serial_communication/finger_imu")
(setf (get serial_communication::finger_imu :definition-)
      "imu_data PIP
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



(provide :serial_communication/finger_imu "6bf62a0961009be9a01fecdc8cf84a21")


