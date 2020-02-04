;; Auto-generated. Do not edit!


(when (boundp 'crazyflie_gazebo::UpdateParams)
  (if (not (find-package "CRAZYFLIE_GAZEBO"))
    (make-package "CRAZYFLIE_GAZEBO"))
  (shadow 'UpdateParams (find-package "CRAZYFLIE_GAZEBO")))
(unless (find-package "CRAZYFLIE_GAZEBO::UPDATEPARAMS")
  (make-package "CRAZYFLIE_GAZEBO::UPDATEPARAMS"))
(unless (find-package "CRAZYFLIE_GAZEBO::UPDATEPARAMSREQUEST")
  (make-package "CRAZYFLIE_GAZEBO::UPDATEPARAMSREQUEST"))
(unless (find-package "CRAZYFLIE_GAZEBO::UPDATEPARAMSRESPONSE")
  (make-package "CRAZYFLIE_GAZEBO::UPDATEPARAMSRESPONSE"))

(in-package "ROS")





(defclass crazyflie_gazebo::UpdateParamsRequest
  :super ros::object
  :slots (_params ))

(defmethod crazyflie_gazebo::UpdateParamsRequest
  (:init
   (&key
    ((:params __params) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _params __params)
   self)
  (:params
   (&optional __params)
   (if __params (setq _params __params)) _params)
  (:serialization-length
   ()
   (+
    ;; string[] _params
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _params)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _params
     (write-long (length _params) s)
     (dolist (elem _params)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _params
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _params (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _params i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass crazyflie_gazebo::UpdateParamsResponse
  :super ros::object
  :slots ())

(defmethod crazyflie_gazebo::UpdateParamsResponse
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

(defclass crazyflie_gazebo::UpdateParams
  :super ros::object
  :slots ())

(setf (get crazyflie_gazebo::UpdateParams :md5sum-) "279e0627eb574ffe8968384218434f5f")
(setf (get crazyflie_gazebo::UpdateParams :datatype-) "crazyflie_gazebo/UpdateParams")
(setf (get crazyflie_gazebo::UpdateParams :request) crazyflie_gazebo::UpdateParamsRequest)
(setf (get crazyflie_gazebo::UpdateParams :response) crazyflie_gazebo::UpdateParamsResponse)

(defmethod crazyflie_gazebo::UpdateParamsRequest
  (:response () (instance crazyflie_gazebo::UpdateParamsResponse :init)))

(setf (get crazyflie_gazebo::UpdateParamsRequest :md5sum-) "279e0627eb574ffe8968384218434f5f")
(setf (get crazyflie_gazebo::UpdateParamsRequest :datatype-) "crazyflie_gazebo/UpdateParamsRequest")
(setf (get crazyflie_gazebo::UpdateParamsRequest :definition-)
      "string[] params
---

")

(setf (get crazyflie_gazebo::UpdateParamsResponse :md5sum-) "279e0627eb574ffe8968384218434f5f")
(setf (get crazyflie_gazebo::UpdateParamsResponse :datatype-) "crazyflie_gazebo/UpdateParamsResponse")
(setf (get crazyflie_gazebo::UpdateParamsResponse :definition-)
      "string[] params
---

")



(provide :crazyflie_gazebo/UpdateParams "279e0627eb574ffe8968384218434f5f")


