; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude finger_imu.msg.html

(cl:defclass <finger_imu> (roslisp-msg-protocol:ros-message)
  ((PIP
    :reader PIP
    :initarg :PIP
    :type serial_communication-msg:imu_data
    :initform (cl:make-instance 'serial_communication-msg:imu_data))
   (DIP
    :reader DIP
    :initarg :DIP
    :type serial_communication-msg:imu_data
    :initform (cl:make-instance 'serial_communication-msg:imu_data))
   (MCP
    :reader MCP
    :initarg :MCP
    :type serial_communication-msg:imu_data
    :initform (cl:make-instance 'serial_communication-msg:imu_data)))
)

(cl:defclass finger_imu (<finger_imu>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <finger_imu>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'finger_imu)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<finger_imu> is deprecated: use serial_communication-msg:finger_imu instead.")))

(cl:ensure-generic-function 'PIP-val :lambda-list '(m))
(cl:defmethod PIP-val ((m <finger_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:PIP-val is deprecated.  Use serial_communication-msg:PIP instead.")
  (PIP m))

(cl:ensure-generic-function 'DIP-val :lambda-list '(m))
(cl:defmethod DIP-val ((m <finger_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:DIP-val is deprecated.  Use serial_communication-msg:DIP instead.")
  (DIP m))

(cl:ensure-generic-function 'MCP-val :lambda-list '(m))
(cl:defmethod MCP-val ((m <finger_imu>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:MCP-val is deprecated.  Use serial_communication-msg:MCP instead.")
  (MCP m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <finger_imu>) ostream)
  "Serializes a message object of type '<finger_imu>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'PIP) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'DIP) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'MCP) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <finger_imu>) istream)
  "Deserializes a message object of type '<finger_imu>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'PIP) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'DIP) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'MCP) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<finger_imu>)))
  "Returns string type for a message object of type '<finger_imu>"
  "serial_communication/finger_imu")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'finger_imu)))
  "Returns string type for a message object of type 'finger_imu"
  "serial_communication/finger_imu")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<finger_imu>)))
  "Returns md5sum for a message object of type '<finger_imu>"
  "6bf62a0961009be9a01fecdc8cf84a21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'finger_imu)))
  "Returns md5sum for a message object of type 'finger_imu"
  "6bf62a0961009be9a01fecdc8cf84a21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<finger_imu>)))
  "Returns full string definition for message of type '<finger_imu>"
  (cl:format cl:nil "imu_data PIP~%imu_data DIP~%imu_data MCP~%================================================================================~%MSG: serial_communication/imu_data~%float32 q0~%float32 q1~%float32 q2~%float32 q3~%float32 roll~%float32 pitch~%float32 yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'finger_imu)))
  "Returns full string definition for message of type 'finger_imu"
  (cl:format cl:nil "imu_data PIP~%imu_data DIP~%imu_data MCP~%================================================================================~%MSG: serial_communication/imu_data~%float32 q0~%float32 q1~%float32 q2~%float32 q3~%float32 roll~%float32 pitch~%float32 yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <finger_imu>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'PIP))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'DIP))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'MCP))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <finger_imu>))
  "Converts a ROS message object to a list"
  (cl:list 'finger_imu
    (cl:cons ':PIP (PIP msg))
    (cl:cons ':DIP (DIP msg))
    (cl:cons ':MCP (MCP msg))
))
