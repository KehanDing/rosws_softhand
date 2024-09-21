// Auto-generated. Do not edit!

// (in-package obtain_angle.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class fingerpose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.origin_Q_tag1 = null;
      this.origin_Q_tag2 = null;
      this.origin_Q_tag3 = null;
      this.YAW_DIP = null;
      this.TRANS_DIP = null;
      this.YAW_PIP = null;
      this.TRANS_PIP = null;
      this.YAW_MCP = null;
      this.TRANS_MCP = null;
    }
    else {
      if (initObj.hasOwnProperty('origin_Q_tag1')) {
        this.origin_Q_tag1 = initObj.origin_Q_tag1
      }
      else {
        this.origin_Q_tag1 = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('origin_Q_tag2')) {
        this.origin_Q_tag2 = initObj.origin_Q_tag2
      }
      else {
        this.origin_Q_tag2 = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('origin_Q_tag3')) {
        this.origin_Q_tag3 = initObj.origin_Q_tag3
      }
      else {
        this.origin_Q_tag3 = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('YAW_DIP')) {
        this.YAW_DIP = initObj.YAW_DIP
      }
      else {
        this.YAW_DIP = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('TRANS_DIP')) {
        this.TRANS_DIP = initObj.TRANS_DIP
      }
      else {
        this.TRANS_DIP = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('YAW_PIP')) {
        this.YAW_PIP = initObj.YAW_PIP
      }
      else {
        this.YAW_PIP = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('TRANS_PIP')) {
        this.TRANS_PIP = initObj.TRANS_PIP
      }
      else {
        this.TRANS_PIP = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('YAW_MCP')) {
        this.YAW_MCP = initObj.YAW_MCP
      }
      else {
        this.YAW_MCP = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('TRANS_MCP')) {
        this.TRANS_MCP = initObj.TRANS_MCP
      }
      else {
        this.TRANS_MCP = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type fingerpose
    // Serialize message field [origin_Q_tag1]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.origin_Q_tag1, buffer, bufferOffset);
    // Serialize message field [origin_Q_tag2]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.origin_Q_tag2, buffer, bufferOffset);
    // Serialize message field [origin_Q_tag3]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.origin_Q_tag3, buffer, bufferOffset);
    // Serialize message field [YAW_DIP]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.YAW_DIP, buffer, bufferOffset);
    // Serialize message field [TRANS_DIP]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.TRANS_DIP, buffer, bufferOffset);
    // Serialize message field [YAW_PIP]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.YAW_PIP, buffer, bufferOffset);
    // Serialize message field [TRANS_PIP]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.TRANS_PIP, buffer, bufferOffset);
    // Serialize message field [YAW_MCP]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.YAW_MCP, buffer, bufferOffset);
    // Serialize message field [TRANS_MCP]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.TRANS_MCP, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type fingerpose
    let len;
    let data = new fingerpose(null);
    // Deserialize message field [origin_Q_tag1]
    data.origin_Q_tag1 = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [origin_Q_tag2]
    data.origin_Q_tag2 = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [origin_Q_tag3]
    data.origin_Q_tag3 = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [YAW_DIP]
    data.YAW_DIP = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [TRANS_DIP]
    data.TRANS_DIP = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [YAW_PIP]
    data.YAW_PIP = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [TRANS_PIP]
    data.TRANS_PIP = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [YAW_MCP]
    data.YAW_MCP = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [TRANS_MCP]
    data.TRANS_MCP = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 240;
  }

  static datatype() {
    // Returns string type for a message object
    return 'obtain_angle/fingerpose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6052868b9a4add2e7c42afe8a4c83c4d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new fingerpose(null);
    if (msg.origin_Q_tag1 !== undefined) {
      resolved.origin_Q_tag1 = geometry_msgs.msg.Quaternion.Resolve(msg.origin_Q_tag1)
    }
    else {
      resolved.origin_Q_tag1 = new geometry_msgs.msg.Quaternion()
    }

    if (msg.origin_Q_tag2 !== undefined) {
      resolved.origin_Q_tag2 = geometry_msgs.msg.Quaternion.Resolve(msg.origin_Q_tag2)
    }
    else {
      resolved.origin_Q_tag2 = new geometry_msgs.msg.Quaternion()
    }

    if (msg.origin_Q_tag3 !== undefined) {
      resolved.origin_Q_tag3 = geometry_msgs.msg.Quaternion.Resolve(msg.origin_Q_tag3)
    }
    else {
      resolved.origin_Q_tag3 = new geometry_msgs.msg.Quaternion()
    }

    if (msg.YAW_DIP !== undefined) {
      resolved.YAW_DIP = geometry_msgs.msg.Vector3.Resolve(msg.YAW_DIP)
    }
    else {
      resolved.YAW_DIP = new geometry_msgs.msg.Vector3()
    }

    if (msg.TRANS_DIP !== undefined) {
      resolved.TRANS_DIP = geometry_msgs.msg.Vector3.Resolve(msg.TRANS_DIP)
    }
    else {
      resolved.TRANS_DIP = new geometry_msgs.msg.Vector3()
    }

    if (msg.YAW_PIP !== undefined) {
      resolved.YAW_PIP = geometry_msgs.msg.Vector3.Resolve(msg.YAW_PIP)
    }
    else {
      resolved.YAW_PIP = new geometry_msgs.msg.Vector3()
    }

    if (msg.TRANS_PIP !== undefined) {
      resolved.TRANS_PIP = geometry_msgs.msg.Vector3.Resolve(msg.TRANS_PIP)
    }
    else {
      resolved.TRANS_PIP = new geometry_msgs.msg.Vector3()
    }

    if (msg.YAW_MCP !== undefined) {
      resolved.YAW_MCP = geometry_msgs.msg.Vector3.Resolve(msg.YAW_MCP)
    }
    else {
      resolved.YAW_MCP = new geometry_msgs.msg.Vector3()
    }

    if (msg.TRANS_MCP !== undefined) {
      resolved.TRANS_MCP = geometry_msgs.msg.Vector3.Resolve(msg.TRANS_MCP)
    }
    else {
      resolved.TRANS_MCP = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = fingerpose;
