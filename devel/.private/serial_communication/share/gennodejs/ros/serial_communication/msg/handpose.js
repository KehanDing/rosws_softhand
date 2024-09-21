// Auto-generated. Do not edit!

// (in-package serial_communication.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let fingerpose = require('./fingerpose.js');

//-----------------------------------------------------------

class handpose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.THUMB = null;
      this.INDEX = null;
      this.MIDDLE = null;
      this.RING = null;
      this.LITTLE = null;
    }
    else {
      if (initObj.hasOwnProperty('THUMB')) {
        this.THUMB = initObj.THUMB
      }
      else {
        this.THUMB = new fingerpose();
      }
      if (initObj.hasOwnProperty('INDEX')) {
        this.INDEX = initObj.INDEX
      }
      else {
        this.INDEX = new fingerpose();
      }
      if (initObj.hasOwnProperty('MIDDLE')) {
        this.MIDDLE = initObj.MIDDLE
      }
      else {
        this.MIDDLE = new fingerpose();
      }
      if (initObj.hasOwnProperty('RING')) {
        this.RING = initObj.RING
      }
      else {
        this.RING = new fingerpose();
      }
      if (initObj.hasOwnProperty('LITTLE')) {
        this.LITTLE = initObj.LITTLE
      }
      else {
        this.LITTLE = new fingerpose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type handpose
    // Serialize message field [THUMB]
    bufferOffset = fingerpose.serialize(obj.THUMB, buffer, bufferOffset);
    // Serialize message field [INDEX]
    bufferOffset = fingerpose.serialize(obj.INDEX, buffer, bufferOffset);
    // Serialize message field [MIDDLE]
    bufferOffset = fingerpose.serialize(obj.MIDDLE, buffer, bufferOffset);
    // Serialize message field [RING]
    bufferOffset = fingerpose.serialize(obj.RING, buffer, bufferOffset);
    // Serialize message field [LITTLE]
    bufferOffset = fingerpose.serialize(obj.LITTLE, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type handpose
    let len;
    let data = new handpose(null);
    // Deserialize message field [THUMB]
    data.THUMB = fingerpose.deserialize(buffer, bufferOffset);
    // Deserialize message field [INDEX]
    data.INDEX = fingerpose.deserialize(buffer, bufferOffset);
    // Deserialize message field [MIDDLE]
    data.MIDDLE = fingerpose.deserialize(buffer, bufferOffset);
    // Deserialize message field [RING]
    data.RING = fingerpose.deserialize(buffer, bufferOffset);
    // Deserialize message field [LITTLE]
    data.LITTLE = fingerpose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1200;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/handpose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '130a0e6ad943d5ddee12bd6504eebd8e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    fingerpose THUMB
    fingerpose INDEX
    fingerpose MIDDLE
    fingerpose RING
    fingerpose LITTLE
    ================================================================================
    MSG: serial_communication/fingerpose
    geometry_msgs/Quaternion origin_Q_tag1
    geometry_msgs/Quaternion origin_Q_tag2
    geometry_msgs/Quaternion origin_Q_tag3
    geometry_msgs/Vector3 YAW_DIP
    geometry_msgs/Vector3 TRANS_DIP
    geometry_msgs/Vector3 YAW_PIP
    geometry_msgs/Vector3 TRANS_PIP
    geometry_msgs/Vector3 YAW_MCP
    geometry_msgs/Vector3 TRANS_MCP
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new handpose(null);
    if (msg.THUMB !== undefined) {
      resolved.THUMB = fingerpose.Resolve(msg.THUMB)
    }
    else {
      resolved.THUMB = new fingerpose()
    }

    if (msg.INDEX !== undefined) {
      resolved.INDEX = fingerpose.Resolve(msg.INDEX)
    }
    else {
      resolved.INDEX = new fingerpose()
    }

    if (msg.MIDDLE !== undefined) {
      resolved.MIDDLE = fingerpose.Resolve(msg.MIDDLE)
    }
    else {
      resolved.MIDDLE = new fingerpose()
    }

    if (msg.RING !== undefined) {
      resolved.RING = fingerpose.Resolve(msg.RING)
    }
    else {
      resolved.RING = new fingerpose()
    }

    if (msg.LITTLE !== undefined) {
      resolved.LITTLE = fingerpose.Resolve(msg.LITTLE)
    }
    else {
      resolved.LITTLE = new fingerpose()
    }

    return resolved;
    }
};

module.exports = handpose;
