; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude finger_pressure.msg.html

(cl:defclass <finger_pressure> (roslisp-msg-protocol:ros-message)
  ((IP
    :reader IP
    :initarg :IP
    :type cl:float
    :initform 0.0)
   (MCPB
    :reader MCPB
    :initarg :MCPB
    :type cl:float
    :initform 0.0)
   (MCPAL
    :reader MCPAL
    :initarg :MCPAL
    :type cl:float
    :initform 0.0)
   (MCPAR
    :reader MCPAR
    :initarg :MCPAR
    :type cl:float
    :initform 0.0))
)

(cl:defclass finger_pressure (<finger_pressure>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <finger_pressure>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'finger_pressure)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<finger_pressure> is deprecated: use serial_communication-msg:finger_pressure instead.")))

(cl:ensure-generic-function 'IP-val :lambda-list '(m))
(cl:defmethod IP-val ((m <finger_pressure>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:IP-val is deprecated.  Use serial_communication-msg:IP instead.")
  (IP m))

(cl:ensure-generic-function 'MCPB-val :lambda-list '(m))
(cl:defmethod MCPB-val ((m <finger_pressure>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:MCPB-val is deprecated.  Use serial_communication-msg:MCPB instead.")
  (MCPB m))

(cl:ensure-generic-function 'MCPAL-val :lambda-list '(m))
(cl:defmethod MCPAL-val ((m <finger_pressure>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:MCPAL-val is deprecated.  Use serial_communication-msg:MCPAL instead.")
  (MCPAL m))

(cl:ensure-generic-function 'MCPAR-val :lambda-list '(m))
(cl:defmethod MCPAR-val ((m <finger_pressure>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:MCPAR-val is deprecated.  Use serial_communication-msg:MCPAR instead.")
  (MCPAR m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <finger_pressure>) ostream)
  "Serializes a message object of type '<finger_pressure>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'IP))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'MCPB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'MCPAL))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'MCPAR))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <finger_pressure>) istream)
  "Deserializes a message object of type '<finger_pressure>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'IP) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'MCPB) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'MCPAL) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'MCPAR) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<finger_pressure>)))
  "Returns string type for a message object of type '<finger_pressure>"
  "serial_communication/finger_pressure")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'finger_pressure)))
  "Returns string type for a message object of type 'finger_pressure"
  "serial_communication/finger_pressure")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<finger_pressure>)))
  "Returns md5sum for a message object of type '<finger_pressure>"
  "84aa983bc8589b4da228df1fce3c6dfb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'finger_pressure)))
  "Returns md5sum for a message object of type 'finger_pressure"
  "84aa983bc8589b4da228df1fce3c6dfb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<finger_pressure>)))
  "Returns full string definition for message of type '<finger_pressure>"
  (cl:format cl:nil "float32 IP~%float32 MCPB~%float32 MCPAL~%float32 MCPAR~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'finger_pressure)))
  "Returns full string definition for message of type 'finger_pressure"
  (cl:format cl:nil "float32 IP~%float32 MCPB~%float32 MCPAL~%float32 MCPAR~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <finger_pressure>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <finger_pressure>))
  "Converts a ROS message object to a list"
  (cl:list 'finger_pressure
    (cl:cons ':IP (IP msg))
    (cl:cons ':MCPB (MCPB msg))
    (cl:cons ':MCPAL (MCPAL msg))
    (cl:cons ':MCPAR (MCPAR msg))
))
