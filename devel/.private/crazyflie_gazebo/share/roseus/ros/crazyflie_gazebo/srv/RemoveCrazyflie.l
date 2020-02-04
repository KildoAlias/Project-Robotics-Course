;; Auto-generated. Do not edit!


(when (boundp 'crazyflie_gazebo::RemoveCrazyflie)
  (if (not (find-package "CRAZYFLIE_GAZEBO"))
    (make-package "CRAZYFLIE_GAZEBO"))
  (shadow 'RemoveCrazyflie (find-package "CRAZYFLIE_GAZEBO")))
(unless (find-package "CRAZYFLIE_GAZEBO::REMOVECRAZYFLIE")
  (make-package "CRAZYFLIE_GAZEBO::REMOVECRAZYFLIE"))
(unless (find-package "CRAZYFLIE_GAZEBO::REMOVECRAZYFLIEREQUEST")
  (make-package "CRAZYFLIE_GAZEBO::REMOVECRAZYFLIEREQUEST"))
(unless (find-package "CRAZYFLIE_GAZEBO::REMOVECRAZYFLIERESPONSE")
  (make-package "CRAZYFLIE_GAZEBO::REMOVECRAZYFLIERESPONSE"))

(in-package "ROS")





(defclass crazyflie_gazebo::RemoveCrazyflieRequest
  :super ros::object
  :slots (_uri ))

(defmethod crazyflie_gazebo::RemoveCrazyflieRequest
  (:init
   (&key
    ((:uri __uri) "")
    )
   (send-super :init)
   (setq _uri (string __uri))
   self)
  (:uri
   (&optional __uri)
   (if __uri (setq _uri __uri)) _uri)
  (:serialization-length
   ()
   (+
    ;; string _uri
    4 (length _uri)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _uri
       (write-long (length _uri) s) (princ _uri s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _uri
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _uri (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass crazyflie_gazebo::RemoveCrazyflieResponse
  :super ros::object
  :slots ())

(defmethod crazyflie_gazebo::RemoveCrazyflieResponse
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

(defclass crazyflie_gazebo::RemoveCrazyflie
  :super ros::object
  :slots ())

(setf (get crazyflie_gazebo::RemoveCrazyflie :md5sum-) "636fe5e07550f026d28388e95c38a9f4")
(setf (get crazyflie_gazebo::RemoveCrazyflie :datatype-) "crazyflie_gazebo/RemoveCrazyflie")
(setf (get crazyflie_gazebo::RemoveCrazyflie :request) crazyflie_gazebo::RemoveCrazyflieRequest)
(setf (get crazyflie_gazebo::RemoveCrazyflie :response) crazyflie_gazebo::RemoveCrazyflieResponse)

(defmethod crazyflie_gazebo::RemoveCrazyflieRequest
  (:response () (instance crazyflie_gazebo::RemoveCrazyflieResponse :init)))

(setf (get crazyflie_gazebo::RemoveCrazyflieRequest :md5sum-) "636fe5e07550f026d28388e95c38a9f4")
(setf (get crazyflie_gazebo::RemoveCrazyflieRequest :datatype-) "crazyflie_gazebo/RemoveCrazyflieRequest")
(setf (get crazyflie_gazebo::RemoveCrazyflieRequest :definition-)
      "string uri
---

")

(setf (get crazyflie_gazebo::RemoveCrazyflieResponse :md5sum-) "636fe5e07550f026d28388e95c38a9f4")
(setf (get crazyflie_gazebo::RemoveCrazyflieResponse :datatype-) "crazyflie_gazebo/RemoveCrazyflieResponse")
(setf (get crazyflie_gazebo::RemoveCrazyflieResponse :definition-)
      "string uri
---

")



(provide :crazyflie_gazebo/RemoveCrazyflie "636fe5e07550f026d28388e95c38a9f4")


