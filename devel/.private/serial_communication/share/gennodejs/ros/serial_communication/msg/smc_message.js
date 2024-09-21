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

class smc_message {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ID = null;
      this.time = null;
      this.target_pressure = null;
      this.feedback_pressure = null;
      this.error = null;
      this.smc_uc = null;
      this.valve_mode = null;
    }
    else {
      if (initObj.hasOwnProperty('ID')) {
        this.ID = initObj.ID
      }
      else {
        this.ID = 0;
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = 0;
      }
      if (initObj.hasOwnProperty('target_pressure')) {
        this.target_pressure = initObj.target_pressure
      }
      else {
        this.target_pressure = 0.0;
      }
      if (initObj.hasOwnProperty('feedback_pressure')) {
        this.feedback_pressure = initObj.feedback_pressure
      }
      else {
        this.feedback_pressure = 0.0;
      }
      if (initObj.hasOwnProperty('error')) {
        this.error = initObj.error
      }
      else {
        this.error = 0.0;
      }
      if (initObj.hasOwnProperty('smc_uc')) {
        this.smc_uc = initObj.smc_uc
      }
      else {
        this.smc_uc = 0.0;
      }
      if (initObj.hasOwnProperty('valve_mode')) {
        this.valve_mode = initObj.valve_mode
      }
      else {
        this.valve_mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type smc_message
    // Serialize message field [ID]
    bufferOffset = _serializer.uint8(obj.ID, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.uint32(obj.time, buffer, bufferOffset);
    // Serialize message field [target_pressure]
    bufferOffset = _serializer.float32(obj.target_pressure, buffer, bufferOffset);
    // Serialize message field [feedback_pressure]
    bufferOffset = _serializer.float32(obj.feedback_pressure, buffer, bufferOffset);
    // Serialize message field [error]
    bufferOffset = _serializer.float32(obj.error, buffer, bufferOffset);
    // Serialize message field [smc_uc]
    bufferOffset = _serializer.float32(obj.smc_uc, buffer, bufferOffset);
    // Serialize message field [valve_mode]
    bufferOffset = _serializer.int32(obj.valve_mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type smc_message
    let len;
    let data = new smc_message(null);
    // Deserialize message field [ID]
    data.ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [target_pressure]
    data.target_pressure = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [feedback_pressure]
    data.feedback_pressure = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [error]
    data.error = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [smc_uc]
    data.smc_uc = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [valve_mode]
    data.valve_mode = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/smc_message';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bf432afdc339653f15d6954de7920050';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    uint32 time
    float32 target_pressure
    float32 feedback_pressure
    float32 error
    float32 smc_uc
    int32 valve_mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new smc_message(null);
    if (msg.ID !== undefined) {
      resolved.ID = msg.ID;
    }
    else {
      resolved.ID = 0
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = 0
    }

    if (msg.target_pressure !== undefined) {
      resolved.target_pressure = msg.target_pressure;
    }
    else {
      resolved.target_pressure = 0.0
    }

    if (msg.feedback_pressure !== undefined) {
      resolved.feedback_pressure = msg.feedback_pressure;
    }
    else {
      resolved.feedback_pressure = 0.0
    }

    if (msg.error !== undefined) {
      resolved.error = msg.error;
    }
    else {
      resolved.error = 0.0
    }

    if (msg.smc_uc !== undefined) {
      resolved.smc_uc = msg.smc_uc;
    }
    else {
      resolved.smc_uc = 0.0
    }

    if (msg.valve_mode !== undefined) {
      resolved.valve_mode = msg.valve_mode;
    }
    else {
      resolved.valve_mode = 0
    }

    return resolved;
    }
};

module.exports = smc_message;
