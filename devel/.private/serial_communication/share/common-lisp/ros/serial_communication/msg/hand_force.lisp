; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude hand_force.msg.html

(cl:defclass <hand_force> (roslisp-msg-protocol:ros-message)
  ((THUMB0
    :reader THUMB0
    :initarg :THUMB0
    :type serial_communication-msg:finger_force
    :initform (cl:make-instance 'serial_communication-msg:finger_force))
   (THUMB1
    :reader THUMB1
    :initarg :THUMB1
    :type serial_communication-msg:finger_force
    :initform (cl:make-instance 'serial_communication-msg:finger_force))
   (INDEX
    :reader INDEX
    :initarg :INDEX
    :type serial_communication-msg:finger_force
    :initform (cl:make-instance 'serial_communication-msg:finger_force))
   (MIDDLE
    :reader MIDDLE
    :initarg :MIDDLE
    :type serial_communication-msg:finger_force
    :initform (cl:make-instance 'serial_communication-msg:finger_force))
   (RING
    :reader RING
    :initarg :RING
    :type serial_communication-msg:finger_force
    :initform (cl:make-instance 'serial_communication-msg:finger_force))
   (LITTLE
    :reader LITTLE
    :initarg :LITTLE
    :type serial_communication-msg:finger_force
    :initform (cl:make-instance 'serial_communication-msg:finger_force)))
)

(cl:defclass hand_force (<hand_force>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <hand_force>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'hand_force)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<hand_force> is deprecated: use serial_communication-msg:hand_force instead.")))

(cl:ensure-generic-function 'THUMB0-val :lambda-list '(m))
(cl:defmethod THUMB0-val ((m <hand_force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:THUMB0-val is deprecated.  Use serial_communication-msg:THUMB0 instead.")
  (THUMB0 m))

(cl:ensure-generic-function 'THUMB1-val :lambda-list '(m))
(cl:defmethod THUMB1-val ((m <hand_force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:THUMB1-val is deprecated.  Use serial_communication-msg:THUMB1 instead.")
  (THUMB1 m))

(cl:ensure-generic-function 'INDEX-val :lambda-list '(m))
(cl:defmethod INDEX-val ((m <hand_force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:INDEX-val is deprecated.  Use serial_communication-msg:INDEX instead.")
  (INDEX m))

(cl:ensure-generic-function 'MIDDLE-val :lambda-list '(m))
(cl:defmethod MIDDLE-val ((m <hand_force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:MIDDLE-val is deprecated.  Use serial_communication-msg:MIDDLE instead.")
  (MIDDLE m))

(cl:ensure-generic-function 'RING-val :lambda-list '(m))
(cl:defmethod RING-val ((m <hand_force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:RING-val is deprecated.  Use serial_communication-msg:RING instead.")
  (RING m))

(cl:ensure-generic-function 'LITTLE-val :lambda-list '(m))
(cl:defmethod LITTLE-val ((m <hand_force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:LITTLE-val is deprecated.  Use serial_communication-msg:LITTLE instead.")
  (LITTLE m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <hand_force>) ostream)
  "Serializes a message object of type '<hand_force>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'THUMB0) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'THUMB1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'INDEX) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'MIDDLE) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RING) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'LITTLE) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <hand_force>) istream)
  "Deserializes a message object of type '<hand_force>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'THUMB0) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'THUMB1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'INDEX) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'MIDDLE) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RING) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'LITTLE) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<hand_force>)))
  "Returns string type for a message object of type '<hand_force>"
  "serial_communication/hand_force")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'hand_force)))
  "Returns string type for a message object of type 'hand_force"
  "serial_communication/hand_force")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<hand_force>)))
  "Returns md5sum for a message object of type '<hand_force>"
  "a6cf3f7e3a0f71d7ff44682c65d9ef34")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'hand_force)))
  "Returns md5sum for a message object of type 'hand_force"
  "a6cf3f7e3a0f71d7ff44682c65d9ef34")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<hand_force>)))
  "Returns full string definition for message of type '<hand_force>"
  (cl:format cl:nil "finger_force THUMB0~%finger_force THUMB1~%finger_force INDEX~%finger_force MIDDLE~%finger_force RING~%finger_force LITTLE~%~%================================================================================~%MSG: serial_communication/finger_force~%float32 FORCE1~%float32 FORCE2~%float32 FORCE3~%float32 FORCE4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'hand_force)))
  "Returns full string definition for message of type 'hand_force"
  (cl:format cl:nil "finger_force THUMB0~%finger_force THUMB1~%finger_force INDEX~%finger_force MIDDLE~%finger_force RING~%finger_force LITTLE~%~%================================================================================~%MSG: serial_communication/finger_force~%float32 FORCE1~%float32 FORCE2~%float32 FORCE3~%float32 FORCE4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <hand_force>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'THUMB0))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'THUMB1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'INDEX))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'MIDDLE))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RING))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'LITTLE))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <hand_force>))
  "Converts a ROS message object to a list"
  (cl:list 'hand_force
    (cl:cons ':THUMB0 (THUMB0 msg))
    (cl:cons ':THUMB1 (THUMB1 msg))
    (cl:cons ':INDEX (INDEX msg))
    (cl:cons ':MIDDLE (MIDDLE msg))
    (cl:cons ':RING (RING msg))
    (cl:cons ':LITTLE (LITTLE msg))
))
