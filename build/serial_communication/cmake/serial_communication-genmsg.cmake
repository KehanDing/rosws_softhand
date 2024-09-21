# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "serial_communication: 15 messages, 0 services")

set(MSG_I_FLAGS "-Iserial_communication:/home/zhenruichen/rosws_softhand/src/serial_communication/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(serial_communication_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg" ""
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg" ""
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg" ""
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg" ""
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg" "serial_communication/imu_data"
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg" "serial_communication/finger_pressure"
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg" "serial_communication/finger_egain"
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg" "serial_communication/finger_force"
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg" "serial_communication/finger_imu:serial_communication/imu_data"
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg" "serial_communication/hand_pressure:serial_communication/finger_force:serial_communication/hand_imu:serial_communication/finger_pressure:serial_communication/imu_data:serial_communication/finger_egain:serial_communication/hand_egain:serial_communication/finger_imu:serial_communication/hand_force"
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg" ""
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg" ""
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg" ""
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg" "geometry_msgs/Vector3:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg" NAME_WE)
add_custom_target(_serial_communication_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "serial_communication" "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg" "geometry_msgs/Quaternion:geometry_msgs/Vector3:serial_communication/fingerpose"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)
_generate_msg_cpp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
)

### Generating Services

### Generating Module File
_generate_module_cpp(serial_communication
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(serial_communication_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(serial_communication_generate_messages serial_communication_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_cpp _serial_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(serial_communication_gencpp)
add_dependencies(serial_communication_gencpp serial_communication_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS serial_communication_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)
_generate_msg_eus(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
)

### Generating Services

### Generating Module File
_generate_module_eus(serial_communication
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(serial_communication_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(serial_communication_generate_messages serial_communication_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_eus _serial_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(serial_communication_geneus)
add_dependencies(serial_communication_geneus serial_communication_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS serial_communication_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)
_generate_msg_lisp(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
)

### Generating Services

### Generating Module File
_generate_module_lisp(serial_communication
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(serial_communication_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(serial_communication_generate_messages serial_communication_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_lisp _serial_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(serial_communication_genlisp)
add_dependencies(serial_communication_genlisp serial_communication_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS serial_communication_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)
_generate_msg_nodejs(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
)

### Generating Services

### Generating Module File
_generate_module_nodejs(serial_communication
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(serial_communication_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(serial_communication_generate_messages serial_communication_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_nodejs _serial_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(serial_communication_gennodejs)
add_dependencies(serial_communication_gennodejs serial_communication_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS serial_communication_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg"
  "${MSG_I_FLAGS}"
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)
_generate_msg_py(serial_communication
  "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
)

### Generating Services

### Generating Module File
_generate_module_py(serial_communication
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(serial_communication_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(serial_communication_generate_messages serial_communication_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/imu_data.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_pressure.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_egain.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_force.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/finger_imu.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_pressure.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_egain.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_force.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/hand_imu.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/controler_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/pulso_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/lzq.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/smc_message.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/fingerpose.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/serial_communication/msg/handpose.msg" NAME_WE)
add_dependencies(serial_communication_generate_messages_py _serial_communication_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(serial_communication_genpy)
add_dependencies(serial_communication_genpy serial_communication_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS serial_communication_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/serial_communication
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(serial_communication_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(serial_communication_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/serial_communication
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(serial_communication_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(serial_communication_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/serial_communication
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(serial_communication_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(serial_communication_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/serial_communication
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(serial_communication_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(serial_communication_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication)
  install(CODE "execute_process(COMMAND \"/home/zhenruichen/anaconda3/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/serial_communication
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(serial_communication_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(serial_communication_generate_messages_py geometry_msgs_generate_messages_py)
endif()
