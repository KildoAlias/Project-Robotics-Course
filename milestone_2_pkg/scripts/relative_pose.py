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

# Current goal (global state)
# goal = []
# pos = PoseStamped()
detected = False
count = 0
stand_pos = True
state = 0



def aruco_position(data):
    global detected, x, y, z, yaw


    marker = PoseStamped()
    marker.header.stamp = rospy.Time.now()
    marker.header.frame_id = 'aruco/detected' + str(data.markers[0].id)
    marker.pose.position.x = 0
    marker.pose.position.y = 0.5
    marker.pose.position.z = 0
    marker.pose.orientation = data.markers[0].pose.pose.orientation
    # [marker.pose.orientation.x,
    # marker.pose.orientation.y,
    # marker.pose.orientation.z,
    # marker.pose.orientation.w ] = quaternion_from_euler(0, 0, math.radians(0)) 
    

    if not tf_buf.can_transform(marker.header.frame_id, 'map', marker.header.stamp, rospy.Duration(0.5)):
        rospy.logwarn_throttle(5.0, 'No transform from %s to map' % marker.header.frame_id)
        return

    pose_odom = tf_buf.transform(marker, 'map', rospy.Duration(0.5))


    x = pose_odom.pose.position.x
    y = pose_odom.pose.position.y
    z = pose_odom.pose.position.z
    # rospy.loginfo(pose_odom)

    roll, pitch, yaw = euler_from_quaternion((pose_odom.pose.orientation.x,
                                              pose_odom.pose.orientation.y,
                                              pose_odom.pose.orientation.z,
                                              pose_odom.pose.orientation.w))

    yaw = math.degrees(yaw)

    rospy.loginfo(yaw)
    detected = True
 
    

def set_pose(msg):
    global cur_x, cur_y, cur_z, cur_yaw
    
    cur_x = msg.pose.position.x
    cur_y = msg.pose.position.y
    cur_z = msg.pose.position.z
    roll, pitch, cur_yaw = euler_from_quaternion((msg.pose.orientation.x,
                                                msg.pose.orientation.y,
                                                msg.pose.orientation.z,
                                                msg.pose.orientation.w))


    cur_yaw = math.degrees(cur_yaw)



def cmd_func(msg):
    global detected, count, state

    if count < 1:
        set_pose(msg)
        count = 1

    z_dist = 0.4
    diff_z = abs(msg.pose.position.z - z_dist)

    cmd = Position()
    cmd.header.stamp = rospy.Time.now()
    cmd.header.frame_id = msg.header.frame_id

## TAKE OFF ################# 
    if state == 0:
        cmd.x = cur_x
        cmd.y = cur_y
        cmd.z = z_dist
        cmd.yaw = cur_yaw
        pub_cmd.publish(cmd)
        rospy.sleep(0.2)

        if diff_z < 0.05:
            rospy.sleep(0.2)
            set_pose(msg)
            state = 1
############################

    if state == 1:
        if detected == False:
            cmd.x = cur_x
            cmd.y = cur_y
            cmd.z = cur_z
            cmd.yaw = cur_yaw
            pub_cmd.publish(cmd)
            rospy.sleep(0.2)

        else:
            set_pose(msg)
            cmd.x = x
            cmd.y = y
            cmd.z = z
            cmd.yaw = yaw 
            pub_cmd.publish(cmd)
            detected = False
            rospy.sleep(0.2)
  




if __name__ == '__main__':
    rospy.init_node("relative_pose")

    tf_buf   = tf2_ros.Buffer()
    tf_lstn  = tf2_ros.TransformListener(tf_buf)
 

    sub_det = rospy.Subscriber('/aruco/markers', MarkerArray, aruco_position)
    sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, cmd_func)
    pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=2)
    # sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, cmd_func)

    # listener = tf2_ros.TransformListener(tf_buf)
    
    rospy.spin()