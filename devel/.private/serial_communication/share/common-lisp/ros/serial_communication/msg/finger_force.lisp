; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude finger_force.msg.html

(cl:defclass <finger_force> (roslisp-msg-protocol:ros-message)
  ((FORCE1
    :reader FORCE1
    :initarg :FORCE1
    :type cl:float
    :initform 0.0)
   (FORCE2
    :reader FORCE2
    :initarg :FORCE2
    :type cl:float
    :initform 0.0)
   (FORCE3
    :reader FORCE3
    :initarg :FORCE3
    :type cl:float
    :initform 0.0)
   (FORCE4
    :reader FORCE4
    :initarg :FORCE4
    :type cl:float
    :initform 0.0))
)

(cl:defclass finger_force (<finger_force>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <finger_force>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'finger_force)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<finger_force> is deprecated: use serial_communication-msg:finger_force instead.")))

(cl:ensure-generic-function 'FORCE1-val :lambda-list '(m))
(cl:defmethod FORCE1-val ((m <finger_force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:FORCE1-val is deprecated.  Use serial_communication-msg:FORCE1 instead.")
  (FORCE1 m))

(cl:ensure-generic-function 'FORCE2-val :lambda-list '(m))
(cl:defmethod FORCE2-val ((m <finger_force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:FORCE2-val is deprecated.  Use serial_communication-msg:FORCE2 instead.")
  (FORCE2 m))

(cl:ensure-generic-function 'FORCE3-val :lambda-list '(m))
(cl:defmethod FORCE3-val ((m <finger_force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:FORCE3-val is deprecated.  Use serial_communication-msg:FORCE3 instead.")
  (FORCE3 m))

(cl:ensure-generic-function 'FORCE4-val :lambda-list '(m))
(cl:defmethod FORCE4-val ((m <finger_force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:FORCE4-val is deprecated.  Use serial_communication-msg:FORCE4 instead.")
  (FORCE4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <finger_force>) ostream)
  "Serializes a message object of type '<finger_force>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FORCE1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FORCE2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FORCE3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FORCE4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <finger_force>) istream)
  "Deserializes a message object of type '<finger_force>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FORCE1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FORCE2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FORCE3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FORCE4) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<finger_force>)))
  "Returns string type for a message object of type '<finger_force>"
  "serial_communication/finger_force")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'finger_force)))
  "Returns string type for a message object of type 'finger_force"
  "serial_communication/finger_force")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<finger_force>)))
  "Returns md5sum for a message object of type '<finger_force>"
  "619b947b757f5681fe65b1c5b569b37c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'finger_force)))
  "Returns md5sum for a message object of type 'finger_force"
  "619b947b757f5681fe65b1c5b569b37c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<finger_force>)))
  "Returns full string definition for message of type '<finger_force>"
  (cl:format cl:nil "float32 FORCE1~%float32 FORCE2~%float32 FORCE3~%float32 FORCE4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'finger_force)))
  "Returns full string definition for message of type 'finger_force"
  (cl:format cl:nil "float32 FORCE1~%float32 FORCE2~%float32 FORCE3~%float32 FORCE4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <finger_force>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <finger_force>))
  "Converts a ROS message object to a list"
  (cl:list 'finger_force
    (cl:cons ':FORCE1 (FORCE1 msg))
    (cl:cons ':FORCE2 (FORCE2 msg))
    (cl:cons ':FORCE3 (FORCE3 msg))
    (cl:cons ':FORCE4 (FORCE4 msg))
))
