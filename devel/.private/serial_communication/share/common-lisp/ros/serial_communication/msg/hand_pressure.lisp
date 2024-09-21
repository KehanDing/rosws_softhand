; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude hand_pressure.msg.html

(cl:defclass <hand_pressure> (roslisp-msg-protocol:ros-message)
  ((THUMB0
    :reader THUMB0
    :initarg :THUMB0
    :type serial_communication-msg:finger_pressure
    :initform (cl:make-instance 'serial_communication-msg:finger_pressure))
   (THUMB1
    :reader THUMB1
    :initarg :THUMB1
    :type serial_communication-msg:finger_pressure
    :initform (cl:make-instance 'serial_communication-msg:finger_pressure))
   (INDEX
    :reader INDEX
    :initarg :INDEX
    :type serial_communication-msg:finger_pressure
    :initform (cl:make-instance 'serial_communication-msg:finger_pressure))
   (MIDDLE
    :reader MIDDLE
    :initarg :MIDDLE
    :type serial_communication-msg:finger_pressure
    :initform (cl:make-instance 'serial_communication-msg:finger_pressure))
   (RING
    :reader RING
    :initarg :RING
    :type serial_communication-msg:finger_pressure
    :initform (cl:make-instance 'serial_communication-msg:finger_pressure))
   (LITTLE
    :reader LITTLE
    :initarg :LITTLE
    :type serial_communication-msg:finger_pressure
    :initform (cl:make-instance 'serial_communication-msg:finger_pressure)))
)

(cl:defclass hand_pressure (<hand_pressure>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <hand_pressure>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'hand_pressure)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<hand_pressure> is deprecated: use serial_communication-msg:hand_pressure instead.")))

(cl:ensure-generic-function 'THUMB0-val :lambda-list '(m))
(cl:defmethod THUMB0-val ((m <hand_pressure>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:THUMB0-val is deprecated.  Use serial_communication-msg:THUMB0 instead.")
  (THUMB0 m))

(cl:ensure-generic-function 'THUMB1-val :lambda-list '(m))
(cl:defmethod THUMB1-val ((m <hand_pressure>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:THUMB1-val is deprecated.  Use serial_communication-msg:THUMB1 instead.")
  (THUMB1 m))

(cl:ensure-generic-function 'INDEX-val :lambda-list '(m))
(cl:defmethod INDEX-val ((m <hand_pressure>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:INDEX-val is deprecated.  Use serial_communication-msg:INDEX instead.")
  (INDEX m))

(cl:ensure-generic-function 'MIDDLE-val :lambda-list '(m))
(cl:defmethod MIDDLE-val ((m <hand_pressure>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:MIDDLE-val is deprecated.  Use serial_communication-msg:MIDDLE instead.")
  (MIDDLE m))

(cl:ensure-generic-function 'RING-val :lambda-list '(m))
(cl:defmethod RING-val ((m <hand_pressure>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:RING-val is deprecated.  Use serial_communication-msg:RING instead.")
  (RING m))

(cl:ensure-generic-function 'LITTLE-val :lambda-list '(m))
(cl:defmethod LITTLE-val ((m <hand_pressure>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:LITTLE-val is deprecated.  Use serial_communication-msg:LITTLE instead.")
  (LITTLE m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <hand_pressure>) ostream)
  "Serializes a message object of type '<hand_pressure>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'THUMB0) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'THUMB1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'INDEX) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'MIDDLE) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RING) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'LITTLE) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <hand_pressure>) istream)
  "Deserializes a message object of type '<hand_pressure>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'THUMB0) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'THUMB1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'INDEX) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'MIDDLE) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RING) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'LITTLE) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<hand_pressure>)))
  "Returns string type for a message object of type '<hand_pressure>"
  "serial_communication/hand_pressure")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'hand_pressure)))
  "Returns string type for a message object of type 'hand_pressure"
  "serial_communication/hand_pressure")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<hand_pressure>)))
  "Returns md5sum for a message object of type '<hand_pressure>"
  "a99f6e26a2b17742b15161bbca8bdbd8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'hand_pressure)))
  "Returns md5sum for a message object of type 'hand_pressure"
  "a99f6e26a2b17742b15161bbca8bdbd8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<hand_pressure>)))
  "Returns full string definition for message of type '<hand_pressure>"
  (cl:format cl:nil "finger_pressure THUMB0~%finger_pressure THUMB1~%finger_pressure INDEX~%finger_pressure MIDDLE~%finger_pressure RING~%finger_pressure LITTLE~%~%================================================================================~%MSG: serial_communication/finger_pressure~%float32 IP~%float32 MCPB~%float32 MCPAL~%float32 MCPAR~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'hand_pressure)))
  "Returns full string definition for message of type 'hand_pressure"
  (cl:format cl:nil "finger_pressure THUMB0~%finger_pressure THUMB1~%finger_pressure INDEX~%finger_pressure MIDDLE~%finger_pressure RING~%finger_pressure LITTLE~%~%================================================================================~%MSG: serial_communication/finger_pressure~%float32 IP~%float32 MCPB~%float32 MCPAL~%float32 MCPAR~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <hand_pressure>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'THUMB0))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'THUMB1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'INDEX))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'MIDDLE))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RING))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'LITTLE))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <hand_pressure>))
  "Converts a ROS message object to a list"
  (cl:list 'hand_pressure
    (cl:cons ':THUMB0 (THUMB0 msg))
    (cl:cons ':THUMB1 (THUMB1 msg))
    (cl:cons ':INDEX (INDEX msg))
    (cl:cons ':MIDDLE (MIDDLE msg))
    (cl:cons ':RING (RING msg))
    (cl:cons ':LITTLE (LITTLE msg))
))
