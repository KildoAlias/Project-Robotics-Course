# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "crazyflie_gazebo: 8 messages, 11 services")

set(MSG_I_FLAGS "-Icrazyflie_gazebo:/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(crazyflie_gazebo_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv" ""
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv" ""
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv" ""
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv" ""
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv" ""
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv" ""
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg" ""
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg" "geometry_msgs/Twist:geometry_msgs/Vector3:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point"
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg" ""
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv" ""
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv" "crazyflie_gazebo/crtpPacket"
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg" ""
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv" "crazyflie_gazebo/TrajectoryPolynomialPiece"
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv" "crazyflie_gazebo/LogBlock"
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg" "geometry_msgs/Vector3:std_msgs/Header"
)

get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg" NAME_WE)
add_custom_target(_crazyflie_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crazyflie_gazebo" "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)

### Generating Services
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_cpp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
)

### Generating Module File
_generate_module_cpp(crazyflie_gazebo
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(crazyflie_gazebo_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(crazyflie_gazebo_generate_messages crazyflie_gazebo_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_cpp _crazyflie_gazebo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crazyflie_gazebo_gencpp)
add_dependencies(crazyflie_gazebo_gencpp crazyflie_gazebo_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crazyflie_gazebo_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)

### Generating Services
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_eus(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
)

### Generating Module File
_generate_module_eus(crazyflie_gazebo
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(crazyflie_gazebo_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(crazyflie_gazebo_generate_messages crazyflie_gazebo_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_eus _crazyflie_gazebo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crazyflie_gazebo_geneus)
add_dependencies(crazyflie_gazebo_geneus crazyflie_gazebo_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crazyflie_gazebo_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)

### Generating Services
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_lisp(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
)

### Generating Module File
_generate_module_lisp(crazyflie_gazebo
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(crazyflie_gazebo_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(crazyflie_gazebo_generate_messages crazyflie_gazebo_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_lisp _crazyflie_gazebo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crazyflie_gazebo_genlisp)
add_dependencies(crazyflie_gazebo_genlisp crazyflie_gazebo_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crazyflie_gazebo_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)

### Generating Services
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_nodejs(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
)

### Generating Module File
_generate_module_nodejs(crazyflie_gazebo
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(crazyflie_gazebo_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(crazyflie_gazebo_generate_messages crazyflie_gazebo_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_nodejs _crazyflie_gazebo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crazyflie_gazebo_gennodejs)
add_dependencies(crazyflie_gazebo_gennodejs crazyflie_gazebo_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crazyflie_gazebo_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_msg_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)

### Generating Services
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)
_generate_srv_py(crazyflie_gazebo
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv"
  "${MSG_I_FLAGS}"
  "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
)

### Generating Module File
_generate_module_py(crazyflie_gazebo
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(crazyflie_gazebo_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(crazyflie_gazebo_generate_messages crazyflie_gazebo_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg" NAME_WE)
add_dependencies(crazyflie_gazebo_generate_messages_py _crazyflie_gazebo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crazyflie_gazebo_genpy)
add_dependencies(crazyflie_gazebo_genpy crazyflie_gazebo_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crazyflie_gazebo_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crazyflie_gazebo
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(crazyflie_gazebo_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(crazyflie_gazebo_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crazyflie_gazebo
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(crazyflie_gazebo_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(crazyflie_gazebo_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crazyflie_gazebo
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(crazyflie_gazebo_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(crazyflie_gazebo_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crazyflie_gazebo
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(crazyflie_gazebo_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(crazyflie_gazebo_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crazyflie_gazebo
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(crazyflie_gazebo_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(crazyflie_gazebo_generate_messages_py geometry_msgs_generate_messages_py)
endif()
