;; Auto-generated. Do not edit!


(when (boundp 'crazyflie_gazebo::Stop)
  (if (not (find-package "CRAZYFLIE_GAZEBO"))
    (make-package "CRAZYFLIE_GAZEBO"))
  (shadow 'Stop (find-package "CRAZYFLIE_GAZEBO")))
(unless (find-package "CRAZYFLIE_GAZEBO::STOP")
  (make-package "CRAZYFLIE_GAZEBO::STOP"))
(unless (find-package "CRAZYFLIE_GAZEBO::STOPREQUEST")
  (make-package "CRAZYFLIE_GAZEBO::STOPREQUEST"))
(unless (find-package "CRAZYFLIE_GAZEBO::STOPRESPONSE")
  (make-package "CRAZYFLIE_GAZEBO::STOPRESPONSE"))

(in-package "ROS")





(defclass crazyflie_gazebo::StopRequest
  :super ros::object
  :slots (_groupMask ))

(defmethod crazyflie_gazebo::StopRequest
  (:init
   (&key
    ((:groupMask __groupMask) 0)
    )
   (send-super :init)
   (setq _groupMask (round __groupMask))
   self)
  (:groupMask
   (&optional __groupMask)
   (if __groupMask (setq _groupMask __groupMask)) _groupMask)
  (:serialization-length
   ()
   (+
    ;; uint8 _groupMask
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _groupMask
       (write-byte _groupMask s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _groupMask
     (setq _groupMask (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass crazyflie_gazebo::StopResponse
  :super ros::object
  :slots ())

(defmethod crazyflie_gazebo::StopResponse
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

(defclass crazyflie_gazebo::Stop
  :super ros::object
  :slots ())

(setf (get crazyflie_gazebo::Stop :md5sum-) "d44d7e9aa94d069ed5834dbd7329e1bb")
(setf (get crazyflie_gazebo::Stop :datatype-) "crazyflie_gazebo/Stop")
(setf (get crazyflie_gazebo::Stop :request) crazyflie_gazebo::StopRequest)
(setf (get crazyflie_gazebo::Stop :response) crazyflie_gazebo::StopResponse)

(defmethod crazyflie_gazebo::StopRequest
  (:response () (instance crazyflie_gazebo::StopResponse :init)))

(setf (get crazyflie_gazebo::StopRequest :md5sum-) "d44d7e9aa94d069ed5834dbd7329e1bb")
(setf (get crazyflie_gazebo::StopRequest :datatype-) "crazyflie_gazebo/StopRequest")
(setf (get crazyflie_gazebo::StopRequest :definition-)
      "uint8 groupMask
---

")

(setf (get crazyflie_gazebo::StopResponse :md5sum-) "d44d7e9aa94d069ed5834dbd7329e1bb")
(setf (get crazyflie_gazebo::StopResponse :datatype-) "crazyflie_gazebo/StopResponse")
(setf (get crazyflie_gazebo::StopResponse :definition-)
      "uint8 groupMask
---

")



(provide :crazyflie_gazebo/Stop "d44d7e9aa94d069ed5834dbd7329e1bb")


