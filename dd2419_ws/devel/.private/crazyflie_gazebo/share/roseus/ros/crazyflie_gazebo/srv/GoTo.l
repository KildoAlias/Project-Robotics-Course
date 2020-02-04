;; Auto-generated. Do not edit!


(when (boundp 'crazyflie_gazebo::GoTo)
  (if (not (find-package "CRAZYFLIE_GAZEBO"))
    (make-package "CRAZYFLIE_GAZEBO"))
  (shadow 'GoTo (find-package "CRAZYFLIE_GAZEBO")))
(unless (find-package "CRAZYFLIE_GAZEBO::GOTO")
  (make-package "CRAZYFLIE_GAZEBO::GOTO"))
(unless (find-package "CRAZYFLIE_GAZEBO::GOTOREQUEST")
  (make-package "CRAZYFLIE_GAZEBO::GOTOREQUEST"))
(unless (find-package "CRAZYFLIE_GAZEBO::GOTORESPONSE")
  (make-package "CRAZYFLIE_GAZEBO::GOTORESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass crazyflie_gazebo::GoToRequest
  :super ros::object
  :slots (_groupMask _relative _goal _yaw _duration ))

(defmethod crazyflie_gazebo::GoToRequest
  (:init
   (&key
    ((:groupMask __groupMask) 0)
    ((:relative __relative) nil)
    ((:goal __goal) (instance geometry_msgs::Point :init))
    ((:yaw __yaw) 0.0)
    ((:duration __duration) (instance ros::time :init))
    )
   (send-super :init)
   (setq _groupMask (round __groupMask))
   (setq _relative __relative)
   (setq _goal __goal)
   (setq _yaw (float __yaw))
   (setq _duration __duration)
   self)
  (:groupMask
   (&optional __groupMask)
   (if __groupMask (setq _groupMask __groupMask)) _groupMask)
  (:relative
   (&optional __relative)
   (if __relative (setq _relative __relative)) _relative)
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:serialization-length
   ()
   (+
    ;; uint8 _groupMask
    1
    ;; bool _relative
    1
    ;; geometry_msgs/Point _goal
    (send _goal :serialization-length)
    ;; float32 _yaw
    4
    ;; duration _duration
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _groupMask
       (write-byte _groupMask s)
     ;; bool _relative
       (if _relative (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Point _goal
       (send _goal :serialize s)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; duration _duration
       (write-long (send _duration :sec) s) (write-long (send _duration :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _groupMask
     (setq _groupMask (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _relative
     (setq _relative (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Point _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; duration _duration
     (send _duration :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _duration :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass crazyflie_gazebo::GoToResponse
  :super ros::object
  :slots ())

(defmethod crazyflie_gazebo::GoToResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass crazyflie_gazebo::GoTo
  :super ros::object
  :slots ())

(setf (get crazyflie_gazebo::GoTo :md5sum-) "82856b48a972d6af023d961a655bcf75")
(setf (get crazyflie_gazebo::GoTo :datatype-) "crazyflie_gazebo/GoTo")
(setf (get crazyflie_gazebo::GoTo :request) crazyflie_gazebo::GoToRequest)
(setf (get crazyflie_gazebo::GoTo :response) crazyflie_gazebo::GoToResponse)

(defmethod crazyflie_gazebo::GoToRequest
  (:response () (instance crazyflie_gazebo::GoToResponse :init)))

(setf (get crazyflie_gazebo::GoToRequest :md5sum-) "82856b48a972d6af023d961a655bcf75")
(setf (get crazyflie_gazebo::GoToRequest :datatype-) "crazyflie_gazebo/GoToRequest")
(setf (get crazyflie_gazebo::GoToRequest :definition-)
      "uint8 groupMask
bool relative
geometry_msgs/Point goal
float32 yaw
duration duration

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")

(setf (get crazyflie_gazebo::GoToResponse :md5sum-) "82856b48a972d6af023d961a655bcf75")
(setf (get crazyflie_gazebo::GoToResponse :datatype-) "crazyflie_gazebo/GoToResponse")
(setf (get crazyflie_gazebo::GoToResponse :definition-)
      "uint8 groupMask
bool relative
geometry_msgs/Point goal
float32 yaw
duration duration

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---

")



(provide :crazyflie_gazebo/GoTo "82856b48a972d6af023d961a655bcf75")


