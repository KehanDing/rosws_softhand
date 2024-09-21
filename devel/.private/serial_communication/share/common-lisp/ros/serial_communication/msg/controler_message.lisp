; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude controler_message.msg.html

(cl:defclass <controler_message> (roslisp-msg-protocol:ros-message)
  ((ID
    :reader ID
    :initarg :ID
    :type cl:fixnum
    :initform 0)
   (time
    :reader time
    :initarg :time
    :type cl:fixnum
    :initform 0)
   (Pressure_Data
    :reader Pressure_Data
    :initarg :Pressure_Data
    :type serial_communication-msg:hand_pressure
    :initform (cl:make-instance 'serial_communication-msg:hand_pressure))
   (EGaIn_Data
    :reader EGaIn_Data
    :initarg :EGaIn_Data
    :type serial_communication-msg:hand_egain
    :initform (cl:make-instance 'serial_communication-msg:hand_egain))
   (Force_Data
    :reader Force_Data
    :initarg :Force_Data
    :type serial_communication-msg:hand_force
    :initform (cl:make-instance 'serial_communication-msg:hand_force))
   (IMU_Data
    :reader IMU_Data
    :initarg :IMU_Data
    :type serial_communication-msg:hand_imu
    :initform (cl:make-instance 'serial_communication-msg:hand_imu)))
)

(cl:defclass controler_message (<controler_message>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <controler_message>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'controler_message)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<controler_message> is deprecated: use serial_communication-msg:controler_message instead.")))

(cl:ensure-generic-function 'ID-val :lambda-list '(m))
(cl:defmethod ID-val ((m <controler_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:ID-val is deprecated.  Use serial_communication-msg:ID instead.")
  (ID m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <controler_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:time-val is deprecated.  Use serial_communication-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'Pressure_Data-val :lambda-list '(m))
(cl:defmethod Pressure_Data-val ((m <controler_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:Pressure_Data-val is deprecated.  Use serial_communication-msg:Pressure_Data instead.")
  (Pressure_Data m))

(cl:ensure-generic-function 'EGaIn_Data-val :lambda-list '(m))
(cl:defmethod EGaIn_Data-val ((m <controler_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:EGaIn_Data-val is deprecated.  Use serial_communication-msg:EGaIn_Data instead.")
  (EGaIn_Data m))

(cl:ensure-generic-function 'Force_Data-val :lambda-list '(m))
(cl:defmethod Force_Data-val ((m <controler_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:Force_Data-val is deprecated.  Use serial_communication-msg:Force_Data instead.")
  (Force_Data m))

(cl:ensure-generic-function 'IMU_Data-val :lambda-list '(m))
(cl:defmethod IMU_Data-val ((m <controler_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:IMU_Data-val is deprecated.  Use serial_communication-msg:IMU_Data instead.")
  (IMU_Data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <controler_message>) ostream)
  "Serializes a message object of type '<controler_message>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Pressure_Data) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'EGaIn_Data) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Force_Data) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'IMU_Data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <controler_message>) istream)
  "Deserializes a message object of type '<controler_message>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ID)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Pressure_Data) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'EGaIn_Data) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Force_Data) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'IMU_Data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<controler_message>)))
  "Returns string type for a message object of type '<controler_message>"
  "serial_communication/controler_message")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controler_message)))
  "Returns string type for a message object of type 'controler_message"
  "serial_communication/controler_message")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<controler_message>)))
  "Returns md5sum for a message object of type '<controler_message>"
  "01633c681b9e513b3493801e5ce828b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'controler_message)))
  "Returns md5sum for a message object of type 'controler_message"
  "01633c681b9e513b3493801e5ce828b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<controler_message>)))
  "Returns full string definition for message of type '<controler_message>"
  (cl:format cl:nil "uint8 ID~%uint16 time~%hand_pressure Pressure_Data~%hand_egain EGaIn_Data~%hand_force Force_Data~%hand_imu IMU_Data~%================================================================================~%MSG: serial_communication/hand_pressure~%finger_pressure THUMB0~%finger_pressure THUMB1~%finger_pressure INDEX~%finger_pressure MIDDLE~%finger_pressure RING~%finger_pressure LITTLE~%~%================================================================================~%MSG: serial_communication/finger_pressure~%float32 IP~%float32 MCPB~%float32 MCPAL~%float32 MCPAR~%~%================================================================================~%MSG: serial_communication/hand_egain~%finger_egain THUMB0~%finger_egain THUMB1~%finger_egain INDEX~%finger_egain MIDDLE~%finger_egain RING~%finger_egain LITTLE~%~%================================================================================~%MSG: serial_communication/finger_egain~%float32 DIP~%float32 PIP~%float32 MCPL~%float32 MCPR~%~%================================================================================~%MSG: serial_communication/hand_force~%finger_force THUMB0~%finger_force THUMB1~%finger_force INDEX~%finger_force MIDDLE~%finger_force RING~%finger_force LITTLE~%~%================================================================================~%MSG: serial_communication/finger_force~%float32 FORCE1~%float32 FORCE2~%float32 FORCE3~%float32 FORCE4~%~%================================================================================~%MSG: serial_communication/hand_imu~%uint8 ID~%uint16 time~%finger_imu THUMB~%finger_imu INDEX~%finger_imu MIDDLE~%finger_imu RING~%finger_imu LITTLE~%imu_data PALM~%================================================================================~%MSG: serial_communication/finger_imu~%imu_data PIP~%imu_data DIP~%imu_data MCP~%================================================================================~%MSG: serial_communication/imu_data~%float32 q0~%float32 q1~%float32 q2~%float32 q3~%float32 roll~%float32 pitch~%float32 yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'controler_message)))
  "Returns full string definition for message of type 'controler_message"
  (cl:format cl:nil "uint8 ID~%uint16 time~%hand_pressure Pressure_Data~%hand_egain EGaIn_Data~%hand_force Force_Data~%hand_imu IMU_Data~%================================================================================~%MSG: serial_communication/hand_pressure~%finger_pressure THUMB0~%finger_pressure THUMB1~%finger_pressure INDEX~%finger_pressure MIDDLE~%finger_pressure RING~%finger_pressure LITTLE~%~%================================================================================~%MSG: serial_communication/finger_pressure~%float32 IP~%float32 MCPB~%float32 MCPAL~%float32 MCPAR~%~%================================================================================~%MSG: serial_communication/hand_egain~%finger_egain THUMB0~%finger_egain THUMB1~%finger_egain INDEX~%finger_egain MIDDLE~%finger_egain RING~%finger_egain LITTLE~%~%================================================================================~%MSG: serial_communication/finger_egain~%float32 DIP~%float32 PIP~%float32 MCPL~%float32 MCPR~%~%================================================================================~%MSG: serial_communication/hand_force~%finger_force THUMB0~%finger_force THUMB1~%finger_force INDEX~%finger_force MIDDLE~%finger_force RING~%finger_force LITTLE~%~%================================================================================~%MSG: serial_communication/finger_force~%float32 FORCE1~%float32 FORCE2~%float32 FORCE3~%float32 FORCE4~%~%================================================================================~%MSG: serial_communication/hand_imu~%uint8 ID~%uint16 time~%finger_imu THUMB~%finger_imu INDEX~%finger_imu MIDDLE~%finger_imu RING~%finger_imu LITTLE~%imu_data PALM~%================================================================================~%MSG: serial_communication/finger_imu~%imu_data PIP~%imu_data DIP~%imu_data MCP~%================================================================================~%MSG: serial_communication/imu_data~%float32 q0~%float32 q1~%float32 q2~%float32 q3~%float32 roll~%float32 pitch~%float32 yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <controler_message>))
  (cl:+ 0
     1
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Pressure_Data))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'EGaIn_Data))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Force_Data))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'IMU_Data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <controler_message>))
  "Converts a ROS message object to a list"
  (cl:list 'controler_message
    (cl:cons ':ID (ID msg))
    (cl:cons ':time (time msg))
    (cl:cons ':Pressure_Data (Pressure_Data msg))
    (cl:cons ':EGaIn_Data (EGaIn_Data msg))
    (cl:cons ':Force_Data (Force_Data msg))
    (cl:cons ':IMU_Data (IMU_Data msg))
))
