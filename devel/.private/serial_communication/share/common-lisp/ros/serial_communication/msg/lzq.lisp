; Auto-generated. Do not edit!


(cl:in-package serial_communication-msg)


;//! \htmlinclude lzq.msg.html

(cl:defclass <lzq> (roslisp-msg-protocol:ros-message)
  ((num
    :reader num
    :initarg :num
    :type cl:integer
    :initform 0)
   (thumb
    :reader thumb
    :initarg :thumb
    :type cl:float
    :initform 0.0)
   (index
    :reader index
    :initarg :index
    :type cl:float
    :initform 0.0)
   (middle
    :reader middle
    :initarg :middle
    :type cl:float
    :initform 0.0)
   (ring
    :reader ring
    :initarg :ring
    :type cl:float
    :initform 0.0)
   (little
    :reader little
    :initarg :little
    :type cl:float
    :initform 0.0))
)

(cl:defclass lzq (<lzq>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <lzq>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'lzq)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_communication-msg:<lzq> is deprecated: use serial_communication-msg:lzq instead.")))

(cl:ensure-generic-function 'num-val :lambda-list '(m))
(cl:defmethod num-val ((m <lzq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:num-val is deprecated.  Use serial_communication-msg:num instead.")
  (num m))

(cl:ensure-generic-function 'thumb-val :lambda-list '(m))
(cl:defmethod thumb-val ((m <lzq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:thumb-val is deprecated.  Use serial_communication-msg:thumb instead.")
  (thumb m))

(cl:ensure-generic-function 'index-val :lambda-list '(m))
(cl:defmethod index-val ((m <lzq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:index-val is deprecated.  Use serial_communication-msg:index instead.")
  (index m))

(cl:ensure-generic-function 'middle-val :lambda-list '(m))
(cl:defmethod middle-val ((m <lzq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:middle-val is deprecated.  Use serial_communication-msg:middle instead.")
  (middle m))

(cl:ensure-generic-function 'ring-val :lambda-list '(m))
(cl:defmethod ring-val ((m <lzq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:ring-val is deprecated.  Use serial_communication-msg:ring instead.")
  (ring m))

(cl:ensure-generic-function 'little-val :lambda-list '(m))
(cl:defmethod little-val ((m <lzq>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_communication-msg:little-val is deprecated.  Use serial_communication-msg:little instead.")
  (little m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <lzq>) ostream)
  "Serializes a message object of type '<lzq>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'num)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'thumb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'index))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'middle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ring))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'little))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <lzq>) istream)
  "Deserializes a message object of type '<lzq>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'thumb) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'index) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'middle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ring) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'little) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<lzq>)))
  "Returns string type for a message object of type '<lzq>"
  "serial_communication/lzq")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'lzq)))
  "Returns string type for a message object of type 'lzq"
  "serial_communication/lzq")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<lzq>)))
  "Returns md5sum for a message object of type '<lzq>"
  "da64289d8beb7c3bfcf74e7727a35840")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'lzq)))
  "Returns md5sum for a message object of type 'lzq"
  "da64289d8beb7c3bfcf74e7727a35840")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<lzq>)))
  "Returns full string definition for message of type '<lzq>"
  (cl:format cl:nil "uint32 num~%float32  thumb~%float32  index~%float32  middle~%float32  ring~%float32  little~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'lzq)))
  "Returns full string definition for message of type 'lzq"
  (cl:format cl:nil "uint32 num~%float32  thumb~%float32  index~%float32  middle~%float32  ring~%float32  little~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <lzq>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <lzq>))
  "Converts a ROS message object to a list"
  (cl:list 'lzq
    (cl:cons ':num (num msg))
    (cl:cons ':thumb (thumb msg))
    (cl:cons ':index (index msg))
    (cl:cons ':middle (middle msg))
    (cl:cons ':ring (ring msg))
    (cl:cons ':little (little msg))
))
