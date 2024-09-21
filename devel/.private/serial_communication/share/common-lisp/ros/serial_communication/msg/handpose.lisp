; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude handpose.msg.html

(cl:defclass <handpose> (roslisp-msg-protocol:ros-message)
  ((THUMB
    :reader THUMB
    :initarg :THUMB
    :type serial_communication-msg:fingerpose
    :initform (cl:make-instance 'serial_communication-msg:fingerpose))
   (INDEX
    :reader INDEX
    :initarg :INDEX
    :type serial_communication-msg:fingerpose
    :initform (cl:make-instance 'serial_communication-msg:fingerpose))
   (MIDDLE
    :reader MIDDLE
    :initarg :MIDDLE
    :type serial_communication-msg:fingerpose
    :initform (cl:make-instance 'serial_communication-msg:fingerpose))
   (RING
    :reader RING
    :initarg :RING
    :type serial_communication-msg:fingerpose
    :initform (cl:make-instance 'serial_communication-msg:fingerpose))
   (LITTLE
    :reader LITTLE
    :initarg :LITTLE
    :type serial_communication-msg:fingerpose
    :initform (cl:make-instance 'serial_communication-msg:fingerpose)))
)

(cl:defclass handpose (<handpose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <handpose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'handpose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<handpose> is deprecated: use serial_communication-msg:handpose instead.")))

(cl:ensure-generic-function 'THUMB-val :lambda-list '(m))
(cl:defmethod THUMB-val ((m <handpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:THUMB-val is deprecated.  Use serial_communication-msg:THUMB instead.")
  (THUMB m))

(cl:ensure-generic-function 'INDEX-val :lambda-list '(m))
(cl:defmethod INDEX-val ((m <handpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:INDEX-val is deprecated.  Use serial_communication-msg:INDEX instead.")
  (INDEX m))

(cl:ensure-generic-function 'MIDDLE-val :lambda-list '(m))
(cl:defmethod MIDDLE-val ((m <handpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:MIDDLE-val is deprecated.  Use serial_communication-msg:MIDDLE instead.")
  (MIDDLE m))

(cl:ensure-generic-function 'RING-val :lambda-list '(m))
(cl:defmethod RING-val ((m <handpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:RING-val is deprecated.  Use serial_communication-msg:RING instead.")
  (RING m))

(cl:ensure-generic-function 'LITTLE-val :lambda-list '(m))
(cl:defmethod LITTLE-val ((m <handpose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:LITTLE-val is deprecated.  Use serial_communication-msg:LITTLE instead.")
  (LITTLE m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <handpose>) ostream)
  "Serializes a message object of type '<handpose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'THUMB) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'INDEX) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'MIDDLE) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RING) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'LITTLE) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <handpose>) istream)
  "Deserializes a message object of type '<handpose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'THUMB) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'INDEX) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'MIDDLE) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RING) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'LITTLE) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<handpose>)))
  "Returns string type for a message object of type '<handpose>"
  "serial_communication/handpose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'handpose)))
  "Returns string type for a message object of type 'handpose"
  "serial_communication/handpose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<handpose>)))
  "Returns md5sum for a message object of type '<handpose>"
  "130a0e6ad943d5ddee12bd6504eebd8e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'handpose)))
  "Returns md5sum for a message object of type 'handpose"
  "130a0e6ad943d5ddee12bd6504eebd8e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<handpose>)))
  "Returns full string definition for message of type '<handpose>"
  (cl:format cl:nil "fingerpose THUMB~%fingerpose INDEX~%fingerpose MIDDLE~%fingerpose RING~%fingerpose LITTLE~%================================================================================~%MSG: serial_communication/fingerpose~%geometry_msgs/Quaternion origin_Q_tag1~%geometry_msgs/Quaternion origin_Q_tag2~%geometry_msgs/Quaternion origin_Q_tag3~%geometry_msgs/Vector3 YAW_DIP~%geometry_msgs/Vector3 TRANS_DIP~%geometry_msgs/Vector3 YAW_PIP~%geometry_msgs/Vector3 TRANS_PIP~%geometry_msgs/Vector3 YAW_MCP~%geometry_msgs/Vector3 TRANS_MCP~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'handpose)))
  "Returns full string definition for message of type 'handpose"
  (cl:format cl:nil "fingerpose THUMB~%fingerpose INDEX~%fingerpose MIDDLE~%fingerpose RING~%fingerpose LITTLE~%================================================================================~%MSG: serial_communication/fingerpose~%geometry_msgs/Quaternion origin_Q_tag1~%geometry_msgs/Quaternion origin_Q_tag2~%geometry_msgs/Quaternion origin_Q_tag3~%geometry_msgs/Vector3 YAW_DIP~%geometry_msgs/Vector3 TRANS_DIP~%geometry_msgs/Vector3 YAW_PIP~%geometry_msgs/Vector3 TRANS_PIP~%geometry_msgs/Vector3 YAW_MCP~%geometry_msgs/Vector3 TRANS_MCP~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <handpose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'THUMB))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'INDEX))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'MIDDLE))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RING))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'LITTLE))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <handpose>))
  "Converts a ROS message object to a list"
  (cl:list 'handpose
    (cl:cons ':THUMB (THUMB msg))
    (cl:cons ':INDEX (INDEX msg))
    (cl:cons ':MIDDLE (MIDDLE msg))
    (cl:cons ':RING (RING msg))
    (cl:cons ':LITTLE (LITTLE msg))
))
