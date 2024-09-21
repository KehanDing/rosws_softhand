;; Auto-generated. Do not edit!


(when (boundp 'obtain_angle::fingerpose)
  (if (not (find-package "OBTAIN_ANGLE"))
    (make-package "OBTAIN_ANGLE"))
  (shadow 'fingerpose (find-package "OBTAIN_ANGLE")))
(unless (find-package "OBTAIN_ANGLE::FINGERPOSE")
  (make-package "OBTAIN_ANGLE::FINGERPOSE"))

(in-package "ROS")
;;//! \htmlinclude fingerpose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass obtain_angle::fingerpose
  :super ros::object
  :slots (_origin_Q_tag1 _origin_Q_tag2 _origin_Q_tag3 _YAW_DIP _TRANS_DIP _YAW_PIP _TRANS_PIP _YAW_MCP _TRANS_MCP ))

(defmethod obtain_angle::fingerpose
  (:init
   (&key
    ((:origin_Q_tag1 __origin_Q_tag1) (instance geometry_msgs::Quaternion :init))
    ((:origin_Q_tag2 __origin_Q_tag2) (instance geometry_msgs::Quaternion :init))
    ((:origin_Q_tag3 __origin_Q_tag3) (instance geometry_msgs::Quaternion :init))
    ((:YAW_DIP __YAW_DIP) (instance geometry_msgs::Vector3 :init))
    ((:TRANS_DIP __TRANS_DIP) (instance geometry_msgs::Vector3 :init))
    ((:YAW_PIP __YAW_PIP) (instance geometry_msgs::Vector3 :init))
    ((:TRANS_PIP __TRANS_PIP) (instance geometry_msgs::Vector3 :init))
    ((:YAW_MCP __YAW_MCP) (instance geometry_msgs::Vector3 :init))
    ((:TRANS_MCP __TRANS_MCP) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _origin_Q_tag1 __origin_Q_tag1)
   (setq _origin_Q_tag2 __origin_Q_tag2)
   (setq _origin_Q_tag3 __origin_Q_tag3)
   (setq _YAW_DIP __YAW_DIP)
   (setq _TRANS_DIP __TRANS_DIP)
   (setq _YAW_PIP __YAW_PIP)
   (setq _TRANS_PIP __TRANS_PIP)
   (setq _YAW_MCP __YAW_MCP)
   (setq _TRANS_MCP __TRANS_MCP)
   self)
  (:origin_Q_tag1
   (&rest __origin_Q_tag1)
   (if (keywordp (car __origin_Q_tag1))
       (send* _origin_Q_tag1 __origin_Q_tag1)
     (progn
       (if __origin_Q_tag1 (setq _origin_Q_tag1 (car __origin_Q_tag1)))
       _origin_Q_tag1)))
  (:origin_Q_tag2
   (&rest __origin_Q_tag2)
   (if (keywordp (car __origin_Q_tag2))
       (send* _origin_Q_tag2 __origin_Q_tag2)
     (progn
       (if __origin_Q_tag2 (setq _origin_Q_tag2 (car __origin_Q_tag2)))
       _origin_Q_tag2)))
  (:origin_Q_tag3
   (&rest __origin_Q_tag3)
   (if (keywordp (car __origin_Q_tag3))
       (send* _origin_Q_tag3 __origin_Q_tag3)
     (progn
       (if __origin_Q_tag3 (setq _origin_Q_tag3 (car __origin_Q_tag3)))
       _origin_Q_tag3)))
  (:YAW_DIP
   (&rest __YAW_DIP)
   (if (keywordp (car __YAW_DIP))
       (send* _YAW_DIP __YAW_DIP)
     (progn
       (if __YAW_DIP (setq _YAW_DIP (car __YAW_DIP)))
       _YAW_DIP)))
  (:TRANS_DIP
   (&rest __TRANS_DIP)
   (if (keywordp (car __TRANS_DIP))
       (send* _TRANS_DIP __TRANS_DIP)
     (progn
       (if __TRANS_DIP (setq _TRANS_DIP (car __TRANS_DIP)))
       _TRANS_DIP)))
  (:YAW_PIP
   (&rest __YAW_PIP)
   (if (keywordp (car __YAW_PIP))
       (send* _YAW_PIP __YAW_PIP)
     (progn
       (if __YAW_PIP (setq _YAW_PIP (car __YAW_PIP)))
       _YAW_PIP)))
  (:TRANS_PIP
   (&rest __TRANS_PIP)
   (if (keywordp (car __TRANS_PIP))
       (send* _TRANS_PIP __TRANS_PIP)
     (progn
       (if __TRANS_PIP (setq _TRANS_PIP (car __TRANS_PIP)))
       _TRANS_PIP)))
  (:YAW_MCP
   (&rest __YAW_MCP)
   (if (keywordp (car __YAW_MCP))
       (send* _YAW_MCP __YAW_MCP)
     (progn
       (if __YAW_MCP (setq _YAW_MCP (car __YAW_MCP)))
       _YAW_MCP)))
  (:TRANS_MCP
   (&rest __TRANS_MCP)
   (if (keywordp (car __TRANS_MCP))
       (send* _TRANS_MCP __TRANS_MCP)
     (progn
       (if __TRANS_MCP (setq _TRANS_MCP (car __TRANS_MCP)))
       _TRANS_MCP)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Quaternion _origin_Q_tag1
    (send _origin_Q_tag1 :serialization-length)
    ;; geometry_msgs/Quaternion _origin_Q_tag2
    (send _origin_Q_tag2 :serialization-length)
    ;; geometry_msgs/Quaternion _origin_Q_tag3
    (send _origin_Q_tag3 :serialization-length)
    ;; geometry_msgs/Vector3 _YAW_DIP
    (send _YAW_DIP :serialization-length)
    ;; geometry_msgs/Vector3 _TRANS_DIP
    (send _TRANS_DIP :serialization-length)
    ;; geometry_msgs/Vector3 _YAW_PIP
    (send _YAW_PIP :serialization-length)
    ;; geometry_msgs/Vector3 _TRANS_PIP
    (send _TRANS_PIP :serialization-length)
    ;; geometry_msgs/Vector3 _YAW_MCP
    (send _YAW_MCP :serialization-length)
    ;; geometry_msgs/Vector3 _TRANS_MCP
    (send _TRANS_MCP :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Quaternion _origin_Q_tag1
       (send _origin_Q_tag1 :serialize s)
     ;; geometry_msgs/Quaternion _origin_Q_tag2
       (send _origin_Q_tag2 :serialize s)
     ;; geometry_msgs/Quaternion _origin_Q_tag3
       (send _origin_Q_tag3 :serialize s)
     ;; geometry_msgs/Vector3 _YAW_DIP
       (send _YAW_DIP :serialize s)
     ;; geometry_msgs/Vector3 _TRANS_DIP
       (send _TRANS_DIP :serialize s)
     ;; geometry_msgs/Vector3 _YAW_PIP
       (send _YAW_PIP :serialize s)
     ;; geometry_msgs/Vector3 _TRANS_PIP
       (send _TRANS_PIP :serialize s)
     ;; geometry_msgs/Vector3 _YAW_MCP
       (send _YAW_MCP :serialize s)
     ;; geometry_msgs/Vector3 _TRANS_MCP
       (send _TRANS_MCP :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Quaternion _origin_Q_tag1
     (send _origin_Q_tag1 :deserialize buf ptr-) (incf ptr- (send _origin_Q_tag1 :serialization-length))
   ;; geometry_msgs/Quaternion _origin_Q_tag2
     (send _origin_Q_tag2 :deserialize buf ptr-) (incf ptr- (send _origin_Q_tag2 :serialization-length))
   ;; geometry_msgs/Quaternion _origin_Q_tag3
     (send _origin_Q_tag3 :deserialize buf ptr-) (incf ptr- (send _origin_Q_tag3 :serialization-length))
   ;; geometry_msgs/Vector3 _YAW_DIP
     (send _YAW_DIP :deserialize buf ptr-) (incf ptr- (send _YAW_DIP :serialization-length))
   ;; geometry_msgs/Vector3 _TRANS_DIP
     (send _TRANS_DIP :deserialize buf ptr-) (incf ptr- (send _TRANS_DIP :serialization-length))
   ;; geometry_msgs/Vector3 _YAW_PIP
     (send _YAW_PIP :deserialize buf ptr-) (incf ptr- (send _YAW_PIP :serialization-length))
   ;; geometry_msgs/Vector3 _TRANS_PIP
     (send _TRANS_PIP :deserialize buf ptr-) (incf ptr- (send _TRANS_PIP :serialization-length))
   ;; geometry_msgs/Vector3 _YAW_MCP
     (send _YAW_MCP :deserialize buf ptr-) (incf ptr- (send _YAW_MCP :serialization-length))
   ;; geometry_msgs/Vector3 _TRANS_MCP
     (send _TRANS_MCP :deserialize buf ptr-) (incf ptr- (send _TRANS_MCP :serialization-length))
   ;;
   self)
  )

(setf (get obtain_angle::fingerpose :md5sum-) "6052868b9a4add2e7c42afe8a4c83c4d")
(setf (get obtain_angle::fingerpose :datatype-) "obtain_angle/fingerpose")
(setf (get obtain_angle::fingerpose :definition-)
      "geometry_msgs/Quaternion origin_Q_tag1
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



(provide :obtain_angle/fingerpose "6052868b9a4add2e7c42afe8a4c83c4d")


