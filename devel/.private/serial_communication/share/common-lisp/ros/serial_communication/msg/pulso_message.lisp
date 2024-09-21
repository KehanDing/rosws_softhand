; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude pulso_message.msg.html

(cl:defclass <pulso_message> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (static_pressure_1
    :reader static_pressure_1
    :initarg :static_pressure_1
    :type cl:fixnum
    :initform 0)
   (static_pressure_2
    :reader static_pressure_2
    :initarg :static_pressure_2
    :type cl:fixnum
    :initform 0)
   (static_pressure_3
    :reader static_pressure_3
    :initarg :static_pressure_3
    :type cl:fixnum
    :initform 0)
   (dynamic_pulse_1
    :reader dynamic_pulse_1
    :initarg :dynamic_pulse_1
    :type cl:fixnum
    :initform 0)
   (dynamic_pulse_2
    :reader dynamic_pulse_2
    :initarg :dynamic_pulse_2
    :type cl:fixnum
    :initform 0)
   (dynamic_pulse_3
    :reader dynamic_pulse_3
    :initarg :dynamic_pulse_3
    :type cl:fixnum
    :initform 0))
)

(cl:defclass pulso_message (<pulso_message>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pulso_message>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pulso_message)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<pulso_message> is deprecated: use serial_communication-msg:pulso_message instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <pulso_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:ID-val is deprecated.  Use serial_communication-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'static_pressure_1-val :lambda-list '(m))
(cl:defmethod static_pressure_1-val ((m <pulso_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:static_pressure_1-val is deprecated.  Use serial_communication-msg:static_pressure_1 instead.")
  (static_pressure_1 m))

(cl:ensure-generic-function 'static_pressure_2-val :lambda-list '(m))
(cl:defmethod static_pressure_2-val ((m <pulso_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:static_pressure_2-val is deprecated.  Use serial_communication-msg:static_pressure_2 instead.")
  (static_pressure_2 m))

(cl:ensure-generic-function 'static_pressure_3-val :lambda-list '(m))
(cl:defmethod static_pressure_3-val ((m <pulso_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:static_pressure_3-val is deprecated.  Use serial_communication-msg:static_pressure_3 instead.")
  (static_pressure_3 m))

(cl:ensure-generic-function 'dynamic_pulse_1-val :lambda-list '(m))
(cl:defmethod dynamic_pulse_1-val ((m <pulso_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:dynamic_pulse_1-val is deprecated.  Use serial_communication-msg:dynamic_pulse_1 instead.")
  (dynamic_pulse_1 m))

(cl:ensure-generic-function 'dynamic_pulse_2-val :lambda-list '(m))
(cl:defmethod dynamic_pulse_2-val ((m <pulso_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:dynamic_pulse_2-val is deprecated.  Use serial_communication-msg:dynamic_pulse_2 instead.")
  (dynamic_pulse_2 m))

(cl:ensure-generic-function 'dynamic_pulse_3-val :lambda-list '(m))
(cl:defmethod dynamic_pulse_3-val ((m <pulso_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:dynamic_pulse_3-val is deprecated.  Use serial_communication-msg:dynamic_pulse_3 instead.")
  (dynamic_pulse_3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pulso_message>) ostream)
  "Serializes a message object of type '<pulso_message>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'static_pressure_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'static_pressure_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'static_pressure_2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'static_pressure_2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'static_pressure_3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'static_pressure_3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynamic_pulse_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dynamic_pulse_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynamic_pulse_2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dynamic_pulse_2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynamic_pulse_3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dynamic_pulse_3)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pulso_message>) istream)
  "Deserializes a message object of type '<pulso_message>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'static_pressure_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'static_pressure_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'static_pressure_2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'static_pressure_2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'static_pressure_3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'static_pressure_3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynamic_pulse_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dynamic_pulse_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynamic_pulse_2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dynamic_pulse_2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dynamic_pulse_3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dynamic_pulse_3)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pulso_message>)))
  "Returns string type for a message object of type '<pulso_message>"
  "serial_communication/pulso_message")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pulso_message)))
  "Returns string type for a message object of type 'pulso_message"
  "serial_communication/pulso_message")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pulso_message>)))
  "Returns md5sum for a message object of type '<pulso_message>"
  "93fb5a6b0af4819896193f51aafdbf6d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pulso_message)))
  "Returns md5sum for a message object of type 'pulso_message"
  "93fb5a6b0af4819896193f51aafdbf6d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pulso_message>)))
  "Returns full string definition for message of type '<pulso_message>"
  (cl:format cl:nil "uint8 ID~%uint16 static_pressure_1~%uint16 static_pressure_2~%uint16 static_pressure_3~%uint16 dynamic_pulse_1~%uint16 dynamic_pulse_2~%uint16 dynamic_pulse_3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pulso_message)))
  "Returns full string definition for message of type 'pulso_message"
  (cl:format cl:nil "uint8 ID~%uint16 static_pressure_1~%uint16 static_pressure_2~%uint16 static_pressure_3~%uint16 dynamic_pulse_1~%uint16 dynamic_pulse_2~%uint16 dynamic_pulse_3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pulso_message>))
  (cl:+ 0
     1
     2
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pulso_message>))
  "Converts a ROS message object to a list"
  (cl:list 'pulso_message
    (cl:cons ':ID (ID msg))
    (cl:cons ':static_pressure_1 (static_pressure_1 msg))
    (cl:cons ':static_pressure_2 (static_pressure_2 msg))
    (cl:cons ':static_pressure_3 (static_pressure_3 msg))
    (cl:cons ':dynamic_pulse_1 (dynamic_pulse_1 msg))
    (cl:cons ':dynamic_pulse_2 (dynamic_pulse_2 msg))
    (cl:cons ':dynamic_pulse_3 (dynamic_pulse_3 msg))
))
