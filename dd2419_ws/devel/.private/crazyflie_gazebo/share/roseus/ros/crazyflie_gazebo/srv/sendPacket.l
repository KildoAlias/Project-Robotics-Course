;; Auto-generated. Do not edit!


(when (boundp 'crazyflie_gazebo::sendPacket)
  (if (not (find-package "CRAZYFLIE_GAZEBO"))
    (make-package "CRAZYFLIE_GAZEBO"))
  (shadow 'sendPacket (find-package "CRAZYFLIE_GAZEBO")))
(unless (find-package "CRAZYFLIE_GAZEBO::SENDPACKET")
  (make-package "CRAZYFLIE_GAZEBO::SENDPACKET"))
(unless (find-package "CRAZYFLIE_GAZEBO::SENDPACKETREQUEST")
  (make-package "CRAZYFLIE_GAZEBO::SENDPACKETREQUEST"))
(unless (find-package "CRAZYFLIE_GAZEBO::SENDPACKETRESPONSE")
  (make-package "CRAZYFLIE_GAZEBO::SENDPACKETRESPONSE"))

(in-package "ROS")





(defclass crazyflie_gazebo::sendPacketRequest
  :super ros::object
  :slots (_packet ))

(defmethod crazyflie_gazebo::sendPacketRequest
  (:init
   (&key
    ((:packet __packet) (instance crazyflie_gazebo::crtpPacket :init))
    )
   (send-super :init)
   (setq _packet __packet)
   self)
  (:packet
   (&rest __packet)
   (if (keywordp (car __packet))
       (send* _packet __packet)
     (progn
       (if __packet (setq _packet (car __packet)))
       _packet)))
  (:serialization-length
   ()
   (+
    ;; crazyflie_gazebo/crtpPacket _packet
    (send _packet :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; crazyflie_gazebo/crtpPacket _packet
       (send _packet :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; crazyflie_gazebo/crtpPacket _packet
     (send _packet :deserialize buf ptr-) (incf ptr- (send _packet :serialization-length))
   ;;
   self)
  )

(defclass crazyflie_gazebo::sendPacketResponse
  :super ros::object
  :slots ())

(defmethod crazyflie_gazebo::sendPacketResponse
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

(defclass crazyflie_gazebo::sendPacket
  :super ros::object
  :slots ())

(setf (get crazyflie_gazebo::sendPacket :md5sum-) "e3f946ce194c915d34d0f5ddedef0de7")
(setf (get crazyflie_gazebo::sendPacket :datatype-) "crazyflie_gazebo/sendPacket")
(setf (get crazyflie_gazebo::sendPacket :request) crazyflie_gazebo::sendPacketRequest)
(setf (get crazyflie_gazebo::sendPacket :response) crazyflie_gazebo::sendPacketResponse)

(defmethod crazyflie_gazebo::sendPacketRequest
  (:response () (instance crazyflie_gazebo::sendPacketResponse :init)))

(setf (get crazyflie_gazebo::sendPacketRequest :md5sum-) "e3f946ce194c915d34d0f5ddedef0de7")
(setf (get crazyflie_gazebo::sendPacketRequest :datatype-) "crazyflie_gazebo/sendPacketRequest")
(setf (get crazyflie_gazebo::sendPacketRequest :definition-)
      "crazyflie_gazebo/crtpPacket packet

================================================================================
MSG: crazyflie_gazebo/crtpPacket
uint8 size
uint8 header
uint8[30] data
---

")

(setf (get crazyflie_gazebo::sendPacketResponse :md5sum-) "e3f946ce194c915d34d0f5ddedef0de7")
(setf (get crazyflie_gazebo::sendPacketResponse :datatype-) "crazyflie_gazebo/sendPacketResponse")
(setf (get crazyflie_gazebo::sendPacketResponse :definition-)
      "crazyflie_gazebo/crtpPacket packet

================================================================================
MSG: crazyflie_gazebo/crtpPacket
uint8 size
uint8 header
uint8[30] data
---

")



(provide :crazyflie_gazebo/sendPacket "e3f946ce194c915d34d0f5ddedef0de7")


