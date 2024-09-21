;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::smc_message)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'smc_message (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::SMC_MESSAGE")
  (make-package "SERIAL_COMMUNICATION::SMC_MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude smc_message.msg.html


(defclass serial_communication::smc_message
  :super ros::object
  :slots (_ID _time _target_pressure _feedback_pressure _error _smc_uc _valve_mode ))

(defmethod serial_communication::smc_message
  (:init
   (&key
    ((:ID __ID) 0)
    ((:time __time) 0)
    ((:target_pressure __target_pressure) 0.0)
    ((:feedback_pressure __feedback_pressure) 0.0)
    ((:error __error) 0.0)
    ((:smc_uc __smc_uc) 0.0)
    ((:valve_mode __valve_mode) 0)
    )
   (send-super :init)
   (setq _ID (round __ID))
   (setq _time (round __time))
   (setq _target_pressure (float __target_pressure))
   (setq _feedback_pressure (float __feedback_pressure))
   (setq _error (float __error))
   (setq _smc_uc (float __smc_uc))
   (setq _valve_mode (round __valve_mode))
   self)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:target_pressure
   (&optional __target_pressure)
   (if __target_pressure (setq _target_pressure __target_pressure)) _target_pressure)
  (:feedback_pressure
   (&optional __feedback_pressure)
   (if __feedback_pressure (setq _feedback_pressure __feedback_pressure)) _feedback_pressure)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:smc_uc
   (&optional __smc_uc)
   (if __smc_uc (setq _smc_uc __smc_uc)) _smc_uc)
  (:valve_mode
   (&optional __valve_mode)
   (if __valve_mode (setq _valve_mode __valve_mode)) _valve_mode)
  (:serialization-length
   ()
   (+
    ;; uint8 _ID
    1
    ;; uint32 _time
    4
    ;; float32 _target_pressure
    4
    ;; float32 _feedback_pressure
    4
    ;; float32 _error
    4
    ;; float32 _smc_uc
    4
    ;; int32 _valve_mode
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _ID
       (write-byte _ID s)
     ;; uint32 _time
       (write-long _time s)
     ;; float32 _target_pressure
       (sys::poke _target_pressure (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _feedback_pressure
       (sys::poke _feedback_pressure (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _error
       (sys::poke _error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _smc_uc
       (sys::poke _smc_uc (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _valve_mode
       (write-long _valve_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _ID
     (setq _ID (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _time
     (setq _time (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _target_pressure
     (setq _target_pressure (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _feedback_pressure
     (setq _feedback_pressure (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _error
     (setq _error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _smc_uc
     (setq _smc_uc (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _valve_mode
     (setq _valve_mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get serial_communication::smc_message :md5sum-) "bf432afdc339653f15d6954de7920050")
(setf (get serial_communication::smc_message :datatype-) "serial_communication/smc_message")
(setf (get serial_communication::smc_message :definition-)
      "uint8 ID
uint32 time
float32 target_pressure
float32 feedback_pressure
float32 error
float32 smc_uc
int32 valve_mode

")



(provide :serial_communication/smc_message "bf432afdc339653f15d6954de7920050")


