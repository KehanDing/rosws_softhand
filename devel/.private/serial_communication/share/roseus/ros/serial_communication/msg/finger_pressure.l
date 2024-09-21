;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::finger_pressure)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'finger_pressure (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::FINGER_PRESSURE")
  (make-package "SERIAL_COMMUNICATION::FINGER_PRESSURE"))

(in-package "ROS")
;;//! \htmlinclude finger_pressure.msg.html


(defclass serial_communication::finger_pressure
  :super ros::object
  :slots (_IP _MCPB _MCPAL _MCPAR ))

(defmethod serial_communication::finger_pressure
  (:init
   (&key
    ((:IP __IP) 0.0)
    ((:MCPB __MCPB) 0.0)
    ((:MCPAL __MCPAL) 0.0)
    ((:MCPAR __MCPAR) 0.0)
    )
   (send-super :init)
   (setq _IP (float __IP))
   (setq _MCPB (float __MCPB))
   (setq _MCPAL (float __MCPAL))
   (setq _MCPAR (float __MCPAR))
   self)
  (:IP
   (&optional __IP)
   (if __IP (setq _IP __IP)) _IP)
  (:MCPB
   (&optional __MCPB)
   (if __MCPB (setq _MCPB __MCPB)) _MCPB)
  (:MCPAL
   (&optional __MCPAL)
   (if __MCPAL (setq _MCPAL __MCPAL)) _MCPAL)
  (:MCPAR
   (&optional __MCPAR)
   (if __MCPAR (setq _MCPAR __MCPAR)) _MCPAR)
  (:serialization-length
   ()
   (+
    ;; float32 _IP
    4
    ;; float32 _MCPB
    4
    ;; float32 _MCPAL
    4
    ;; float32 _MCPAR
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _IP
       (sys::poke _IP (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _MCPB
       (sys::poke _MCPB (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _MCPAL
       (sys::poke _MCPAL (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _MCPAR
       (sys::poke _MCPAR (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _IP
     (setq _IP (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _MCPB
     (setq _MCPB (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _MCPAL
     (setq _MCPAL (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _MCPAR
     (setq _MCPAR (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get serial_communication::finger_pressure :md5sum-) "84aa983bc8589b4da228df1fce3c6dfb")
(setf (get serial_communication::finger_pressure :datatype-) "serial_communication/finger_pressure")
(setf (get serial_communication::finger_pressure :definition-)
      "float32 IP
float32 MCPB
float32 MCPAL
float32 MCPAR

")



(provide :serial_communication/finger_pressure "84aa983bc8589b4da228df1fce3c6dfb")


