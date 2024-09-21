;; Auto-generated. Do not edit!


(when (boundp 'nano_17_ethercat::FT_nano17)
  (if (not (find-package "NANO_17_ETHERCAT"))
    (make-package "NANO_17_ETHERCAT"))
  (shadow 'FT_nano17 (find-package "NANO_17_ETHERCAT")))
(unless (find-package "NANO_17_ETHERCAT::FT_NANO17")
  (make-package "NANO_17_ETHERCAT::FT_NANO17"))

(in-package "ROS")
;;//! \htmlinclude FT_nano17.msg.html


(defclass nano_17_ethercat::FT_nano17
  :super ros::object
  :slots (_TORQUE_X _TORQUE_Y _TORQUE_Z _FORCE_X _FORCE_Y _FORCE_Z ))

(defmethod nano_17_ethercat::FT_nano17
  (:init
   (&key
    ((:TORQUE_X __TORQUE_X) 0.0)
    ((:TORQUE_Y __TORQUE_Y) 0.0)
    ((:TORQUE_Z __TORQUE_Z) 0.0)
    ((:FORCE_X __FORCE_X) 0.0)
    ((:FORCE_Y __FORCE_Y) 0.0)
    ((:FORCE_Z __FORCE_Z) 0.0)
    )
   (send-super :init)
   (setq _TORQUE_X (float __TORQUE_X))
   (setq _TORQUE_Y (float __TORQUE_Y))
   (setq _TORQUE_Z (float __TORQUE_Z))
   (setq _FORCE_X (float __FORCE_X))
   (setq _FORCE_Y (float __FORCE_Y))
   (setq _FORCE_Z (float __FORCE_Z))
   self)
  (:TORQUE_X
   (&optional __TORQUE_X)
   (if __TORQUE_X (setq _TORQUE_X __TORQUE_X)) _TORQUE_X)
  (:TORQUE_Y
   (&optional __TORQUE_Y)
   (if __TORQUE_Y (setq _TORQUE_Y __TORQUE_Y)) _TORQUE_Y)
  (:TORQUE_Z
   (&optional __TORQUE_Z)
   (if __TORQUE_Z (setq _TORQUE_Z __TORQUE_Z)) _TORQUE_Z)
  (:FORCE_X
   (&optional __FORCE_X)
   (if __FORCE_X (setq _FORCE_X __FORCE_X)) _FORCE_X)
  (:FORCE_Y
   (&optional __FORCE_Y)
   (if __FORCE_Y (setq _FORCE_Y __FORCE_Y)) _FORCE_Y)
  (:FORCE_Z
   (&optional __FORCE_Z)
   (if __FORCE_Z (setq _FORCE_Z __FORCE_Z)) _FORCE_Z)
  (:serialization-length
   ()
   (+
    ;; float32 _TORQUE_X
    4
    ;; float32 _TORQUE_Y
    4
    ;; float32 _TORQUE_Z
    4
    ;; float32 _FORCE_X
    4
    ;; float32 _FORCE_Y
    4
    ;; float32 _FORCE_Z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _TORQUE_X
       (sys::poke _TORQUE_X (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _TORQUE_Y
       (sys::poke _TORQUE_Y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _TORQUE_Z
       (sys::poke _TORQUE_Z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FORCE_X
       (sys::poke _FORCE_X (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FORCE_Y
       (sys::poke _FORCE_Y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FORCE_Z
       (sys::poke _FORCE_Z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _TORQUE_X
     (setq _TORQUE_X (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _TORQUE_Y
     (setq _TORQUE_Y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _TORQUE_Z
     (setq _TORQUE_Z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FORCE_X
     (setq _FORCE_X (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FORCE_Y
     (setq _FORCE_Y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FORCE_Z
     (setq _FORCE_Z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get nano_17_ethercat::FT_nano17 :md5sum-) "b3cc10406904387a2b764bbc39a449c3")
(setf (get nano_17_ethercat::FT_nano17 :datatype-) "nano_17_ethercat/FT_nano17")
(setf (get nano_17_ethercat::FT_nano17 :definition-)
      "float32 TORQUE_X
float32 TORQUE_Y
float32 TORQUE_Z
float32 FORCE_X
float32 FORCE_Y
float32 FORCE_Z

")



(provide :nano_17_ethercat/FT_nano17 "b3cc10406904387a2b764bbc39a449c3")


