// Auto-generated. Do not edit!

// (in-package serial_communication.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let hand_pressure = require('./hand_pressure.js');
let hand_egain = require('./hand_egain.js');
let hand_force = require('./hand_force.js');
let hand_imu = require('./hand_imu.js');

//-----------------------------------------------------------

class controler_message {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ID = null;
      this.time = null;
      this.Pressure_Data = null;
      this.EGaIn_Data = null;
      this.Force_Data = null;
      this.IMU_Data = null;
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
      if (initObj.hasOwnProperty('Pressure_Data')) {
        this.Pressure_Data = initObj.Pressure_Data
      }
      else {
        this.Pressure_Data = new hand_pressure();
      }
      if (initObj.hasOwnProperty('EGaIn_Data')) {
        this.EGaIn_Data = initObj.EGaIn_Data
      }
      else {
        this.EGaIn_Data = new hand_egain();
      }
      if (initObj.hasOwnProperty('Force_Data')) {
        this.Force_Data = initObj.Force_Data
      }
      else {
        this.Force_Data = new hand_force();
      }
      if (initObj.hasOwnProperty('IMU_Data')) {
        this.IMU_Data = initObj.IMU_Data
      }
      else {
        this.IMU_Data = new hand_imu();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type controler_message
    // Serialize message field [ID]
    bufferOffset = _serializer.uint8(obj.ID, buffer, bufferOffset);
    // Serialize message field [time]
    bufferOffset = _serializer.uint16(obj.time, buffer, bufferOffset);
    // Serialize message field [Pressure_Data]
    bufferOffset = hand_pressure.serialize(obj.Pressure_Data, buffer, bufferOffset);
    // Serialize message field [EGaIn_Data]
    bufferOffset = hand_egain.serialize(obj.EGaIn_Data, buffer, bufferOffset);
    // Serialize message field [Force_Data]
    bufferOffset = hand_force.serialize(obj.Force_Data, buffer, bufferOffset);
    // Serialize message field [IMU_Data]
    bufferOffset = hand_imu.serialize(obj.IMU_Data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type controler_message
    let len;
    let data = new controler_message(null);
    // Deserialize message field [ID]
    data.ID = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [time]
    data.time = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [Pressure_Data]
    data.Pressure_Data = hand_pressure.deserialize(buffer, bufferOffset);
    // Deserialize message field [EGaIn_Data]
    data.EGaIn_Data = hand_egain.deserialize(buffer, bufferOffset);
    // Deserialize message field [Force_Data]
    data.Force_Data = hand_force.deserialize(buffer, bufferOffset);
    // Deserialize message field [IMU_Data]
    data.IMU_Data = hand_imu.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 742;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/controler_message';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '01633c681b9e513b3493801e5ce828b9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 ID
    uint16 time
    hand_pressure Pressure_Data
    hand_egain EGaIn_Data
    hand_force Force_Data
    hand_imu IMU_Data
    ================================================================================
    MSG: serial_communication/hand_pressure
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
    
    ================================================================================
    MSG: serial_communication/hand_egain
    finger_egain THUMB0
    finger_egain THUMB1
    finger_egain INDEX
    finger_egain MIDDLE
    finger_egain RING
    finger_egain LITTLE
    
    ================================================================================
    MSG: serial_communication/finger_egain
    float32 DIP
    float32 PIP
    float32 MCPL
    float32 MCPR
    
    ================================================================================
    MSG: serial_communication/hand_force
    finger_force THUMB0
    finger_force THUMB1
    finger_force INDEX
    finger_force MIDDLE
    finger_force RING
    finger_force LITTLE
    
    ================================================================================
    MSG: serial_communication/finger_force
    float32 FORCE1
    float32 FORCE2
    float32 FORCE3
    float32 FORCE4
    
    ================================================================================
    MSG: serial_communication/hand_imu
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
    const resolved = new controler_message(null);
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

    if (msg.Pressure_Data !== undefined) {
      resolved.Pressure_Data = hand_pressure.Resolve(msg.Pressure_Data)
    }
    else {
      resolved.Pressure_Data = new hand_pressure()
    }

    if (msg.EGaIn_Data !== undefined) {
      resolved.EGaIn_Data = hand_egain.Resolve(msg.EGaIn_Data)
    }
    else {
      resolved.EGaIn_Data = new hand_egain()
    }

    if (msg.Force_Data !== undefined) {
      resolved.Force_Data = hand_force.Resolve(msg.Force_Data)
    }
    else {
      resolved.Force_Data = new hand_force()
    }

    if (msg.IMU_Data !== undefined) {
      resolved.IMU_Data = hand_imu.Resolve(msg.IMU_Data)
    }
    else {
      resolved.IMU_Data = new hand_imu()
    }

    return resolved;
    }
};

module.exports = controler_message;
