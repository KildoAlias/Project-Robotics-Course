# Install script for directory: /home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/robot/dd2419_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/dd2419_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/dd2419_ws/install" TYPE PROGRAM FILES "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/dd2419_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/dd2419_ws/install" TYPE PROGRAM FILES "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/dd2419_ws/install/setup.bash;/home/robot/dd2419_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/dd2419_ws/install" TYPE FILE FILES
    "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/setup.bash"
    "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/dd2419_ws/install/setup.sh;/home/robot/dd2419_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/dd2419_ws/install" TYPE FILE FILES
    "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/setup.sh"
    "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/dd2419_ws/install/setup.zsh;/home/robot/dd2419_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/dd2419_ws/install" TYPE FILE FILES
    "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/setup.zsh"
    "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/robot/dd2419_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/robot/dd2419_ws/install" TYPE FILE FILES "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/.rosinstall")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crazyflie_gazebo/srv" TYPE FILE FILES
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/AddCrazyflie.srv"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/GoTo.srv"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Land.srv"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/RemoveCrazyflie.srv"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/SetGroupMask.srv"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/StartTrajectory.srv"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Stop.srv"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/Takeoff.srv"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UpdateParams.srv"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/UploadTrajectory.srv"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/srv/sendPacket.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crazyflie_gazebo/msg" TYPE FILE FILES
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/LogBlock.msg"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/GenericLogData.msg"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/FullState.msg"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/TrajectoryPolynomialPiece.msg"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/crtpPacket.msg"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Hover.msg"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/Position.msg"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/msg/WindSpeed.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crazyflie_gazebo/cmake" TYPE FILE FILES "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/crazyflie_gazebo-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/include/crazyflie_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/share/roseus/ros/crazyflie_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/share/common-lisp/ros/crazyflie_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/share/gennodejs/ros/crazyflie_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/python2.7/dist-packages/crazyflie_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/python2.7/dist-packages/crazyflie_gazebo")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/crazyflie_gazebo.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crazyflie_gazebo/cmake" TYPE FILE FILES "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/crazyflie_gazebo-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crazyflie_gazebo/cmake" TYPE FILE FILES
    "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/crazyflie_gazeboConfig.cmake"
    "/home/robot/dd2419_ws/build/crazyflie_gazebo/catkin_generated/installspace/crazyflie_gazeboConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crazyflie_gazebo" TYPE FILE FILES "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_ros_interface_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_ros_interface_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_ros_interface_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/librotors_gazebo_ros_interface_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_ros_interface_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_ros_interface_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_ros_interface_plugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_ros_interface_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_odometry_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_odometry_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_odometry_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/librotors_gazebo_odometry_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_odometry_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_odometry_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_odometry_plugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_odometry_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_controller_interface.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_controller_interface.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_controller_interface.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/librotors_gazebo_controller_interface.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_controller_interface.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_controller_interface.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_controller_interface.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_controller_interface.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_motor_model.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_motor_model.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_motor_model.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/librotors_gazebo_motor_model.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_motor_model.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_motor_model.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_motor_model.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_motor_model.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_multirotor_base_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_multirotor_base_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_multirotor_base_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/librotors_gazebo_multirotor_base_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_multirotor_base_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_multirotor_base_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_multirotor_base_plugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_multirotor_base_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_imu_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_imu_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_imu_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/librotors_gazebo_imu_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_imu_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_imu_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_imu_plugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_imu_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_pressure_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_pressure_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_pressure_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/librotors_gazebo_pressure_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_pressure_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_pressure_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_pressure_plugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_pressure_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_magnetometer_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_magnetometer_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_magnetometer_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/librotors_gazebo_magnetometer_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_magnetometer_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_magnetometer_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_magnetometer_plugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_magnetometer_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_lps_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_lps_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_lps_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/librotors_gazebo_lps_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_lps_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_lps_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_lps_plugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_lps_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_wind_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_wind_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_wind_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/librotors_gazebo_wind_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_wind_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_wind_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_wind_plugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/librotors_gazebo_wind_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_sonar_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_sonar_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_sonar_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/libgazebo_sonar_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_sonar_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_sonar_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_sonar_plugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_sonar_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_gps_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_gps_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_gps_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/libgazebo_gps_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_gps_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_gps_plugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_gps_plugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libgazebo_gps_plugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libLiftDragPlugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libLiftDragPlugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libLiftDragPlugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/libLiftDragPlugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libLiftDragPlugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libLiftDragPlugin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libLiftDragPlugin.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libLiftDragPlugin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libmav_msgs.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libmav_msgs.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libmav_msgs.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins" TYPE SHARED_LIBRARY FILES "/home/robot/dd2419_ws/devel/.private/crazyflie_gazebo/lib/libmav_msgs.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libmav_msgs.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libmav_msgs.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libmav_msgs.so"
         OLD_RPATH "/usr/lib/x86_64-linux-gnu/gazebo-9/plugins:/home/robot/dd2419_ws/build/crazyflie_gazebo:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/crazyflie_gazebo/plugins/libmav_msgs.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crazyflie_gazebo/models" TYPE DIRECTORY FILES
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/Box"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/BoxesLargeOnPallet"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/BoxesLargeOnPallet_2"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/BoxesLargeOnPallet_3"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/anchor_stand"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/asphalt_plane"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/big_box"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/big_box2"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/big_box3"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/big_box4"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/cfHandler"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/crazyflie"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/crazyflie_ghost"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/crazyflie_ghost1"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/crazyflie_ghost2"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/europallet"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/flow_cam"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/grass_plane"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/ground_plane_residential"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/hemicyl"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/iris"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/lidar"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/matrice_100"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/mur1"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/mur2"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/occupancy_grid"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/pallet_full"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/plane"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/rotors_description"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/shelves_high"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/shelves_high2"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/shelves_high2_no_collision"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/small_box"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/solo"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/sonar"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/standard_vtol"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/sun"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/uneven_ground"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/vrc_heightmap_1"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/models/yosemite"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crazyflie_gazebo/worlds" TYPE FILE FILES
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/basic.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/crazyflie.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/empty.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/house.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/iris.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/outdoor.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/powerplant.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/real_salle_lix.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/rubble.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/salle_lix.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/test_city.world"
    "/home/robot/dd2419_ws/src/course_packages/sim_cf/crazyflie_gazebo/worlds/warehouse.world"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crazyflie_gazebo" TYPE FILE FILES "/home/robot/dd2419_ws/build/crazyflie_gazebo/setup.sh")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/robot/dd2419_ws/build/crazyflie_gazebo/external/crazyflie_comm/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/robot/dd2419_ws/build/crazyflie_gazebo/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
