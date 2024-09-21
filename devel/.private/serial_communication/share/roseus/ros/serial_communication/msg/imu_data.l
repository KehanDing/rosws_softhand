;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::imu_data)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'imu_data (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::IMU_DATA")
  (make-package "SERIAL_COMMUNICATION::IMU_DATA"))

(in-package "ROS")
;;//! \htmlinclude imu_data.msg.html


(defclass serial_communication::imu_data
  :super ros::object
  :slots (_q0 _q1 _q2 _q3 _roll _pitch _yaw ))

(defmethod serial_communication::imu_data
  (:init
   (&key
    ((:q0 __q0) 0.0)
    ((:q1 __q1) 0.0)
    ((:q2 __q2) 0.0)
    ((:q3 __q3) 0.0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _q0 (float __q0))
   (setq _q1 (float __q1))
   (setq _q2 (float __q2))
   (setq _q3 (float __q3))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   self)
  (:q0
   (&optional __q0)
   (if __q0 (setq _q0 __q0)) _q0)
  (:q1
   (&optional __q1)
   (if __q1 (setq _q1 __q1)) _q1)
  (:q2
   (&optional __q2)
   (if __q2 (setq _q2 __q2)) _q2)
  (:q3
   (&optional __q3)
   (if __q3 (setq _q3 __q3)) _q3)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; float32 _q0
    4
    ;; float32 _q1
    4
    ;; float32 _q2
    4
    ;; float32 _q3
    4
    ;; float32 _roll
    4
    ;; float32 _pitch
    4
    ;; float32 _yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _q0
       (sys::poke _q0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q1
       (sys::poke _q1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q2
       (sys::poke _q2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q3
       (sys::poke _q3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _q0
     (setq _q0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q1
     (setq _q1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q2
     (setq _q2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q3
     (setq _q3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get serial_communication::imu_data :md5sum-) "5d90a0bd5bc5bbd22e7c1d361f155ca1")
(setf (get serial_communication::imu_data :datatype-) "serial_communication/imu_data")
(setf (get serial_communication::imu_data :definition-)
      "float32 q0
float32 q1
float32 q2
float32 q3
float32 roll
float32 pitch
float32 yaw
")



(provide :serial_communication/imu_data "5d90a0bd5bc5bbd22e7c1d361f155ca1")


