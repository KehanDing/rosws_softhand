;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::finger_force)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'finger_force (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::FINGER_FORCE")
  (make-package "SERIAL_COMMUNICATION::FINGER_FORCE"))

(in-package "ROS")
;;//! \htmlinclude finger_force.msg.html


(defclass serial_communication::finger_force
  :super ros::object
  :slots (_FORCE1 _FORCE2 _FORCE3 _FORCE4 ))

(defmethod serial_communication::finger_force
  (:init
   (&key
    ((:FORCE1 __FORCE1) 0.0)
    ((:FORCE2 __FORCE2) 0.0)
    ((:FORCE3 __FORCE3) 0.0)
    ((:FORCE4 __FORCE4) 0.0)
    )
   (send-super :init)
   (setq _FORCE1 (float __FORCE1))
   (setq _FORCE2 (float __FORCE2))
   (setq _FORCE3 (float __FORCE3))
   (setq _FORCE4 (float __FORCE4))
   self)
  (:FORCE1
   (&optional __FORCE1)
   (if __FORCE1 (setq _FORCE1 __FORCE1)) _FORCE1)
  (:FORCE2
   (&optional __FORCE2)
   (if __FORCE2 (setq _FORCE2 __FORCE2)) _FORCE2)
  (:FORCE3
   (&optional __FORCE3)
   (if __FORCE3 (setq _FORCE3 __FORCE3)) _FORCE3)
  (:FORCE4
   (&optional __FORCE4)
   (if __FORCE4 (setq _FORCE4 __FORCE4)) _FORCE4)
  (:serialization-length
   ()
   (+
    ;; float32 _FORCE1
    4
    ;; float32 _FORCE2
    4
    ;; float32 _FORCE3
    4
    ;; float32 _FORCE4
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _FORCE1
       (sys::poke _FORCE1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FORCE2
       (sys::poke _FORCE2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FORCE3
       (sys::poke _FORCE3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _FORCE4
       (sys::poke _FORCE4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _FORCE1
     (setq _FORCE1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FORCE2
     (setq _FORCE2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FORCE3
     (setq _FORCE3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _FORCE4
     (setq _FORCE4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get serial_communication::finger_force :md5sum-) "619b947b757f5681fe65b1c5b569b37c")
(setf (get serial_communication::finger_force :datatype-) "serial_communication/finger_force")
(setf (get serial_communication::finger_force :definition-)
      "float32 FORCE1
float32 FORCE2
float32 FORCE3
float32 FORCE4

")



(provide :serial_communication/finger_force "619b947b757f5681fe65b1c5b569b37c")


