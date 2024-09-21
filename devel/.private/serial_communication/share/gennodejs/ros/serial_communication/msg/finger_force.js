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

class finger_force {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.FORCE1 = null;
      this.FORCE2 = null;
      this.FORCE3 = null;
      this.FORCE4 = null;
    }
    else {
      if (initObj.hasOwnProperty('FORCE1')) {
        this.FORCE1 = initObj.FORCE1
      }
      else {
        this.FORCE1 = 0.0;
      }
      if (initObj.hasOwnProperty('FORCE2')) {
        this.FORCE2 = initObj.FORCE2
      }
      else {
        this.FORCE2 = 0.0;
      }
      if (initObj.hasOwnProperty('FORCE3')) {
        this.FORCE3 = initObj.FORCE3
      }
      else {
        this.FORCE3 = 0.0;
      }
      if (initObj.hasOwnProperty('FORCE4')) {
        this.FORCE4 = initObj.FORCE4
      }
      else {
        this.FORCE4 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type finger_force
    // Serialize message field [FORCE1]
    bufferOffset = _serializer.float32(obj.FORCE1, buffer, bufferOffset);
    // Serialize message field [FORCE2]
    bufferOffset = _serializer.float32(obj.FORCE2, buffer, bufferOffset);
    // Serialize message field [FORCE3]
    bufferOffset = _serializer.float32(obj.FORCE3, buffer, bufferOffset);
    // Serialize message field [FORCE4]
    bufferOffset = _serializer.float32(obj.FORCE4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type finger_force
    let len;
    let data = new finger_force(null);
    // Deserialize message field [FORCE1]
    data.FORCE1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [FORCE2]
    data.FORCE2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [FORCE3]
    data.FORCE3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [FORCE4]
    data.FORCE4 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/finger_force';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '619b947b757f5681fe65b1c5b569b37c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 FORCE1
    float32 FORCE2
    float32 FORCE3
    float32 FORCE4
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new finger_force(null);
    if (msg.FORCE1 !== undefined) {
      resolved.FORCE1 = msg.FORCE1;
    }
    else {
      resolved.FORCE1 = 0.0
    }

    if (msg.FORCE2 !== undefined) {
      resolved.FORCE2 = msg.FORCE2;
    }
    else {
      resolved.FORCE2 = 0.0
    }

    if (msg.FORCE3 !== undefined) {
      resolved.FORCE3 = msg.FORCE3;
    }
    else {
      resolved.FORCE3 = 0.0
    }

    if (msg.FORCE4 !== undefined) {
      resolved.FORCE4 = msg.FORCE4;
    }
    else {
      resolved.FORCE4 = 0.0
    }

    return resolved;
    }
};

module.exports = finger_force;
