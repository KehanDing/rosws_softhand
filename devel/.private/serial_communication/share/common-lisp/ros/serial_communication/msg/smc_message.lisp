; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude smc_message.msg.html

(cl:defclass <smc_message> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (time
    :reader time
    :initarg :time
    :type cl:integer
    :initform 0)
   (target_pressure
    :reader target_pressure
    :initarg :target_pressure
    :type cl:float
    :initform 0.0)
   (feedback_pressure
    :reader feedback_pressure
    :initarg :feedback_pressure
    :type cl:float
    :initform 0.0)
   (error
    :reader error
    :initarg :error
    :type cl:float
    :initform 0.0)
   (smc_uc
    :reader smc_uc
    :initarg :smc_uc
    :type cl:float
    :initform 0.0)
   (valve_mode
    :reader valve_mode
    :initarg :valve_mode
    :type cl:integer
    :initform 0))
)

(cl:defclass smc_message (<smc_message>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <smc_message>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'smc_message)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<smc_message> is deprecated: use serial_communication-msg:smc_message instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <smc_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:ID-val is deprecated.  Use serial_communication-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <smc_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:time-val is deprecated.  Use serial_communication-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'target_pressure-val :lambda-list '(m))
(cl:defmethod target_pressure-val ((m <smc_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:target_pressure-val is deprecated.  Use serial_communication-msg:target_pressure instead.")
  (target_pressure m))

(cl:ensure-generic-function 'feedback_pressure-val :lambda-list '(m))
(cl:defmethod feedback_pressure-val ((m <smc_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:feedback_pressure-val is deprecated.  Use serial_communication-msg:feedback_pressure instead.")
  (feedback_pressure m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <smc_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:error-val is deprecated.  Use serial_communication-msg:error instead.")
  (error m))

(cl:ensure-generic-function 'smc_uc-val :lambda-list '(m))
(cl:defmethod smc_uc-val ((m <smc_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:smc_uc-val is deprecated.  Use serial_communication-msg:smc_uc instead.")
  (smc_uc m))

(cl:ensure-generic-function 'valve_mode-val :lambda-list '(m))
(cl:defmethod valve_mode-val ((m <smc_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:valve_mode-val is deprecated.  Use serial_communication-msg:valve_mode instead.")
  (valve_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <smc_message>) ostream)
  "Serializes a message object of type '<smc_message>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'feedback_pressure))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'smc_uc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'valve_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <smc_message>) istream)
  "Deserializes a message object of type '<smc_message>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_pressure) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'feedback_pressure) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'error) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'smc_uc) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'valve_mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<smc_message>)))
  "Returns string type for a message object of type '<smc_message>"
  "serial_communication/smc_message")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'smc_message)))
  "Returns string type for a message object of type 'smc_message"
  "serial_communication/smc_message")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<smc_message>)))
  "Returns md5sum for a message object of type '<smc_message>"
  "bf432afdc339653f15d6954de7920050")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'smc_message)))
  "Returns md5sum for a message object of type 'smc_message"
  "bf432afdc339653f15d6954de7920050")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<smc_message>)))
  "Returns full string definition for message of type '<smc_message>"
  (cl:format cl:nil "uint8 ID~%uint32 time~%float32 target_pressure~%float32 feedback_pressure~%float32 error~%float32 smc_uc~%int32 valve_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'smc_message)))
  "Returns full string definition for message of type 'smc_message"
  (cl:format cl:nil "uint8 ID~%uint32 time~%float32 target_pressure~%float32 feedback_pressure~%float32 error~%float32 smc_uc~%int32 valve_mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <smc_message>))
  (cl:+ 0
     1
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <smc_message>))
  "Converts a ROS message object to a list"
  (cl:list 'smc_message
    (cl:cons ':ID (ID msg))
    (cl:cons ':time (time msg))
    (cl:cons ':target_pressure (target_pressure msg))
    (cl:cons ':feedback_pressure (feedback_pressure msg))
    (cl:cons ':error (error msg))
    (cl:cons ':smc_uc (smc_uc msg))
    (cl:cons ':valve_mode (valve_mode msg))
))
