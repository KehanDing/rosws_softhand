// Auto-generated. Do not edit!

// (in-package serial_communication.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let finger_imu = require('./finger_imu.js');
let imu_data = require('./imu_data.js');

//-----------------------------------------------------------

class hand_imu {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ID = null;
      this.time = null;
      this.THUMB = null;
      this.INDEX = null;
      this.MIDDLE = null;
      this.RING = null;
      this.LITTLE = null;
      this.PALM = null;
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
      if (initObj.hasOwnProperty('THUMB')) {
        this.THUMB = initObj.THUMB
      }
      else {
        this.THUMB = new finger_imu();
      }
      if (initObj.hasOwnProperty('INDEX')) {
        this.INDEX = initObj.INDEX
      }
      else {
        this.INDEX = new finger_imu();
      }
      if (initObj.hasOwnProperty('MIDDLE')) {
        this.MIDDLE = initObj.MIDDLE
      }
      else {
        this.MIDDLE = new finger_imu();
      }
      if (initObj.hasOwnProperty('RING')) {
        this.RING = initObj.RING
      }
      else {
        this.RING = new finger_imu();
      }
      if (initObj.hasOwnProperty('LITTLE')) {
        this.LITTLE = initObj.LITTLE
      }
      else {
        this.LITTLE = new finger_imu();
      }
      if (initObj.hasOwnProperty('PALM')) {
        this.PALM = initObj.PALM
      }
      else {
        this.PALM = new imu_data();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type hand_imu
    // Serialize message field [ID]
    bufferOffset = _serializer.uint8(obj.ID, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.uint16(obj.time, buffer, bufferOffset);
    // Serialize message field [THUMB]
    bufferOffset = finger_imu.serialize(obj.THUMB, buffer, bufferOffset);
    // Serialize message field [INDEX]
    bufferOffset = finger_imu.serialize(obj.INDEX, buffer, bufferOffset);
    // Serialize message field [MIDDLE]
    bufferOffset = finger_imu.serialize(obj.MIDDLE, buffer, bufferOffset);
    // Serialize message field [RING]
    bufferOffset = finger_imu.serialize(obj.RING, buffer, bufferOffset);
    // Serialize message field [LITTLE]
    bufferOffset = finger_imu.serialize(obj.LITTLE, buffer, bufferOffset);
    // Serialize message field [PALM]
    bufferOffset = imu_data.serialize(obj.PALM, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type hand_imu
    let len;
    let data = new hand_imu(null);
    // Deserialize message field [ID]
    data.ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [THUMB]
    data.THUMB = finger_imu.deserialize(buffer, bufferOffset);
    // Deserialize message field [INDEX]
    data.INDEX = finger_imu.deserialize(buffer, bufferOffset);
    // Deserialize message field [MIDDLE]
    data.MIDDLE = finger_imu.deserialize(buffer, bufferOffset);
    // Deserialize message field [RING]
    data.RING = finger_imu.deserialize(buffer, bufferOffset);
    // Deserialize message field [LITTLE]
    data.LITTLE = finger_imu.deserialize(buffer, bufferOffset);
    // Deserialize message field [PALM]
    data.PALM = imu_data.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 451;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/hand_imu';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ea982f9506f64da059eb7d3969f058f4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    uint16 time
    finger_imu THUMB
    finger_imu INDEX
    finger_imu MIDDLE
    finger_imu RING
    finger_imu LITTLE
    imu_data PALM
    ================================================================================
    MSG: serial_communication/finger_imu
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
    const resolved = new hand_imu(null);
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

    if (msg.THUMB !== undefined) {
      resolved.THUMB = finger_imu.Resolve(msg.THUMB)
    }
    else {
      resolved.THUMB = new finger_imu()
    }

    if (msg.INDEX !== undefined) {
      resolved.INDEX = finger_imu.Resolve(msg.INDEX)
    }
    else {
      resolved.INDEX = new finger_imu()
    }

    if (msg.MIDDLE !== undefined) {
      resolved.MIDDLE = finger_imu.Resolve(msg.MIDDLE)
    }
    else {
      resolved.MIDDLE = new finger_imu()
    }

    if (msg.RING !== undefined) {
      resolved.RING = finger_imu.Resolve(msg.RING)
    }
    else {
      resolved.RING = new finger_imu()
    }

    if (msg.LITTLE !== undefined) {
      resolved.LITTLE = finger_imu.Resolve(msg.LITTLE)
    }
    else {
      resolved.LITTLE = new finger_imu()
    }

    if (msg.PALM !== undefined) {
      resolved.PALM = imu_data.Resolve(msg.PALM)
    }
    else {
      resolved.PALM = new imu_data()
    }

    return resolved;
    }
};

module.exports = hand_imu;
