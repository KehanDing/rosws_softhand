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

class lzq {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.num = null;
      this.thumb = null;
      this.index = null;
      this.middle = null;
      this.ring = null;
      this.little = null;
    }
    else {
      if (initObj.hasOwnProperty('num')) {
        this.num = initObj.num
      }
      else {
        this.num = 0;
      }
      if (initObj.hasOwnProperty('thumb')) {
        this.thumb = initObj.thumb
      }
      else {
        this.thumb = 0.0;
      }
      if (initObj.hasOwnProperty('index')) {
        this.index = initObj.index
      }
      else {
        this.index = 0.0;
      }
      if (initObj.hasOwnProperty('middle')) {
        this.middle = initObj.middle
      }
      else {
        this.middle = 0.0;
      }
      if (initObj.hasOwnProperty('ring')) {
        this.ring = initObj.ring
      }
      else {
        this.ring = 0.0;
      }
      if (initObj.hasOwnProperty('little')) {
        this.little = initObj.little
      }
      else {
        this.little = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type lzq
    // Serialize message field [num]
    bufferOffset = _serializer.uint32(obj.num, buffer, bufferOffset);
    // Serialize message field [thumb]
    bufferOffset = _serializer.float32(obj.thumb, buffer, bufferOffset);
    // Serialize message field [index]
    bufferOffset = _serializer.float32(obj.index, buffer, bufferOffset);
    // Serialize message field [middle]
    bufferOffset = _serializer.float32(obj.middle, buffer, bufferOffset);
    // Serialize message field [ring]
    bufferOffset = _serializer.float32(obj.ring, buffer, bufferOffset);
    // Serialize message field [little]
    bufferOffset = _serializer.float32(obj.little, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type lzq
    let len;
    let data = new lzq(null);
    // Deserialize message field [num]
    data.num = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [thumb]
    data.thumb = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [index]
    data.index = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [middle]
    data.middle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [ring]
    data.ring = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [little]
    data.little = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_communication/lzq';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'da64289d8beb7c3bfcf74e7727a35840';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 num
    float32  thumb
    float32  index
    float32  middle
    float32  ring
    float32  little
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new lzq(null);
    if (msg.num !== undefined) {
      resolved.num = msg.num;
    }
    else {
      resolved.num = 0
    }

    if (msg.thumb !== undefined) {
      resolved.thumb = msg.thumb;
    }
    else {
      resolved.thumb = 0.0
    }

    if (msg.index !== undefined) {
      resolved.index = msg.index;
    }
    else {
      resolved.index = 0.0
    }

    if (msg.middle !== undefined) {
      resolved.middle = msg.middle;
    }
    else {
      resolved.middle = 0.0
    }

    if (msg.ring !== undefined) {
      resolved.ring = msg.ring;
    }
    else {
      resolved.ring = 0.0
    }

    if (msg.little !== undefined) {
      resolved.little = msg.little;
    }
    else {
      resolved.little = 0.0
    }

    return resolved;
    }
};

module.exports = lzq;
