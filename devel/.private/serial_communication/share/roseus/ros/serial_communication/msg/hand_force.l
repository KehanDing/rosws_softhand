;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::hand_force)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'hand_force (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::HAND_FORCE")
  (make-package "SERIAL_COMMUNICATION::HAND_FORCE"))

(in-package "ROS")
;;//! \htmlinclude hand_force.msg.html


(defclass serial_communication::hand_force
  :super ros::object
  :slots (_THUMB0 _THUMB1 _INDEX _MIDDLE _RING _LITTLE ))

(defmethod serial_communication::hand_force
  (:init
   (&key
    ((:THUMB0 __THUMB0) (instance serial_communication::finger_force :init))
    ((:THUMB1 __THUMB1) (instance serial_communication::finger_force :init))
    ((:INDEX __INDEX) (instance serial_communication::finger_force :init))
    ((:MIDDLE __MIDDLE) (instance serial_communication::finger_force :init))
    ((:RING __RING) (instance serial_communication::finger_force :init))
    ((:LITTLE __LITTLE) (instance serial_communication::finger_force :init))
    )
   (send-super :init)
   (setq _THUMB0 __THUMB0)
   (setq _THUMB1 __THUMB1)
   (setq _INDEX __INDEX)
   (setq _MIDDLE __MIDDLE)
   (setq _RING __RING)
   (setq _LITTLE __LITTLE)
   self)
  (:THUMB0
   (&rest __THUMB0)
   (if (keywordp (car __THUMB0))
       (send* _THUMB0 __THUMB0)
     (progn
       (if __THUMB0 (setq _THUMB0 (car __THUMB0)))
       _THUMB0)))
  (:THUMB1
   (&rest __THUMB1)
   (if (keywordp (car __THUMB1))
       (send* _THUMB1 __THUMB1)
     (progn
       (if __THUMB1 (setq _THUMB1 (car __THUMB1)))
       _THUMB1)))
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
    ;; serial_communication/finger_force _THUMB0
    (send _THUMB0 :serialization-length)
    ;; serial_communication/finger_force _THUMB1
    (send _THUMB1 :serialization-length)
    ;; serial_communication/finger_force _INDEX
    (send _INDEX :serialization-length)
    ;; serial_communication/finger_force _MIDDLE
    (send _MIDDLE :serialization-length)
    ;; serial_communication/finger_force _RING
    (send _RING :serialization-length)
    ;; serial_communication/finger_force _LITTLE
    (send _LITTLE :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; serial_communication/finger_force _THUMB0
       (send _THUMB0 :serialize s)
     ;; serial_communication/finger_force _THUMB1
       (send _THUMB1 :serialize s)
     ;; serial_communication/finger_force _INDEX
       (send _INDEX :serialize s)
     ;; serial_communication/finger_force _MIDDLE
       (send _MIDDLE :serialize s)
     ;; serial_communication/finger_force _RING
       (send _RING :serialize s)
     ;; serial_communication/finger_force _LITTLE
       (send _LITTLE :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; serial_communication/finger_force _THUMB0
     (send _THUMB0 :deserialize buf ptr-) (incf ptr- (send _THUMB0 :serialization-length))
   ;; serial_communication/finger_force _THUMB1
     (send _THUMB1 :deserialize buf ptr-) (incf ptr- (send _THUMB1 :serialization-length))
   ;; serial_communication/finger_force _INDEX
     (send _INDEX :deserialize buf ptr-) (incf ptr- (send _INDEX :serialization-length))
   ;; serial_communication/finger_force _MIDDLE
     (send _MIDDLE :deserialize buf ptr-) (incf ptr- (send _MIDDLE :serialization-length))
   ;; serial_communication/finger_force _RING
     (send _RING :deserialize buf ptr-) (incf ptr- (send _RING :serialization-length))
   ;; serial_communication/finger_force _LITTLE
     (send _LITTLE :deserialize buf ptr-) (incf ptr- (send _LITTLE :serialization-length))
   ;;
   self)
  )

(setf (get serial_communication::hand_force :md5sum-) "a6cf3f7e3a0f71d7ff44682c65d9ef34")
(setf (get serial_communication::hand_force :datatype-) "serial_communication/hand_force")
(setf (get serial_communication::hand_force :definition-)
      "finger_force THUMB0
finger_force THUMB1
finger_force INDEX
finger_force MIDDLE
finger_force RING
finger_force LITTLE

================================================================================
MSG: serial_communication/finger_force
float32 FORCE1
float32 FORCE2
float32 FORCE3
float32 FORCE4

")



(provide :serial_communication/hand_force "a6cf3f7e3a0f71d7ff44682c65d9ef34")


