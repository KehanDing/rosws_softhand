// Auto-generated. Do not edit!

// (in-package serial_communication.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class finger_pressure {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.IP = null;
      this.MCPB = null;
      this.MCPAL = null;
      this.MCPAR = null;
    }
    else {
      if (initObj.hasOwnProperty('IP')) {
        this.IP = initObj.IP
      }
      else {
        this.IP = 0.0;
      }
      if (initObj.hasOwnProperty('MCPB')) {
        this.MCPB = initObj.MCPB
      }
      else {
        this.MCPB = 0.0;
      }
      if (initObj.hasOwnProperty('MCPAL')) {
        this.MCPAL = initObj.MCPAL
      }
      else {
        this.MCPAL = 0.0;
      }
      if (initObj.hasOwnProperty('MCPAR')) {
        this.MCPAR = initObj.MCPAR
      }
      else {
        this.MCPAR = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type finger_pressure
    // Serialize message field [IP]
    bufferOffset = _serializer.float32(obj.IP, buffer, bufferOffset);
    // Serialize message field [MCPB]
    bufferOffset = _serializer.float32(obj.MCPB, buffer, bufferOffset);
    // Serialize message field [MCPAL]
    bufferOffset = _serializer.float32(obj.MCPAL, buffer, bufferOffset);
    // Serialize message field [MCPAR]
    bufferOffset = _serializer.float32(obj.MCPAR, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type finger_pressure
    let len;
    let data = new finger_pressure(null);
    // Deserialize message field [IP]
    data.IP = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [MCPB]
    data.MCPB = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [MCPAL]
    data.MCPAL = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [MCPAR]
    data.MCPAR = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/finger_pressure';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '84aa983bc8589b4da228df1fce3c6dfb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 IP
    float32 MCPB
    float32 MCPAL
    float32 MCPAR
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new finger_pressure(null);
    if (msg.IP !== undefined) {
      resolved.IP = msg.IP;
    }
    else {
      resolved.IP = 0.0
    }

    if (msg.MCPB !== undefined) {
      resolved.MCPB = msg.MCPB;
    }
    else {
      resolved.MCPB = 0.0
    }

    if (msg.MCPAL !== undefined) {
      resolved.MCPAL = msg.MCPAL;
    }
    else {
      resolved.MCPAL = 0.0
    }

    if (msg.MCPAR !== undefined) {
      resolved.MCPAR = msg.MCPAR;
    }
    else {
      resolved.MCPAR = 0.0
    }

    return resolved;
    }
};

module.exports = finger_pressure;
