// Auto-generated. Do not edit!

// (in-package serial_communication.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let imu_data = require('./imu_data.js');

//-----------------------------------------------------------

class finger_imu {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.PIP = null;
      this.DIP = null;
      this.MCP = null;
    }
    else {
      if (initObj.hasOwnProperty('PIP')) {
        this.PIP = initObj.PIP
      }
      else {
        this.PIP = new imu_data();
      }
      if (initObj.hasOwnProperty('DIP')) {
        this.DIP = initObj.DIP
      }
      else {
        this.DIP = new imu_data();
      }
      if (initObj.hasOwnProperty('MCP')) {
        this.MCP = initObj.MCP
      }
      else {
        this.MCP = new imu_data();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type finger_imu
    // Serialize message field [PIP]
    bufferOffset = imu_data.serialize(obj.PIP, buffer, bufferOffset);
    // Serialize message field [DIP]
    bufferOffset = imu_data.serialize(obj.DIP, buffer, bufferOffset);
    // Serialize message field [MCP]
    bufferOffset = imu_data.serialize(obj.MCP, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type finger_imu
    let len;
    let data = new finger_imu(null);
    // Deserialize message field [PIP]
    data.PIP = imu_data.deserialize(buffer, bufferOffset);
    // Deserialize message field [DIP]
    data.DIP = imu_data.deserialize(buffer, bufferOffset);
    // Deserialize message field [MCP]
    data.MCP = imu_data.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 84;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/finger_imu';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6bf62a0961009be9a01fecdc8cf84a21';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    imu_data PIP
    imu_data DIP
    imu_data MCP
    ================================================================================
    MSG: serial_communication/imu_data
    float32 q0
    float32 q1
    float32 q2
    float32 q3
    float32 roll
    float32 pitch
    float32 yaw
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new finger_imu(null);
    if (msg.PIP !== undefined) {
      resolved.PIP = imu_data.Resolve(msg.PIP)
    }
    else {
      resolved.PIP = new imu_data()
    }

    if (msg.DIP !== undefined) {
      resolved.DIP = imu_data.Resolve(msg.DIP)
    }
    else {
      resolved.DIP = new imu_data()
    }

    if (msg.MCP !== undefined) {
      resolved.MCP = imu_data.Resolve(msg.MCP)
    }
    else {
      resolved.MCP = new imu_data()
    }

    return resolved;
    }
};

module.exports = finger_imu;
