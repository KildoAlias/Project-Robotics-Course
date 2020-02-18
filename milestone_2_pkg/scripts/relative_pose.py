#!/usr/bin/env python

import math
import rospy
import tf2_ros
import tf2_geometry_msgs
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import PoseStamped, TransformStamped
from crazyflie_driver.msg import Position
from Astar import Astar
import matplotlib.pyplot as plt
from aruco_msgs.msg import MarkerArray

# Current goal (global state)
# goal = []
# pos = PoseStamped()
state = 0
count_pose = 0

def transform_camera(marker):
    t = TransformStamped()
    t.header.stamp = rospy.Time.now()
    t.header.frame_id = 'cf1/camera_link'
    t.child_frame_id = 'aruco/detected' + str(marker.id)
    t.transform.translation = marker.pose.pose.position
    t.transform.rotation = marker.pose.pose.orientation
    t.transform.translation.z = t.transform.translation.z + 1
    br2.sendTransform(t)    

def transform_marker(data):
    global x, y, z, cur_x, cur_y, cur_z, state

    marker = data.markers[0]
    transform_camera(marker)
    frame_c = 'aruco/detected' + str(marker.id)
    trans = tf_buf.lookup_transform('map', frame_c, rospy.Time(), rospy.Duration(1.0) )    #map, aruco/marker[id]
    trans.header.frame_id = 'map'
    trans.child_frame_id = 'aruco/detected_map' + str(marker.id)  #'aruco/detected' + str(marker.id)

    br.sendTransform(trans)

    x = trans.transform.translation.x
    y = trans.transform.translation.y
    z = trans.transform.translation.z
    state = 1
    


def init_pose(msg):
    global cur_x, cur_y, cur_z

    cur_x = msg.pose.position.x
    cur_y = msg.pose.position.y
    cur_z = msg.pose.position.z + 0.5

def cmd_func(msg):
    global state, count_pose, cur_x, cur_y, cur_z
    
    if count_pose < 1:
        init_pose(msg)
        count_pose = 1

    cmd = Position()
    cmd.header.stamp = rospy.Time.now()
    cmd.header.frame_id = msg.header.frame_id

    if state == 1:
        cmd.x = x
        cmd.y = y
        cmd.z = z 
        cur_x = msg.pose.position.x
        cur_y = msg.pose.position.y
        cur_z = msg.pose.position.z
        state = 0
    else:
        cmd.x =  cur_x
        cmd.y =  cur_y
        cmd.z =  cur_z

    pub_cmd.publish(cmd)



    

if __name__ == '__main__':
    rospy.init_node("relative_pose")

    tf_buf   = tf2_ros.Buffer()
    tf_lstn  = tf2_ros.TransformListener(tf_buf)
    br = tf2_ros.StaticTransformBroadcaster()

    tf_buf2   = tf2_ros.Buffer()
    tf_lstn2  = tf2_ros.TransformListener(tf_buf2)
    br2 = tf2_ros.TransformBroadcaster()

    sub_det = rospy.Subscriber('/aruco/markers', MarkerArray, transform_marker)
    pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=2)
    sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, cmd_func)

    # listener = tf2_ros.TransformListener(tf_buf)
    
    rospy.spin()