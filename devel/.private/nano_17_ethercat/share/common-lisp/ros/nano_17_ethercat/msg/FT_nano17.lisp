; Auto-generated. Do not edit!


(cl:in-package nano_17_ethercat-msg)


;//! \htmlinclude FT_nano17.msg.html

(cl:defclass <FT_nano17> (roslisp-msg-protocol:ros-message)
  ((TORQUE_X
    :reader TORQUE_X
    :initarg :TORQUE_X
    :type cl:float
    :initform 0.0)
   (TORQUE_Y
    :reader TORQUE_Y
    :initarg :TORQUE_Y
    :type cl:float
    :initform 0.0)
   (TORQUE_Z
    :reader TORQUE_Z
    :initarg :TORQUE_Z
    :type cl:float
    :initform 0.0)
   (FORCE_X
    :reader FORCE_X
    :initarg :FORCE_X
    :type cl:float
    :initform 0.0)
   (FORCE_Y
    :reader FORCE_Y
    :initarg :FORCE_Y
    :type cl:float
    :initform 0.0)
   (FORCE_Z
    :reader FORCE_Z
    :initarg :FORCE_Z
    :type cl:float
    :initform 0.0))
)

(cl:defclass FT_nano17 (<FT_nano17>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FT_nano17>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FT_nano17)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nano_17_ethercat-msg:<FT_nano17> is deprecated: use nano_17_ethercat-msg:FT_nano17 instead.")))

(cl:ensure-generic-function 'TORQUE_X-val :lambda-list '(m))
(cl:defmethod TORQUE_X-val ((m <FT_nano17>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nano_17_ethercat-msg:TORQUE_X-val is deprecated.  Use nano_17_ethercat-msg:TORQUE_X instead.")
  (TORQUE_X m))

(cl:ensure-generic-function 'TORQUE_Y-val :lambda-list '(m))
(cl:defmethod TORQUE_Y-val ((m <FT_nano17>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nano_17_ethercat-msg:TORQUE_Y-val is deprecated.  Use nano_17_ethercat-msg:TORQUE_Y instead.")
  (TORQUE_Y m))

(cl:ensure-generic-function 'TORQUE_Z-val :lambda-list '(m))
(cl:defmethod TORQUE_Z-val ((m <FT_nano17>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nano_17_ethercat-msg:TORQUE_Z-val is deprecated.  Use nano_17_ethercat-msg:TORQUE_Z instead.")
  (TORQUE_Z m))

(cl:ensure-generic-function 'FORCE_X-val :lambda-list '(m))
(cl:defmethod FORCE_X-val ((m <FT_nano17>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nano_17_ethercat-msg:FORCE_X-val is deprecated.  Use nano_17_ethercat-msg:FORCE_X instead.")
  (FORCE_X m))

(cl:ensure-generic-function 'FORCE_Y-val :lambda-list '(m))
(cl:defmethod FORCE_Y-val ((m <FT_nano17>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nano_17_ethercat-msg:FORCE_Y-val is deprecated.  Use nano_17_ethercat-msg:FORCE_Y instead.")
  (FORCE_Y m))

(cl:ensure-generic-function 'FORCE_Z-val :lambda-list '(m))
(cl:defmethod FORCE_Z-val ((m <FT_nano17>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nano_17_ethercat-msg:FORCE_Z-val is deprecated.  Use nano_17_ethercat-msg:FORCE_Z instead.")
  (FORCE_Z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FT_nano17>) ostream)
  "Serializes a message object of type '<FT_nano17>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'TORQUE_X))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'TORQUE_Y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'TORQUE_Z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FORCE_X))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FORCE_Y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'FORCE_Z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FT_nano17>) istream)
  "Deserializes a message object of type '<FT_nano17>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'TORQUE_X) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'TORQUE_Y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'TORQUE_Z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FORCE_X) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FORCE_Y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'FORCE_Z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FT_nano17>)))
  "Returns string type for a message object of type '<FT_nano17>"
  "nano_17_ethercat/FT_nano17")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FT_nano17)))
  "Returns string type for a message object of type 'FT_nano17"
  "nano_17_ethercat/FT_nano17")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FT_nano17>)))
  "Returns md5sum for a message object of type '<FT_nano17>"
  "b3cc10406904387a2b764bbc39a449c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FT_nano17)))
  "Returns md5sum for a message object of type 'FT_nano17"
  "b3cc10406904387a2b764bbc39a449c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FT_nano17>)))
  "Returns full string definition for message of type '<FT_nano17>"
  (cl:format cl:nil "float32 TORQUE_X~%float32 TORQUE_Y~%float32 TORQUE_Z~%float32 FORCE_X~%float32 FORCE_Y~%float32 FORCE_Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FT_nano17)))
  "Returns full string definition for message of type 'FT_nano17"
  (cl:format cl:nil "float32 TORQUE_X~%float32 TORQUE_Y~%float32 TORQUE_Z~%float32 FORCE_X~%float32 FORCE_Y~%float32 FORCE_Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FT_nano17>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FT_nano17>))
  "Converts a ROS message object to a list"
  (cl:list 'FT_nano17
    (cl:cons ':TORQUE_X (TORQUE_X msg))
    (cl:cons ':TORQUE_Y (TORQUE_Y msg))
    (cl:cons ':TORQUE_Z (TORQUE_Z msg))
    (cl:cons ':FORCE_X (FORCE_X msg))
    (cl:cons ':FORCE_Y (FORCE_Y msg))
    (cl:cons ':FORCE_Z (FORCE_Z msg))
))
