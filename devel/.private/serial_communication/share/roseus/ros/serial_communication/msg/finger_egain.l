;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::finger_egain)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'finger_egain (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::FINGER_EGAIN")
  (make-package "SERIAL_COMMUNICATION::FINGER_EGAIN"))

(in-package "ROS")
;;//! \htmlinclude finger_egain.msg.html


(defclass serial_communication::finger_egain
  :super ros::object
  :slots (_DIP _PIP _MCPL _MCPR ))

(defmethod serial_communication::finger_egain
  (:init
   (&key
    ((:DIP __DIP) 0.0)
    ((:PIP __PIP) 0.0)
    ((:MCPL __MCPL) 0.0)
    ((:MCPR __MCPR) 0.0)
    )
   (send-super :init)
   (setq _DIP (float __DIP))
   (setq _PIP (float __PIP))
   (setq _MCPL (float __MCPL))
   (setq _MCPR (float __MCPR))
   self)
  (:DIP
   (&optional __DIP)
   (if __DIP (setq _DIP __DIP)) _DIP)
  (:PIP
   (&optional __PIP)
   (if __PIP (setq _PIP __PIP)) _PIP)
  (:MCPL
   (&optional __MCPL)
   (if __MCPL (setq _MCPL __MCPL)) _MCPL)
  (:MCPR
   (&optional __MCPR)
   (if __MCPR (setq _MCPR __MCPR)) _MCPR)
  (:serialization-length
   ()
   (+
    ;; float32 _DIP
    4
    ;; float32 _PIP
    4
    ;; float32 _MCPL
    4
    ;; float32 _MCPR
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _DIP
       (sys::poke _DIP (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _PIP
       (sys::poke _PIP (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _MCPL
       (sys::poke _MCPL (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _MCPR
       (sys::poke _MCPR (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _DIP
     (setq _DIP (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _PIP
     (setq _PIP (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _MCPL
     (setq _MCPL (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _MCPR
     (setq _MCPR (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get serial_communication::finger_egain :md5sum-) "6915de8760abcc9afcc2687afb58825d")
(setf (get serial_communication::finger_egain :datatype-) "serial_communication/finger_egain")
(setf (get serial_communication::finger_egain :definition-)
      "float32 DIP
float32 PIP
float32 MCPL
float32 MCPR

")



(provide :serial_communication/finger_egain "6915de8760abcc9afcc2687afb58825d")


