#!/usr/bin/env python

import math
import rospy
import tf2_ros
import tf2_geometry_msgs
from tf.transformations import quaternion_from_euler, euler_from_quaternion
from geometry_msgs.msg import PoseStamped, TransformStamped
from crazyflie_driver.msg import Position
from Astar import Astar
import matplotlib.pyplot as plt
from aruco_msgs.msg import MarkerArray
import numpy as np
from tf.transformations import *

def quaternion_multiply(quaternion1, quaternion0):
    # w0, x0, y0, z0 = quaternion0
    x0 = quaternion0.x
    y0 = quaternion0.y
    z0 = quaternion0.z
    w0 = quaternion0.w
    # w1, x1, y1, z1 = quaternion1
    x1 = quaternion1.x
    y1 = quaternion1.y
    z1 = quaternion1.z
    w1 = quaternion1.w
    return np.array([-x1 * x0 - y1 * y0 - z1 * z0 + w1 * w0,
                     x1 * w0 + y1 * z0 - z1 * y0 + w1 * x0,
                     -x1 * z0 + y1 * w0 + z1 * x0 + w1 * y0,
                     x1 * y0 - y1 * x0 + z1 * w0 + w1 * z0], dtype=np.float64)



def rot_trans(detect_look, q1, q2, q3, q4):
    rot = TransformStamped()
    rot.header.stamp = detect_look.header.stamp
    rot.header.frame_id = 'cf1/odom'
    rot.child_frame_id = 'odomRot'

    # rot.transform.translation = detect_look.transform.translation
    rot.transform.rotation.x = q1
    rot.transform.rotation.y = q2
    rot.transform.rotation.z = q3
    rot.transform.rotation.w = q4

    br.sendTransform(rot)
    rospy.sleep(0.1)

def measurement_callback(msg):
    
    # rospy.logwarn(msg)
    for marker_detect in msg.markers:
        rospy.logwarn(marker_detect)

        marker = PoseStamped()
        marker.header.stamp = rospy.Time.now()
        marker.header.frame_id = "aruco/detected" + str(marker_detect.id)
        marker.pose = marker_detect.pose.pose

        # rospy.loginfo(marker.header.frame_id)
      
        if not tf_buf.can_transform(marker.header.frame_id, 'map', marker.header.stamp, rospy.Duration(0.5)):
            rospy.logwarn_throttle(5.0, 'No transform from %s to map' % marker.header.frame_id)
            return
    
        
        aruco_frame = 'aruco/marker' + str(marker_detect.id)
        detect_look = tf_buf.lookup_transform('cf1/odom', marker.header.frame_id, marker.header.stamp )    
        aruco_look = tf_buf.lookup_transform('map', aruco_frame, marker.header.stamp ) 

        
        detect_look.transform.rotation.w = -detect_look.transform.rotation.w
        q_diff = quaternion_multiply(  aruco_look.transform.rotation, detect_look.transform.rotation )
   

        rospy.sleep(0.1)
        rot_trans(detect_look, q_diff[1], q_diff[2], q_diff[3], q_diff[0])

        rot_marker = TransformStamped()
        rot_marker.header.stamp = rospy.Time.now()
        rot_marker.header.frame_id = 'odomRot'
        rot_marker.child_frame_id = 'rot_marker' + str(marker_detect.id)
        rot_marker.transform.translation = detect_look.transform.translation
        rot_marker.transform.rotation.w = 1
        br.sendTransform(rot_marker)
        rospy.sleep(0.1)

        rot_marker_frame = 'rot_marker' + str(marker_detect.id)
        detect_look_new = tf_buf.lookup_transform('cf1/odom', rot_marker_frame, marker.header.stamp )
        odom = TransformStamped()
        odom.header.stamp = rospy.Time.now()
        odom.header.frame_id = 'map'
        odom.child_frame_id = 'cf1/odom'
        odom.transform.rotation.x = q_diff[1]
        odom.transform.rotation.y = q_diff[2]
        odom.transform.rotation.z = q_diff[3]
        odom.transform.rotation.w = q_diff[0]
        odom.transform.translation.x = (aruco_look.transform.translation.x - detect_look_new.transform.translation.x) 
        odom.transform.translation.y = (aruco_look.transform.translation.y - detect_look_new.transform.translation.y) 
        odom.transform.translation.z = (aruco_look.transform.translation.z - detect_look_new.transform.translation.z)
        br2.sendTransform(odom)




rospy.init_node("localisation")
sub_det = rospy.Subscriber('/aruco/markers', MarkerArray, measurement_callback)
# sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, getPosition_callback)


tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)
br = tf2_ros.StaticTransformBroadcaster()
br2 = tf2_ros.StaticTransformBroadcaster()

trans = TransformStamped()
trans.header.stamp = rospy.Time.now()
trans.child_frame_id = 'cf1/odom_rot'
trans.header.frame_id = 'cf1/odom'
# trans.transform.translation.x = 0.5
# trans.transform.translation.y = 0.5
trans.transform.rotation.w = 1
br.sendTransform(trans)



def main():
    rate = rospy.Rate(20)
    # cmd = Position()
    # cmd.z = 0.35

    while not rospy.is_shutdown():
        # pub_cmd.publish(cmd)    

        rate.sleep()



if __name__ == '__main__':
    main()

