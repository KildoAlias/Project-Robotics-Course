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



pos = { 'x':0,
        'y':0,
        'z':0,
        'yaw':0}

goal = {'x':0,
        'y':0,
        'z':0,
        'yaw':0}



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



def measurement_callback(msg):
    
    for marker_detect in msg.markers:
        marker = PoseStamped()
        marker.header.stamp = rospy.Time.now()
        marker.header.frame_id = "aruco/detected" + str(marker_detect.id)
        marker.pose = marker_detect.pose.pose

        if not tf_buf.can_transform(marker.header.frame_id, 'aruco/marker3', marker.header.stamp, rospy.Duration(0.5)):
            rospy.logwarn_throttle(5.0, 'No transform from %s to map' % marker.header.frame_id)
            return
            
        
        detect_look = tf_buf.lookup_transform('cf1/odom', marker.header.frame_id, marker.header.stamp )    
        aruco_look = tf_buf.lookup_transform('map', 'aruco/marker3', marker.header.stamp ) 

        odom_map = TransformStamped()
        odom_map.header.stamp = aruco_look.header.stamp
        odom_map.header.frame_id = 'map'
        odom_map.child_frame_id = 'cf1/odom'
        odom_map.transform.translation.x = (aruco_look.transform.translation.x - detect_look.transform.translation.x)
        odom_map.transform.translation.y = (aruco_look.transform.translation.y - detect_look.transform.translation.y)
        odom_map.transform.translation.z = (aruco_look.transform.translation.z - detect_look.transform.translation.z)

        detect_look.transform.rotation.x = - detect_look.transform.rotation.x
        detect_look.transform.rotation.y = - detect_look.transform.rotation.y
        detect_look.transform.rotation.z = - detect_look.transform.rotation.z
        q_diff = quaternion_multiply(  aruco_look.transform.rotation, detect_look.transform.rotation )

        odom_map.transform.rotation.x = q_diff[1]
        odom_map.transform.rotation.y = q_diff[2]
        odom_map.transform.rotation.z = q_diff[3]
        odom_map.transform.rotation.w = q_diff[0]
        br.sendTransform(odom_map)





rospy.init_node("localisation")
sub_det = rospy.Subscriber('/aruco/markers', MarkerArray, measurement_callback)
# sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, getPosition_callback)
pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=5)

tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)
br = tf2_ros.StaticTransformBroadcaster()

trans = TransformStamped()
trans.header.stamp = rospy.Time.now()
trans.child_frame_id = 'cf1/odom'
trans.header.frame_id = 'map'
trans.transform.translation.x = 0.5
trans.transform.translation.y = 0.5
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