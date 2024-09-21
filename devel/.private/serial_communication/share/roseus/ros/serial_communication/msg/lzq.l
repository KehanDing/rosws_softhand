;; Auto-generated. Do not edit!


(when (boundp 'serial_communication::lzq)
  (if (not (find-package "SERIAL_COMMUNICATION"))
    (make-package "SERIAL_COMMUNICATION"))
  (shadow 'lzq (find-package "SERIAL_COMMUNICATION")))
(unless (find-package "SERIAL_COMMUNICATION::LZQ")
  (make-package "SERIAL_COMMUNICATION::LZQ"))

(in-package "ROS")
;;//! \htmlinclude lzq.msg.html


(defclass serial_communication::lzq
  :super ros::object
  :slots (_num _thumb _index _middle _ring _little ))

(defmethod serial_communication::lzq
  (:init
   (&key
    ((:num __num) 0)
    ((:thumb __thumb) 0.0)
    ((:index __index) 0.0)
    ((:middle __middle) 0.0)
    ((:ring __ring) 0.0)
    ((:little __little) 0.0)
    )
   (send-super :init)
   (setq _num (round __num))
   (setq _thumb (float __thumb))
   (setq _index (float __index))
   (setq _middle (float __middle))
   (setq _ring (float __ring))
   (setq _little (float __little))
   self)
  (:num
   (&optional __num)
   (if __num (setq _num __num)) _num)
  (:thumb
   (&optional __thumb)
   (if __thumb (setq _thumb __thumb)) _thumb)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:middle
   (&optional __middle)
   (if __middle (setq _middle __middle)) _middle)
  (:ring
   (&optional __ring)
   (if __ring (setq _ring __ring)) _ring)
  (:little
   (&optional __little)
   (if __little (setq _little __little)) _little)
  (:serialization-length
   ()
   (+
    ;; uint32 _num
    4
    ;; float32 _thumb
    4
    ;; float32 _index
    4
    ;; float32 _middle
    4
    ;; float32 _ring
    4
    ;; float32 _little
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _num
       (write-long _num s)
     ;; float32 _thumb
       (sys::poke _thumb (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _index
       (sys::poke _index (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _middle
       (sys::poke _middle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ring
       (sys::poke _ring (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _little
       (sys::poke _little (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _num
     (setq _num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _thumb
     (setq _thumb (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _index
     (setq _index (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _middle
     (setq _middle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ring
     (setq _ring (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _little
     (setq _little (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get serial_communication::lzq :md5sum-) "da64289d8beb7c3bfcf74e7727a35840")
(setf (get serial_communication::lzq :datatype-) "serial_communication/lzq")
(setf (get serial_communication::lzq :definition-)
      "uint32 num
float32  thumb
float32  index
float32  middle
float32  ring
float32  little

")



(provide :serial_communication/lzq "da64289d8beb7c3bfcf74e7727a35840")


