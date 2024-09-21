; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude finger_egain.msg.html

(cl:defclass <finger_egain> (roslisp-msg-protocol:ros-message)
  ((DIP
    :reader DIP
    :initarg :DIP
    :type cl:float
    :initform 0.0)
   (PIP
    :reader PIP
    :initarg :PIP
    :type cl:float
    :initform 0.0)
   (MCPL
    :reader MCPL
    :initarg :MCPL
    :type cl:float
    :initform 0.0)
   (MCPR
    :reader MCPR
    :initarg :MCPR
    :type cl:float
    :initform 0.0))
)

(cl:defclass finger_egain (<finger_egain>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <finger_egain>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'finger_egain)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<finger_egain> is deprecated: use serial_communication-msg:finger_egain instead.")))

(cl:ensure-generic-function 'DIP-val :lambda-list '(m))
(cl:defmethod DIP-val ((m <finger_egain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:DIP-val is deprecated.  Use serial_communication-msg:DIP instead.")
  (DIP m))

(cl:ensure-generic-function 'PIP-val :lambda-list '(m))
(cl:defmethod PIP-val ((m <finger_egain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:PIP-val is deprecated.  Use serial_communication-msg:PIP instead.")
  (PIP m))

(cl:ensure-generic-function 'MCPL-val :lambda-list '(m))
(cl:defmethod MCPL-val ((m <finger_egain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:MCPL-val is deprecated.  Use serial_communication-msg:MCPL instead.")
  (MCPL m))

(cl:ensure-generic-function 'MCPR-val :lambda-list '(m))
(cl:defmethod MCPR-val ((m <finger_egain>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:MCPR-val is deprecated.  Use serial_communication-msg:MCPR instead.")
  (MCPR m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <finger_egain>) ostream)
  "Serializes a message object of type '<finger_egain>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'DIP))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'PIP))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'MCPL))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'MCPR))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <finger_egain>) istream)
  "Deserializes a message object of type '<finger_egain>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'DIP) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'PIP) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'MCPL) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'MCPR) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<finger_egain>)))
  "Returns string type for a message object of type '<finger_egain>"
  "serial_communication/finger_egain")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'finger_egain)))
  "Returns string type for a message object of type 'finger_egain"
  "serial_communication/finger_egain")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<finger_egain>)))
  "Returns md5sum for a message object of type '<finger_egain>"
  "6915de8760abcc9afcc2687afb58825d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'finger_egain)))
  "Returns md5sum for a message object of type 'finger_egain"
  "6915de8760abcc9afcc2687afb58825d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<finger_egain>)))
  "Returns full string definition for message of type '<finger_egain>"
  (cl:format cl:nil "float32 DIP~%float32 PIP~%float32 MCPL~%float32 MCPR~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'finger_egain)))
  "Returns full string definition for message of type 'finger_egain"
  (cl:format cl:nil "float32 DIP~%float32 PIP~%float32 MCPL~%float32 MCPR~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <finger_egain>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <finger_egain>))
  "Converts a ROS message object to a list"
  (cl:list 'finger_egain
    (cl:cons ':DIP (DIP msg))
    (cl:cons ':PIP (PIP msg))
    (cl:cons ':MCPL (MCPL msg))
    (cl:cons ':MCPR (MCPR msg))
))
