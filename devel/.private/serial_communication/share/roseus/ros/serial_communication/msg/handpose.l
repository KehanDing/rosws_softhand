;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::handpose)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'handpose (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::HANDPOSE")
  (make-package "SERIAL_COMMUNICATION::HANDPOSE"))

(in-package "ROS")
;;//! \htmlinclude handpose.msg.html


(defclass serial_communication::handpose
  :super ros::object
  :slots (_THUMB _INDEX _MIDDLE _RING _LITTLE ))

(defmethod serial_communication::handpose
  (:init
   (&key
    ((:THUMB __THUMB) (instance serial_communication::fingerpose :init))
    ((:INDEX __INDEX) (instance serial_communication::fingerpose :init))
    ((:MIDDLE __MIDDLE) (instance serial_communication::fingerpose :init))
    ((:RING __RING) (instance serial_communication::fingerpose :init))
    ((:LITTLE __LITTLE) (instance serial_communication::fingerpose :init))
    )
   (send-super :init)
   (setq _THUMB __THUMB)
   (setq _INDEX __INDEX)
   (setq _MIDDLE __MIDDLE)
   (setq _RING __RING)
   (setq _LITTLE __LITTLE)
   self)
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
  (:serialization-length
   ()
   (+
    ;; serial_communication/fingerpose _THUMB
    (send _THUMB :serialization-length)
    ;; serial_communication/fingerpose _INDEX
    (send _INDEX :serialization-length)
    ;; serial_communication/fingerpose _MIDDLE
    (send _MIDDLE :serialization-length)
    ;; serial_communication/fingerpose _RING
    (send _RING :serialization-length)
    ;; serial_communication/fingerpose _LITTLE
    (send _LITTLE :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; serial_communication/fingerpose _THUMB
       (send _THUMB :serialize s)
     ;; serial_communication/fingerpose _INDEX
       (send _INDEX :serialize s)
     ;; serial_communication/fingerpose _MIDDLE
       (send _MIDDLE :serialize s)
     ;; serial_communication/fingerpose _RING
       (send _RING :serialize s)
     ;; serial_communication/fingerpose _LITTLE
       (send _LITTLE :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; serial_communication/fingerpose _THUMB
     (send _THUMB :deserialize buf ptr-) (incf ptr- (send _THUMB :serialization-length))
   ;; serial_communication/fingerpose _INDEX
     (send _INDEX :deserialize buf ptr-) (incf ptr- (send _INDEX :serialization-length))
   ;; serial_communication/fingerpose _MIDDLE
     (send _MIDDLE :deserialize buf ptr-) (incf ptr- (send _MIDDLE :serialization-length))
   ;; serial_communication/fingerpose _RING
     (send _RING :deserialize buf ptr-) (incf ptr- (send _RING :serialization-length))
   ;; serial_communication/fingerpose _LITTLE
     (send _LITTLE :deserialize buf ptr-) (incf ptr- (send _LITTLE :serialization-length))
   ;;
   self)
  )

(setf (get serial_communication::handpose :md5sum-) "130a0e6ad943d5ddee12bd6504eebd8e")
(setf (get serial_communication::handpose :datatype-) "serial_communication/handpose")
(setf (get serial_communication::handpose :definition-)
      "fingerpose THUMB
fingerpose INDEX
fingerpose MIDDLE
fingerpose RING
fingerpose LITTLE
================================================================================
MSG: serial_communication/fingerpose
geometry_msgs/Quaternion origin_Q_tag1
geometry_msgs/Quaternion origin_Q_tag2
geometry_msgs/Quaternion origin_Q_tag3
geometry_msgs/Vector3 YAW_DIP
geometry_msgs/Vector3 TRANS_DIP
geometry_msgs/Vector3 YAW_PIP
geometry_msgs/Vector3 TRANS_PIP
geometry_msgs/Vector3 YAW_MCP
geometry_msgs/Vector3 TRANS_MCP

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :serial_communication/handpose "130a0e6ad943d5ddee12bd6504eebd8e")


