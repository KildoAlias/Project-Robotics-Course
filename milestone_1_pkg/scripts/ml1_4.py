#!/usr/bin/env python

import sys
import math
import json
import random
import time


import math
import rospy
import tf2_ros
import tf2_geometry_msgs
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import PoseStamped
from crazyflie_driver.msg import Position, Hover


state = 0
angle = 0
count = 0
count_pose = 0
Xm = input("How many meters: ")
N = input("How many laps: ")

def init_pose(msg):
    global x_init, y_init

    x_init = msg.pose.position.x
    y_init = msg.pose.position.y



def cmd_func(msg):
    global state, angle, count, count_pose, Xm, N

    if count_pose < 1:
        init_pose(msg)
        count_pose = 1

    z_dist = 0.5

    diff_z = abs(msg.pose.position.z - z_dist)
    diff_x = abs(msg.pose.position.x - Xm)

    cmd = Position()
    cmd.header.stamp = rospy.Time.now()
    cmd.header.frame_id = msg.header.frame_id
##############################################################
    if state == 0:
        cmd.x = x_init
        cmd.y = y_init
        cmd.z = z_dist
        cmd.yaw = 0
        pub_cmd.publish(cmd)

        if diff_z < 0.05:
            rospy.sleep(0.2)
            state = 1
##############################################################      
    if state == 1:
        cmd.x = x_init + Xm
        cmd.y = y_init
        cmd.z = z_dist
        cmd.yaw = 0
        pub_cmd.publish(cmd)

        if diff_x < 0.02:
            rospy.sleep(0.2)
            state = 3
##################################################################
    if state == 3:
        cmd.x = x_init + Xm
        cmd.y = y_init
        cmd.z = z_dist
        angle += 2

        if angle == 360:
            angle = 0
            count += 1
            rospy.loginfo("Lap: " + str(count))
        cmd.yaw = angle
        pub_cmd.publish(cmd)

        if count == N:
            if angle == 180:
                state = 4
                rospy.sleep(0.2)

##################################################################
    if state == 4:
        cmd.x = x_init
        cmd.y = y_init
        cmd.z = z_dist
        cmd.yaw = 180
        pub_cmd.publish(cmd)


################################################################





####################################################################
####################################################################

#### MAIN ############################

#####################################################################
######################################################################

rospy.init_node('ml1_4')
sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, cmd_func)
pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=2)
tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)


if __name__ == "__main__":
    rospy.spin()
