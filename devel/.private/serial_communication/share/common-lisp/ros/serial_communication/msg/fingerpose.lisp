; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude fingerpose.msg.html

(cl:defclass <fingerpose> (roslisp-msg-protocol:ros-message)
  ((origin_Q_tag1
    :reader origin_Q_tag1
    :initarg :origin_Q_tag1
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (origin_Q_tag2
    :reader origin_Q_tag2
    :initarg :origin_Q_tag2
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (origin_Q_tag3
    :reader origin_Q_tag3
    :initarg :origin_Q_tag3
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (YAW_DIP
    :reader YAW_DIP
    :initarg :YAW_DIP
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (TRANS_DIP
    :reader TRANS_DIP
    :initarg :TRANS_DIP
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (YAW_PIP
    :reader YAW_PIP
    :initarg :YAW_PIP
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (TRANS_PIP
    :reader TRANS_PIP
    :initarg :TRANS_PIP
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (YAW_MCP
    :reader YAW_MCP
    :initarg :YAW_MCP
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (TRANS_MCP
    :reader TRANS_MCP
    :initarg :TRANS_MCP
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass fingerpose (<fingerpose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <fingerpose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'fingerpose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<fingerpose> is deprecated: use serial_communication-msg:fingerpose instead.")))

(cl:ensure-generic-function 'origin_Q_tag1-val :lambda-list '(m))
(cl:defmethod origin_Q_tag1-val ((m <fingerpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:origin_Q_tag1-val is deprecated.  Use serial_communication-msg:origin_Q_tag1 instead.")
  (origin_Q_tag1 m))

(cl:ensure-generic-function 'origin_Q_tag2-val :lambda-list '(m))
(cl:defmethod origin_Q_tag2-val ((m <fingerpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:origin_Q_tag2-val is deprecated.  Use serial_communication-msg:origin_Q_tag2 instead.")
  (origin_Q_tag2 m))

(cl:ensure-generic-function 'origin_Q_tag3-val :lambda-list '(m))
(cl:defmethod origin_Q_tag3-val ((m <fingerpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:origin_Q_tag3-val is deprecated.  Use serial_communication-msg:origin_Q_tag3 instead.")
  (origin_Q_tag3 m))

(cl:ensure-generic-function 'YAW_DIP-val :lambda-list '(m))
(cl:defmethod YAW_DIP-val ((m <fingerpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:YAW_DIP-val is deprecated.  Use serial_communication-msg:YAW_DIP instead.")
  (YAW_DIP m))

(cl:ensure-generic-function 'TRANS_DIP-val :lambda-list '(m))
(cl:defmethod TRANS_DIP-val ((m <fingerpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:TRANS_DIP-val is deprecated.  Use serial_communication-msg:TRANS_DIP instead.")
  (TRANS_DIP m))

(cl:ensure-generic-function 'YAW_PIP-val :lambda-list '(m))
(cl:defmethod YAW_PIP-val ((m <fingerpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:YAW_PIP-val is deprecated.  Use serial_communication-msg:YAW_PIP instead.")
  (YAW_PIP m))

(cl:ensure-generic-function 'TRANS_PIP-val :lambda-list '(m))
(cl:defmethod TRANS_PIP-val ((m <fingerpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:TRANS_PIP-val is deprecated.  Use serial_communication-msg:TRANS_PIP instead.")
  (TRANS_PIP m))

(cl:ensure-generic-function 'YAW_MCP-val :lambda-list '(m))
(cl:defmethod YAW_MCP-val ((m <fingerpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:YAW_MCP-val is deprecated.  Use serial_communication-msg:YAW_MCP instead.")
  (YAW_MCP m))

(cl:ensure-generic-function 'TRANS_MCP-val :lambda-list '(m))
(cl:defmethod TRANS_MCP-val ((m <fingerpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:TRANS_MCP-val is deprecated.  Use serial_communication-msg:TRANS_MCP instead.")
  (TRANS_MCP m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <fingerpose>) ostream)
  "Serializes a message object of type '<fingerpose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'origin_Q_tag1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'origin_Q_tag2) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'origin_Q_tag3) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'YAW_DIP) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'TRANS_DIP) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'YAW_PIP) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'TRANS_PIP) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'YAW_MCP) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'TRANS_MCP) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <fingerpose>) istream)
  "Deserializes a message object of type '<fingerpose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'origin_Q_tag1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'origin_Q_tag2) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'origin_Q_tag3) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'YAW_DIP) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'TRANS_DIP) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'YAW_PIP) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'TRANS_PIP) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'YAW_MCP) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'TRANS_MCP) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<fingerpose>)))
  "Returns string type for a message object of type '<fingerpose>"
  "serial_communication/fingerpose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'fingerpose)))
  "Returns string type for a message object of type 'fingerpose"
  "serial_communication/fingerpose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<fingerpose>)))
  "Returns md5sum for a message object of type '<fingerpose>"
  "6052868b9a4add2e7c42afe8a4c83c4d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'fingerpose)))
  "Returns md5sum for a message object of type 'fingerpose"
  "6052868b9a4add2e7c42afe8a4c83c4d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<fingerpose>)))
  "Returns full string definition for message of type '<fingerpose>"
  (cl:format cl:nil "geometry_msgs/Quaternion origin_Q_tag1~%geometry_msgs/Quaternion origin_Q_tag2~%geometry_msgs/Quaternion origin_Q_tag3~%geometry_msgs/Vector3 YAW_DIP~%geometry_msgs/Vector3 TRANS_DIP~%geometry_msgs/Vector3 YAW_PIP~%geometry_msgs/Vector3 TRANS_PIP~%geometry_msgs/Vector3 YAW_MCP~%geometry_msgs/Vector3 TRANS_MCP~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'fingerpose)))
  "Returns full string definition for message of type 'fingerpose"
  (cl:format cl:nil "geometry_msgs/Quaternion origin_Q_tag1~%geometry_msgs/Quaternion origin_Q_tag2~%geometry_msgs/Quaternion origin_Q_tag3~%geometry_msgs/Vector3 YAW_DIP~%geometry_msgs/Vector3 TRANS_DIP~%geometry_msgs/Vector3 YAW_PIP~%geometry_msgs/Vector3 TRANS_PIP~%geometry_msgs/Vector3 YAW_MCP~%geometry_msgs/Vector3 TRANS_MCP~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <fingerpose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'origin_Q_tag1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'origin_Q_tag2))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'origin_Q_tag3))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'YAW_DIP))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'TRANS_DIP))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'YAW_PIP))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'TRANS_PIP))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'YAW_MCP))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'TRANS_MCP))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <fingerpose>))
  "Converts a ROS message object to a list"
  (cl:list 'fingerpose
    (cl:cons ':origin_Q_tag1 (origin_Q_tag1 msg))
    (cl:cons ':origin_Q_tag2 (origin_Q_tag2 msg))
    (cl:cons ':origin_Q_tag3 (origin_Q_tag3 msg))
    (cl:cons ':YAW_DIP (YAW_DIP msg))
    (cl:cons ':TRANS_DIP (TRANS_DIP msg))
    (cl:cons ':YAW_PIP (YAW_PIP msg))
    (cl:cons ':TRANS_PIP (TRANS_PIP msg))
    (cl:cons ':YAW_MCP (YAW_MCP msg))
    (cl:cons ':TRANS_MCP (TRANS_MCP msg))
))
