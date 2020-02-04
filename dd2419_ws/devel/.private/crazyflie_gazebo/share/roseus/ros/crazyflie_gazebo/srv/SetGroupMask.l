;; Auto-generated. Do not edit!


(when (boundp 'crazyflie_gazebo::SetGroupMask)
  (if (not (find-package "CRAZYFLIE_GAZEBO"))
    (make-package "CRAZYFLIE_GAZEBO"))
  (shadow 'SetGroupMask (find-package "CRAZYFLIE_GAZEBO")))
(unless (find-package "CRAZYFLIE_GAZEBO::SETGROUPMASK")
  (make-package "CRAZYFLIE_GAZEBO::SETGROUPMASK"))
(unless (find-package "CRAZYFLIE_GAZEBO::SETGROUPMASKREQUEST")
  (make-package "CRAZYFLIE_GAZEBO::SETGROUPMASKREQUEST"))
(unless (find-package "CRAZYFLIE_GAZEBO::SETGROUPMASKRESPONSE")
  (make-package "CRAZYFLIE_GAZEBO::SETGROUPMASKRESPONSE"))

(in-package "ROS")





(defclass crazyflie_gazebo::SetGroupMaskRequest
  :super ros::object
  :slots (_groupMask ))

(defmethod crazyflie_gazebo::SetGroupMaskRequest
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

(defclass crazyflie_gazebo::SetGroupMaskResponse
  :super ros::object
  :slots ())

(defmethod crazyflie_gazebo::SetGroupMaskResponse
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

(defclass crazyflie_gazebo::SetGroupMask
  :super ros::object
  :slots ())

(setf (get crazyflie_gazebo::SetGroupMask :md5sum-) "d44d7e9aa94d069ed5834dbd7329e1bb")
(setf (get crazyflie_gazebo::SetGroupMask :datatype-) "crazyflie_gazebo/SetGroupMask")
(setf (get crazyflie_gazebo::SetGroupMask :request) crazyflie_gazebo::SetGroupMaskRequest)
(setf (get crazyflie_gazebo::SetGroupMask :response) crazyflie_gazebo::SetGroupMaskResponse)

(defmethod crazyflie_gazebo::SetGroupMaskRequest
  (:response () (instance crazyflie_gazebo::SetGroupMaskResponse :init)))

(setf (get crazyflie_gazebo::SetGroupMaskRequest :md5sum-) "d44d7e9aa94d069ed5834dbd7329e1bb")
(setf (get crazyflie_gazebo::SetGroupMaskRequest :datatype-) "crazyflie_gazebo/SetGroupMaskRequest")
(setf (get crazyflie_gazebo::SetGroupMaskRequest :definition-)
      "uint8 groupMask
---

")

(setf (get crazyflie_gazebo::SetGroupMaskResponse :md5sum-) "d44d7e9aa94d069ed5834dbd7329e1bb")
(setf (get crazyflie_gazebo::SetGroupMaskResponse :datatype-) "crazyflie_gazebo/SetGroupMaskResponse")
(setf (get crazyflie_gazebo::SetGroupMaskResponse :definition-)
      "uint8 groupMask
---

")



(provide :crazyflie_gazebo/SetGroupMask "d44d7e9aa94d069ed5834dbd7329e1bb")


