; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude hand_imu.msg.html

(cl:defclass <hand_imu> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (time
    :reader time
    :initarg :time
    :type cl:fixnum
    :initform 0)
   (THUMB
    :reader THUMB
    :initarg :THUMB
    :type serial_communication-msg:finger_imu
    :initform (cl:make-instance 'serial_communication-msg:finger_imu))
   (INDEX
    :reader INDEX
    :initarg :INDEX
    :type serial_communication-msg:finger_imu
    :initform (cl:make-instance 'serial_communication-msg:finger_imu))
   (MIDDLE
    :reader MIDDLE
    :initarg :MIDDLE
    :type serial_communication-msg:finger_imu
    :initform (cl:make-instance 'serial_communication-msg:finger_imu))
   (RING
    :reader RING
    :initarg :RING
    :type serial_communication-msg:finger_imu
    :initform (cl:make-instance 'serial_communication-msg:finger_imu))
   (LITTLE
    :reader LITTLE
    :initarg :LITTLE
    :type serial_communication-msg:finger_imu
    :initform (cl:make-instance 'serial_communication-msg:finger_imu))
   (PALM
    :reader PALM
    :initarg :PALM
    :type serial_communication-msg:imu_data
    :initform (cl:make-instance 'serial_communication-msg:imu_data)))
)

(cl:defclass hand_imu (<hand_imu>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <hand_imu>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'hand_imu)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<hand_imu> is deprecated: use serial_communication-msg:hand_imu instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <hand_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:ID-val is deprecated.  Use serial_communication-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <hand_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:time-val is deprecated.  Use serial_communication-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'THUMB-val :lambda-list '(m))
(cl:defmethod THUMB-val ((m <hand_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:THUMB-val is deprecated.  Use serial_communication-msg:THUMB instead.")
  (THUMB m))

(cl:ensure-generic-function 'INDEX-val :lambda-list '(m))
(cl:defmethod INDEX-val ((m <hand_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:INDEX-val is deprecated.  Use serial_communication-msg:INDEX instead.")
  (INDEX m))

(cl:ensure-generic-function 'MIDDLE-val :lambda-list '(m))
(cl:defmethod MIDDLE-val ((m <hand_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:MIDDLE-val is deprecated.  Use serial_communication-msg:MIDDLE instead.")
  (MIDDLE m))

(cl:ensure-generic-function 'RING-val :lambda-list '(m))
(cl:defmethod RING-val ((m <hand_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:RING-val is deprecated.  Use serial_communication-msg:RING instead.")
  (RING m))

(cl:ensure-generic-function 'LITTLE-val :lambda-list '(m))
(cl:defmethod LITTLE-val ((m <hand_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:LITTLE-val is deprecated.  Use serial_communication-msg:LITTLE instead.")
  (LITTLE m))

(cl:ensure-generic-function 'PALM-val :lambda-list '(m))
(cl:defmethod PALM-val ((m <hand_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:PALM-val is deprecated.  Use serial_communication-msg:PALM instead.")
  (PALM m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <hand_imu>) ostream)
  "Serializes a message object of type '<hand_imu>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'THUMB) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'INDEX) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'MIDDLE) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RING) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'LITTLE) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'PALM) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <hand_imu>) istream)
  "Deserializes a message object of type '<hand_imu>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'THUMB) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'INDEX) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'MIDDLE) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RING) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'LITTLE) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'PALM) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<hand_imu>)))
  "Returns string type for a message object of type '<hand_imu>"
  "serial_communication/hand_imu")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'hand_imu)))
  "Returns string type for a message object of type 'hand_imu"
  "serial_communication/hand_imu")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<hand_imu>)))
  "Returns md5sum for a message object of type '<hand_imu>"
  "ea982f9506f64da059eb7d3969f058f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'hand_imu)))
  "Returns md5sum for a message object of type 'hand_imu"
  "ea982f9506f64da059eb7d3969f058f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<hand_imu>)))
  "Returns full string definition for message of type '<hand_imu>"
  (cl:format cl:nil "uint8 ID~%uint16 time~%finger_imu THUMB~%finger_imu INDEX~%finger_imu MIDDLE~%finger_imu RING~%finger_imu LITTLE~%imu_data PALM~%================================================================================~%MSG: serial_communication/finger_imu~%imu_data PIP~%imu_data DIP~%imu_data MCP~%================================================================================~%MSG: serial_communication/imu_data~%float32 q0~%float32 q1~%float32 q2~%float32 q3~%float32 roll~%float32 pitch~%float32 yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'hand_imu)))
  "Returns full string definition for message of type 'hand_imu"
  (cl:format cl:nil "uint8 ID~%uint16 time~%finger_imu THUMB~%finger_imu INDEX~%finger_imu MIDDLE~%finger_imu RING~%finger_imu LITTLE~%imu_data PALM~%================================================================================~%MSG: serial_communication/finger_imu~%imu_data PIP~%imu_data DIP~%imu_data MCP~%================================================================================~%MSG: serial_communication/imu_data~%float32 q0~%float32 q1~%float32 q2~%float32 q3~%float32 roll~%float32 pitch~%float32 yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <hand_imu>))
  (cl:+ 0
     1
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'THUMB))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'INDEX))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'MIDDLE))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RING))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'LITTLE))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'PALM))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <hand_imu>))
  "Converts a ROS message object to a list"
  (cl:list 'hand_imu
    (cl:cons ':ID (ID msg))
    (cl:cons ':time (time msg))
    (cl:cons ':THUMB (THUMB msg))
    (cl:cons ':INDEX (INDEX msg))
    (cl:cons ':MIDDLE (MIDDLE msg))
    (cl:cons ':RING (RING msg))
    (cl:cons ':LITTLE (LITTLE msg))
    (cl:cons ':PALM (PALM msg))
))
