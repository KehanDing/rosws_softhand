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

class finger_egain {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.DIP = null;
      this.PIP = null;
      this.MCPL = null;
      this.MCPR = null;
    }
    else {
      if (initObj.hasOwnProperty('DIP')) {
        this.DIP = initObj.DIP
      }
      else {
        this.DIP = 0.0;
      }
      if (initObj.hasOwnProperty('PIP')) {
        this.PIP = initObj.PIP
      }
      else {
        this.PIP = 0.0;
      }
      if (initObj.hasOwnProperty('MCPL')) {
        this.MCPL = initObj.MCPL
      }
      else {
        this.MCPL = 0.0;
      }
      if (initObj.hasOwnProperty('MCPR')) {
        this.MCPR = initObj.MCPR
      }
      else {
        this.MCPR = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type finger_egain
    // Serialize message field [DIP]
    bufferOffset = _serializer.float32(obj.DIP, buffer, bufferOffset);
    // Serialize message field [PIP]
    bufferOffset = _serializer.float32(obj.PIP, buffer, bufferOffset);
    // Serialize message field [MCPL]
    bufferOffset = _serializer.float32(obj.MCPL, buffer, bufferOffset);
    // Serialize message field [MCPR]
    bufferOffset = _serializer.float32(obj.MCPR, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type finger_egain
    let len;
    let data = new finger_egain(null);
    // Deserialize message field [DIP]
    data.DIP = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [PIP]
    data.PIP = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [MCPL]
    data.MCPL = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [MCPR]
    data.MCPR = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/finger_egain';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6915de8760abcc9afcc2687afb58825d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 DIP
    float32 PIP
    float32 MCPL
    float32 MCPR
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new finger_egain(null);
    if (msg.DIP !== undefined) {
      resolved.DIP = msg.DIP;
    }
    else {
      resolved.DIP = 0.0
    }

    if (msg.PIP !== undefined) {
      resolved.PIP = msg.PIP;
    }
    else {
      resolved.PIP = 0.0
    }

    if (msg.MCPL !== undefined) {
      resolved.MCPL = msg.MCPL;
    }
    else {
      resolved.MCPL = 0.0
    }

    if (msg.MCPR !== undefined) {
      resolved.MCPR = msg.MCPR;
    }
    else {
      resolved.MCPR = 0.0
    }

    return resolved;
    }
};

module.exports = finger_egain;
