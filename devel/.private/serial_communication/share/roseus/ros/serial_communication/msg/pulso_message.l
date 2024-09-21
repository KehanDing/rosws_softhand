;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::pulso_message)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'pulso_message (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::PULSO_MESSAGE")
  (make-package "SERIAL_COMMUNICATION::PULSO_MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude pulso_message.msg.html


(defclass serial_communication::pulso_message
  :super ros::object
  :slots (_ID _static_pressure_1 _static_pressure_2 _static_pressure_3 _dynamic_pulse_1 _dynamic_pulse_2 _dynamic_pulse_3 ))

(defmethod serial_communication::pulso_message
  (:init
   (&key
    ((:ID __ID) 0)
    ((:static_pressure_1 __static_pressure_1) 0)
    ((:static_pressure_2 __static_pressure_2) 0)
    ((:static_pressure_3 __static_pressure_3) 0)
    ((:dynamic_pulse_1 __dynamic_pulse_1) 0)
    ((:dynamic_pulse_2 __dynamic_pulse_2) 0)
    ((:dynamic_pulse_3 __dynamic_pulse_3) 0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _static_pressure_1 (round __static_pressure_1))
   (setq _static_pressure_2 (round __static_pressure_2))
   (setq _static_pressure_3 (round __static_pressure_3))
   (setq _dynamic_pulse_1 (round __dynamic_pulse_1))
   (setq _dynamic_pulse_2 (round __dynamic_pulse_2))
   (setq _dynamic_pulse_3 (round __dynamic_pulse_3))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:static_pressure_1
   (&optional __static_pressure_1)
   (if __static_pressure_1 (setq _static_pressure_1 __static_pressure_1)) _static_pressure_1)
  (:static_pressure_2
   (&optional __static_pressure_2)
   (if __static_pressure_2 (setq _static_pressure_2 __static_pressure_2)) _static_pressure_2)
  (:static_pressure_3
   (&optional __static_pressure_3)
   (if __static_pressure_3 (setq _static_pressure_3 __static_pressure_3)) _static_pressure_3)
  (:dynamic_pulse_1
   (&optional __dynamic_pulse_1)
   (if __dynamic_pulse_1 (setq _dynamic_pulse_1 __dynamic_pulse_1)) _dynamic_pulse_1)
  (:dynamic_pulse_2
   (&optional __dynamic_pulse_2)
   (if __dynamic_pulse_2 (setq _dynamic_pulse_2 __dynamic_pulse_2)) _dynamic_pulse_2)
  (:dynamic_pulse_3
   (&optional __dynamic_pulse_3)
   (if __dynamic_pulse_3 (setq _dynamic_pulse_3 __dynamic_pulse_3)) _dynamic_pulse_3)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; uint16 _static_pressure_1
    2
    ;; uint16 _static_pressure_2
    2
    ;; uint16 _static_pressure_3
    2
    ;; uint16 _dynamic_pulse_1
    2
    ;; uint16 _dynamic_pulse_2
    2
    ;; uint16 _dynamic_pulse_3
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; uint16 _static_pressure_1
       (write-word _static_pressure_1 s)
     ;; uint16 _static_pressure_2
       (write-word _static_pressure_2 s)
     ;; uint16 _static_pressure_3
       (write-word _static_pressure_3 s)
     ;; uint16 _dynamic_pulse_1
       (write-word _dynamic_pulse_1 s)
     ;; uint16 _dynamic_pulse_2
       (write-word _dynamic_pulse_2 s)
     ;; uint16 _dynamic_pulse_3
       (write-word _dynamic_pulse_3 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _static_pressure_1
     (setq _static_pressure_1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _static_pressure_2
     (setq _static_pressure_2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _static_pressure_3
     (setq _static_pressure_3 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _dynamic_pulse_1
     (setq _dynamic_pulse_1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _dynamic_pulse_2
     (setq _dynamic_pulse_2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _dynamic_pulse_3
     (setq _dynamic_pulse_3 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get serial_communication::pulso_message :md5sum-) "93fb5a6b0af4819896193f51aafdbf6d")
(setf (get serial_communication::pulso_message :datatype-) "serial_communication/pulso_message")
(setf (get serial_communication::pulso_message :definition-)
      "uint8 ID
uint16 static_pressure_1
uint16 static_pressure_2
uint16 static_pressure_3
uint16 dynamic_pulse_1
uint16 dynamic_pulse_2
uint16 dynamic_pulse_3

")



(provide :serial_communication/pulso_message "93fb5a6b0af4819896193f51aafdbf6d")


