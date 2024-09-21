# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "nano_17_ethercat: 1 messages, 0 services")

set(MSG_I_FLAGS "-Inano_17_ethercat:/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(nano_17_ethercat_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg" NAME_WE)
add_custom_target(_nano_17_ethercat_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "nano_17_ethercat" "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(nano_17_ethercat
  "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nano_17_ethercat
)

### Generating Services

### Generating Module File
_generate_module_cpp(nano_17_ethercat
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nano_17_ethercat
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(nano_17_ethercat_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(nano_17_ethercat_generate_messages nano_17_ethercat_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg" NAME_WE)
add_dependencies(nano_17_ethercat_generate_messages_cpp _nano_17_ethercat_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nano_17_ethercat_gencpp)
add_dependencies(nano_17_ethercat_gencpp nano_17_ethercat_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nano_17_ethercat_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(nano_17_ethercat
  "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nano_17_ethercat
)

### Generating Services

### Generating Module File
_generate_module_eus(nano_17_ethercat
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nano_17_ethercat
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(nano_17_ethercat_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(nano_17_ethercat_generate_messages nano_17_ethercat_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg" NAME_WE)
add_dependencies(nano_17_ethercat_generate_messages_eus _nano_17_ethercat_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nano_17_ethercat_geneus)
add_dependencies(nano_17_ethercat_geneus nano_17_ethercat_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nano_17_ethercat_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(nano_17_ethercat
  "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nano_17_ethercat
)

### Generating Services

### Generating Module File
_generate_module_lisp(nano_17_ethercat
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nano_17_ethercat
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(nano_17_ethercat_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(nano_17_ethercat_generate_messages nano_17_ethercat_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg" NAME_WE)
add_dependencies(nano_17_ethercat_generate_messages_lisp _nano_17_ethercat_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nano_17_ethercat_genlisp)
add_dependencies(nano_17_ethercat_genlisp nano_17_ethercat_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nano_17_ethercat_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(nano_17_ethercat
  "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nano_17_ethercat
)

### Generating Services

### Generating Module File
_generate_module_nodejs(nano_17_ethercat
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nano_17_ethercat
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(nano_17_ethercat_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(nano_17_ethercat_generate_messages nano_17_ethercat_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg" NAME_WE)
add_dependencies(nano_17_ethercat_generate_messages_nodejs _nano_17_ethercat_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nano_17_ethercat_gennodejs)
add_dependencies(nano_17_ethercat_gennodejs nano_17_ethercat_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nano_17_ethercat_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(nano_17_ethercat
  "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nano_17_ethercat
)

### Generating Services

### Generating Module File
_generate_module_py(nano_17_ethercat
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nano_17_ethercat
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(nano_17_ethercat_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(nano_17_ethercat_generate_messages nano_17_ethercat_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhenruichen/rosws_softhand/src/nano_17_ethercat/msg/FT_nano17.msg" NAME_WE)
add_dependencies(nano_17_ethercat_generate_messages_py _nano_17_ethercat_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(nano_17_ethercat_genpy)
add_dependencies(nano_17_ethercat_genpy nano_17_ethercat_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS nano_17_ethercat_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nano_17_ethercat)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/nano_17_ethercat
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(nano_17_ethercat_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nano_17_ethercat)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/nano_17_ethercat
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(nano_17_ethercat_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nano_17_ethercat)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/nano_17_ethercat
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(nano_17_ethercat_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nano_17_ethercat)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/nano_17_ethercat
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(nano_17_ethercat_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nano_17_ethercat)
  install(CODE "execute_process(COMMAND \"/home/zhenruichen/anaconda3/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nano_17_ethercat\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/nano_17_ethercat
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(nano_17_ethercat_generate_messages_py std_msgs_generate_messages_py)
endif()
