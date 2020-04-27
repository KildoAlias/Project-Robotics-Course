#!/usr/bin/env python

import math
import rospy
import tf2_ros
import tf2_geometry_msgs
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from geometry_msgs.msg import PoseStamped, TransformStamped
from crazyflie_driver.msg import Position
from Astar import Astar
import matplotlib.pyplot as plt
from aruco_msgs.msg import MarkerArray
from darknet_ros_msgs.msg import BoundingBoxes


goal=None
validSigns = ["stop sign"]



def darknet_callback(msg):
    global goal
    goal=msg


def transform_sign(data):
    global validSigns
    
    for sign in data.bounding_boxes: 
        
        if sign.Class in validSigns: 
            sign_detected = PoseStamped()
            sign_detected.header.stamp = rospy.Time.now()
            sign_detected.header.frame_id = 'cf1/camera_link'

            focal = 245
            D = 0.2

            x = sign.xmin + (sign.xmax - sign.xmin)/2 - 320
            y = sign.ymin + (sign.ymax - sign.ymin)/2 - 240
            

            z = sign.ymax - sign.ymin

            Z = focal*D/z
            X = (x*Z)/focal
            Y = (y*Z)/focal

            sign_detected.pose.position.x = X
            sign_detected.pose.position.y = Y
            sign_detected.pose.position.z = Z

            [sign_detected.pose.orientation.x,
            sign_detected.pose.orientation.y,
            sign_detected.pose.orientation.z,
            sign_detected.pose.orientation.w] = quaternion_from_euler(0,0,0)
            
            
            if not tf_buf.can_transform(sign_detected.header.frame_id, 'map', sign_detected.header.stamp, rospy.Duration(0.5)):
                    rospy.logwarn_throttle(5.0, 'No transform from %s to map' % sign_detected.header.frame_id)
                    return


            sign_map = tf_buf.transform(sign_detected, 'map', rospy.Duration(0.5))

            trans = TransformStamped()
            trans.header.stamp = rospy.Time.now()
            trans.child_frame_id = "Object_Detected/"  + str(sign.Class)
            trans.header.frame_id = 'map'
            trans.transform.translation = sign_map.pose.position
            trans.transform.rotation = sign_map.pose.orientation

            br.sendTransform(trans)



rospy.init_node("sign_detection")

tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)
br = tf2_ros.StaticTransformBroadcaster()

sub_det = rospy.Subscriber('/darknet_ros/bounding_boxes', BoundingBoxes, darknet_callback)

def main():
    global goal
    rospy.loginfo("Initilizing object position")
    rate = rospy.Rate(5)
    while not rospy.is_shutdown():
        if goal:
            transform_sign(goal)
            goal = None
        rate.sleep()



if __name__ == '__main__':
    main()