# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "obtain_angle: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iobtain_angle:/home/zhenruichen/rosws_softhand/src/obtain_angle/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(obtain_angle_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg" NAME_WE)
add_custom_target(_obtain_angle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "obtain_angle" "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg" "geometry_msgs/Vector3:geometry_msgs/Quaternion"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(obtain_angle
  "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obtain_angle
)

### Generating Services

### Generating Module File
_generate_module_cpp(obtain_angle
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obtain_angle
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(obtain_angle_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(obtain_angle_generate_messages obtain_angle_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg" NAME_WE)
add_dependencies(obtain_angle_generate_messages_cpp _obtain_angle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obtain_angle_gencpp)
add_dependencies(obtain_angle_gencpp obtain_angle_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obtain_angle_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(obtain_angle
  "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obtain_angle
)

### Generating Services

### Generating Module File
_generate_module_eus(obtain_angle
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obtain_angle
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(obtain_angle_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(obtain_angle_generate_messages obtain_angle_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg" NAME_WE)
add_dependencies(obtain_angle_generate_messages_eus _obtain_angle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obtain_angle_geneus)
add_dependencies(obtain_angle_geneus obtain_angle_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obtain_angle_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(obtain_angle
  "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obtain_angle
)

### Generating Services

### Generating Module File
_generate_module_lisp(obtain_angle
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obtain_angle
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(obtain_angle_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(obtain_angle_generate_messages obtain_angle_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg" NAME_WE)
add_dependencies(obtain_angle_generate_messages_lisp _obtain_angle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obtain_angle_genlisp)
add_dependencies(obtain_angle_genlisp obtain_angle_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obtain_angle_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(obtain_angle
  "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obtain_angle
)

### Generating Services

### Generating Module File
_generate_module_nodejs(obtain_angle
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obtain_angle
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(obtain_angle_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(obtain_angle_generate_messages obtain_angle_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg" NAME_WE)
add_dependencies(obtain_angle_generate_messages_nodejs _obtain_angle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obtain_angle_gennodejs)
add_dependencies(obtain_angle_gennodejs obtain_angle_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obtain_angle_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(obtain_angle
  "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obtain_angle
)

### Generating Services

### Generating Module File
_generate_module_py(obtain_angle
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obtain_angle
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(obtain_angle_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(obtain_angle_generate_messages obtain_angle_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/obtain_angle/msg/fingerpose.msg" NAME_WE)
add_dependencies(obtain_angle_generate_messages_py _obtain_angle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obtain_angle_genpy)
add_dependencies(obtain_angle_genpy obtain_angle_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obtain_angle_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obtain_angle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obtain_angle
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(obtain_angle_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(obtain_angle_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obtain_angle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obtain_angle
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(obtain_angle_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(obtain_angle_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obtain_angle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obtain_angle
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(obtain_angle_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(obtain_angle_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obtain_angle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obtain_angle
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(obtain_angle_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(obtain_angle_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obtain_angle)
  install(CODE "execute_process(COMMAND \"/home/zhenruichen/anaconda3/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obtain_angle\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obtain_angle
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(obtain_angle_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(obtain_angle_generate_messages_py geometry_msgs_generate_messages_py)
endif()
