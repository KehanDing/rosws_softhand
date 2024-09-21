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

class pulso_message {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ID = null;
      this.static_pressure_1 = null;
      this.static_pressure_2 = null;
      this.static_pressure_3 = null;
      this.dynamic_pulse_1 = null;
      this.dynamic_pulse_2 = null;
      this.dynamic_pulse_3 = null;
    }
    else {
      if (initObj.hasOwnProperty('ID')) {
        this.ID = initObj.ID
      }
      else {
        this.ID = 0;
      }
      if (initObj.hasOwnProperty('static_pressure_1')) {
        this.static_pressure_1 = initObj.static_pressure_1
      }
      else {
        this.static_pressure_1 = 0;
      }
      if (initObj.hasOwnProperty('static_pressure_2')) {
        this.static_pressure_2 = initObj.static_pressure_2
      }
      else {
        this.static_pressure_2 = 0;
      }
      if (initObj.hasOwnProperty('static_pressure_3')) {
        this.static_pressure_3 = initObj.static_pressure_3
      }
      else {
        this.static_pressure_3 = 0;
      }
      if (initObj.hasOwnProperty('dynamic_pulse_1')) {
        this.dynamic_pulse_1 = initObj.dynamic_pulse_1
      }
      else {
        this.dynamic_pulse_1 = 0;
      }
      if (initObj.hasOwnProperty('dynamic_pulse_2')) {
        this.dynamic_pulse_2 = initObj.dynamic_pulse_2
      }
      else {
        this.dynamic_pulse_2 = 0;
      }
      if (initObj.hasOwnProperty('dynamic_pulse_3')) {
        this.dynamic_pulse_3 = initObj.dynamic_pulse_3
      }
      else {
        this.dynamic_pulse_3 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type pulso_message
    // Serialize message field [ID]
    bufferOffset = _serializer.uint8(obj.ID, buffer, bufferOffset);
    // Serialize message field [static_pressure_1]
    bufferOffset = _serializer.uint16(obj.static_pressure_1, buffer, bufferOffset);
    // Serialize message field [static_pressure_2]
    bufferOffset = _serializer.uint16(obj.static_pressure_2, buffer, bufferOffset);
    // Serialize message field [static_pressure_3]
    bufferOffset = _serializer.uint16(obj.static_pressure_3, buffer, bufferOffset);
    // Serialize message field [dynamic_pulse_1]
    bufferOffset = _serializer.uint16(obj.dynamic_pulse_1, buffer, bufferOffset);
    // Serialize message field [dynamic_pulse_2]
    bufferOffset = _serializer.uint16(obj.dynamic_pulse_2, buffer, bufferOffset);
    // Serialize message field [dynamic_pulse_3]
    bufferOffset = _serializer.uint16(obj.dynamic_pulse_3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type pulso_message
    let len;
    let data = new pulso_message(null);
    // Deserialize message field [ID]
    data.ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [static_pressure_1]
    data.static_pressure_1 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [static_pressure_2]
    data.static_pressure_2 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [static_pressure_3]
    data.static_pressure_3 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [dynamic_pulse_1]
    data.dynamic_pulse_1 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [dynamic_pulse_2]
    data.dynamic_pulse_2 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [dynamic_pulse_3]
    data.dynamic_pulse_3 = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/pulso_message';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '93fb5a6b0af4819896193f51aafdbf6d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    uint16 static_pressure_1
    uint16 static_pressure_2
    uint16 static_pressure_3
    uint16 dynamic_pulse_1
    uint16 dynamic_pulse_2
    uint16 dynamic_pulse_3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new pulso_message(null);
    if (msg.ID !== undefined) {
      resolved.ID = msg.ID;
    }
    else {
      resolved.ID = 0
    }

    if (msg.static_pressure_1 !== undefined) {
      resolved.static_pressure_1 = msg.static_pressure_1;
    }
    else {
      resolved.static_pressure_1 = 0
    }

    if (msg.static_pressure_2 !== undefined) {
      resolved.static_pressure_2 = msg.static_pressure_2;
    }
    else {
      resolved.static_pressure_2 = 0
    }

    if (msg.static_pressure_3 !== undefined) {
      resolved.static_pressure_3 = msg.static_pressure_3;
    }
    else {
      resolved.static_pressure_3 = 0
    }

    if (msg.dynamic_pulse_1 !== undefined) {
      resolved.dynamic_pulse_1 = msg.dynamic_pulse_1;
    }
    else {
      resolved.dynamic_pulse_1 = 0
    }

    if (msg.dynamic_pulse_2 !== undefined) {
      resolved.dynamic_pulse_2 = msg.dynamic_pulse_2;
    }
    else {
      resolved.dynamic_pulse_2 = 0
    }

    if (msg.dynamic_pulse_3 !== undefined) {
      resolved.dynamic_pulse_3 = msg.dynamic_pulse_3;
    }
    else {
      resolved.dynamic_pulse_3 = 0
    }

    return resolved;
    }
};

module.exports = pulso_message;
