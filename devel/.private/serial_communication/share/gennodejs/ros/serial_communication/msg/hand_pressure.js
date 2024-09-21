// Auto-generated. Do not edit!

// (in-package serial_communication.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let finger_pressure = require('./finger_pressure.js');

//-----------------------------------------------------------

class hand_pressure {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.THUMB0 = null;
      this.THUMB1 = null;
      this.INDEX = null;
      this.MIDDLE = null;
      this.RING = null;
      this.LITTLE = null;
    }
    else {
      if (initObj.hasOwnProperty('THUMB0')) {
        this.THUMB0 = initObj.THUMB0
      }
      else {
        this.THUMB0 = new finger_pressure();
      }
      if (initObj.hasOwnProperty('THUMB1')) {
        this.THUMB1 = initObj.THUMB1
      }
      else {
        this.THUMB1 = new finger_pressure();
      }
      if (initObj.hasOwnProperty('INDEX')) {
        this.INDEX = initObj.INDEX
      }
      else {
        this.INDEX = new finger_pressure();
      }
      if (initObj.hasOwnProperty('MIDDLE')) {
        this.MIDDLE = initObj.MIDDLE
      }
      else {
        this.MIDDLE = new finger_pressure();
      }
      if (initObj.hasOwnProperty('RING')) {
        this.RING = initObj.RING
      }
      else {
        this.RING = new finger_pressure();
      }
      if (initObj.hasOwnProperty('LITTLE')) {
        this.LITTLE = initObj.LITTLE
      }
      else {
        this.LITTLE = new finger_pressure();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type hand_pressure
    // Serialize message field [THUMB0]
    bufferOffset = finger_pressure.serialize(obj.THUMB0, buffer, bufferOffset);
    // Serialize message field [THUMB1]
    bufferOffset = finger_pressure.serialize(obj.THUMB1, buffer, bufferOffset);
    // Serialize message field [INDEX]
    bufferOffset = finger_pressure.serialize(obj.INDEX, buffer, bufferOffset);
    // Serialize message field [MIDDLE]
    bufferOffset = finger_pressure.serialize(obj.MIDDLE, buffer, bufferOffset);
    // Serialize message field [RING]
    bufferOffset = finger_pressure.serialize(obj.RING, buffer, bufferOffset);
    // Serialize message field [LITTLE]
    bufferOffset = finger_pressure.serialize(obj.LITTLE, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type hand_pressure
    let len;
    let data = new hand_pressure(null);
    // Deserialize message field [THUMB0]
    data.THUMB0 = finger_pressure.deserialize(buffer, bufferOffset);
    // Deserialize message field [THUMB1]
    data.THUMB1 = finger_pressure.deserialize(buffer, bufferOffset);
    // Deserialize message field [INDEX]
    data.INDEX = finger_pressure.deserialize(buffer, bufferOffset);
    // Deserialize message field [MIDDLE]
    data.MIDDLE = finger_pressure.deserialize(buffer, bufferOffset);
    // Deserialize message field [RING]
    data.RING = finger_pressure.deserialize(buffer, bufferOffset);
    // Deserialize message field [LITTLE]
    data.LITTLE = finger_pressure.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 96;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/hand_pressure';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a99f6e26a2b17742b15161bbca8bdbd8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    finger_pressure THUMB0
    finger_pressure THUMB1
    finger_pressure INDEX
    finger_pressure MIDDLE
    finger_pressure RING
    finger_pressure LITTLE
    
    ================================================================================
    MSG: serial_communication/finger_pressure
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
    const resolved = new hand_pressure(null);
    if (msg.THUMB0 !== undefined) {
      resolved.THUMB0 = finger_pressure.Resolve(msg.THUMB0)
    }
    else {
      resolved.THUMB0 = new finger_pressure()
    }

    if (msg.THUMB1 !== undefined) {
      resolved.THUMB1 = finger_pressure.Resolve(msg.THUMB1)
    }
    else {
      resolved.THUMB1 = new finger_pressure()
    }

    if (msg.INDEX !== undefined) {
      resolved.INDEX = finger_pressure.Resolve(msg.INDEX)
    }
    else {
      resolved.INDEX = new finger_pressure()
    }

    if (msg.MIDDLE !== undefined) {
      resolved.MIDDLE = finger_pressure.Resolve(msg.MIDDLE)
    }
    else {
      resolved.MIDDLE = new finger_pressure()
    }

    if (msg.RING !== undefined) {
      resolved.RING = finger_pressure.Resolve(msg.RING)
    }
    else {
      resolved.RING = new finger_pressure()
    }

    if (msg.LITTLE !== undefined) {
      resolved.LITTLE = finger_pressure.Resolve(msg.LITTLE)
    }
    else {
      resolved.LITTLE = new finger_pressure()
    }

    return resolved;
    }
};

module.exports = hand_pressure;
