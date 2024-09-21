// Auto-generated. Do not edit!

// (in-package nano_17_ethercat.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class FT_nano17 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.TORQUE_X = null;
      this.TORQUE_Y = null;
      this.TORQUE_Z = null;
      this.FORCE_X = null;
      this.FORCE_Y = null;
      this.FORCE_Z = null;
    }
    else {
      if (initObj.hasOwnProperty('TORQUE_X')) {
        this.TORQUE_X = initObj.TORQUE_X
      }
      else {
        this.TORQUE_X = 0.0;
      }
      if (initObj.hasOwnProperty('TORQUE_Y')) {
        this.TORQUE_Y = initObj.TORQUE_Y
      }
      else {
        this.TORQUE_Y = 0.0;
      }
      if (initObj.hasOwnProperty('TORQUE_Z')) {
        this.TORQUE_Z = initObj.TORQUE_Z
      }
      else {
        this.TORQUE_Z = 0.0;
      }
      if (initObj.hasOwnProperty('FORCE_X')) {
        this.FORCE_X = initObj.FORCE_X
      }
      else {
        this.FORCE_X = 0.0;
      }
      if (initObj.hasOwnProperty('FORCE_Y')) {
        this.FORCE_Y = initObj.FORCE_Y
      }
      else {
        this.FORCE_Y = 0.0;
      }
      if (initObj.hasOwnProperty('FORCE_Z')) {
        this.FORCE_Z = initObj.FORCE_Z
      }
      else {
        this.FORCE_Z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FT_nano17
    // Serialize message field [TORQUE_X]
    bufferOffset = _serializer.float32(obj.TORQUE_X, buffer, bufferOffset);
    // Serialize message field [TORQUE_Y]
    bufferOffset = _serializer.float32(obj.TORQUE_Y, buffer, bufferOffset);
    // Serialize message field [TORQUE_Z]
    bufferOffset = _serializer.float32(obj.TORQUE_Z, buffer, bufferOffset);
    // Serialize message field [FORCE_X]
    bufferOffset = _serializer.float32(obj.FORCE_X, buffer, bufferOffset);
    // Serialize message field [FORCE_Y]
    bufferOffset = _serializer.float32(obj.FORCE_Y, buffer, bufferOffset);
    // Serialize message field [FORCE_Z]
    bufferOffset = _serializer.float32(obj.FORCE_Z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FT_nano17
    let len;
    let data = new FT_nano17(null);
    // Deserialize message field [TORQUE_X]
    data.TORQUE_X = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [TORQUE_Y]
    data.TORQUE_Y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [TORQUE_Z]
    data.TORQUE_Z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [FORCE_X]
    data.FORCE_X = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [FORCE_Y]
    data.FORCE_Y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [FORCE_Z]
    data.FORCE_Z = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'nano_17_ethercat/FT_nano17';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b3cc10406904387a2b764bbc39a449c3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 TORQUE_X
    float32 TORQUE_Y
    float32 TORQUE_Z
    float32 FORCE_X
    float32 FORCE_Y
    float32 FORCE_Z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FT_nano17(null);
    if (msg.TORQUE_X !== undefined) {
      resolved.TORQUE_X = msg.TORQUE_X;
    }
    else {
      resolved.TORQUE_X = 0.0
    }

    if (msg.TORQUE_Y !== undefined) {
      resolved.TORQUE_Y = msg.TORQUE_Y;
    }
    else {
      resolved.TORQUE_Y = 0.0
    }

    if (msg.TORQUE_Z !== undefined) {
      resolved.TORQUE_Z = msg.TORQUE_Z;
    }
    else {
      resolved.TORQUE_Z = 0.0
    }

    if (msg.FORCE_X !== undefined) {
      resolved.FORCE_X = msg.FORCE_X;
    }
    else {
      resolved.FORCE_X = 0.0
    }

    if (msg.FORCE_Y !== undefined) {
      resolved.FORCE_Y = msg.FORCE_Y;
    }
    else {
      resolved.FORCE_Y = 0.0
    }

    if (msg.FORCE_Z !== undefined) {
      resolved.FORCE_Z = msg.FORCE_Z;
    }
    else {
      resolved.FORCE_Z = 0.0
    }

    return resolved;
    }
};

module.exports = FT_nano17;
