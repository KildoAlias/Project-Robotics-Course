;; Auto-generated. Do not edit!


(when (boundp 'crazyflie_gazebo::WindSpeed)
  (if (not (find-package "CRAZYFLIE_GAZEBO"))
    (make-package "CRAZYFLIE_GAZEBO"))
  (shadow 'WindSpeed (find-package "CRAZYFLIE_GAZEBO")))
(unless (find-package "CRAZYFLIE_GAZEBO::WINDSPEED")
  (make-package "CRAZYFLIE_GAZEBO::WINDSPEED"))

(in-package "ROS")
;;//! \htmlinclude WindSpeed.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass crazyflie_gazebo::WindSpeed
  :super ros::object
  :slots (_header _velocity ))

(defmethod crazyflie_gazebo::WindSpeed
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:velocity __velocity) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _velocity __velocity)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _velocity
    (send _velocity :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _velocity
       (send _velocity :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;;
   self)
  )

(setf (get crazyflie_gazebo::WindSpeed :md5sum-) "ae00d2a331b8545eaf96c531128ff0ef")
(setf (get crazyflie_gazebo::WindSpeed :datatype-) "crazyflie_gazebo/WindSpeed")
(setf (get crazyflie_gazebo::WindSpeed :definition-)
      "Header header

# Message should be expressed in the frame_id specified in the header.

geometry_msgs/Vector3 velocity      # [m/s]


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :crazyflie_gazebo/WindSpeed "ae00d2a331b8545eaf96c531128ff0ef")


