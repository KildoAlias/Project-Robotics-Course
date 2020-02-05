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

def cmd_func(msg):
    global state, angle, count
    
    Xm = 0
    z_dist = 0.5
    N = 1

    hov = Hover()
    hov.header.stamp = rospy.Time.now()
    hov.header.frame_id = msg.header.frame_id
    hov.vx = 0 #msg.pose.position.x
    hov.vy = 0 #msg.pose.position.y
    hov.zDistance = z_dist #msg.pose.position.z

    diff_z = abs(msg.pose.position.z - z_dist)
    diff_x = abs(msg.pose.position.x - Xm)

    cmd = Position()
    cmd.header.stamp = rospy.Time.now()
    cmd.header.frame_id = msg.header.frame_id
##############################################################
    if state == 0:
        cmd.x = 0
        cmd.y = 0
        cmd.z = z_dist
        cmd.yaw = 0
        pub_cmd.publish(cmd)
        # rospy.loginfo(cmd)
        if diff_z < 0.05:
            rospy.sleep(0.2)
            state = 1
##############################################################      
    if state == 1:
        cmd.x = Xm
        cmd.y = 0
        cmd.z = z_dist
        cmd.yaw = 0
        pub_cmd.publish(cmd)

        if diff_x < 0.05:
            rospy.sleep(0.2)
            state = 3
##################################################################
    if state == 3:
        cmd.x = Xm
        cmd.y = 0
        cmd.z = z_dist
        angle += 2

        if angle == 360:
            angle = 0
            count += 1

        if count == N:
            if angle == 180:
                state = 4
                rospy.sleep(0.2)

        cmd.yaw = angle
        rospy.loginfo(cmd.yaw)
        pub_cmd.publish(cmd)
##################################################################
    if state == 4:
        cmd.x = 0
        cmd.y = 0
        cmd.z = z_dist
        cmd.yaw = 180
        pub_cmd.publish(cmd)



        


    # rospy.loginfo(diff_x)
    # if diff_x < 0.2 and diff_y < 0.2 and state == 1:
    #     idnt = random.randrange(1, 9)
    #     state = 2
    #     diff_x = 99
    #     rospy.loginfo(idnt)

    # if diff_x < 0.2 and diff_y < 0.2 and state == 2:
    #     idnt = random.randrange(1, 9)
    #     state = 3
    #     diff_x = 99
    
    # if diff_x < 0.2 and diff_y < 0.2 and state == 3:
    #     idnt = random.randrange(1, 9)
    #     state = 1
    #     diff_x = 99


rospy.init_node('moveit')
sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, cmd_func)
pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=2)
pub_hover  = rospy.Publisher('/cf1/cmd_hover', Hover, queue_size=2)
tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)


if __name__ == "__main__":
    global state, angle, count

    rospy.spin()

















#     def cmd_func(msg):
#     global idnt, state
    
#     rospy.loginfo(msg)
#     # frame_c = 'aruco/marker' + str(idnt)
#     # trans = tf_buf.lookup_transform('map', frame_c, rospy.Time(), rospy.Duration(1.0) )
#     cmd = Hover()

#     cmd.header.stamp = rospy.Time.now()
#     cmd.header.frame_id = msg.header.frame_id
#     cmd.vx = 0 #msg.pose.position.x
#     cmd.vy = 0 #msg.pose.position.y
#     cmd.zDistance = 1 #msg.pose.position.z 
#     # roll, pitch, yaw = euler_from_quaternion((trans.transform.rotation.x,
#     #                                           trans.transform.rotation.y,
#     #                                           trans.transform.rotation.z,
#     #                                           trans.transform.rotation.w))
#     # cmd.yaw = math.degrees(yaw)
#     pub_cmd.publish(cmd)

#     # diff_x = abs(msg.pose.position.x - cmd.x)
#     # diff_y = abs(msg.pose.position.y - cmd.y)

#     #rospy.loginfo(diff_x)
#     # if diff_x < 0.2 and diff_y < 0.2 and state == 1:
#     #     idnt = random.randrange(1, 9)
#     #     state = 2
#     #     diff_x = 99
#     #     rospy.loginfo(idnt)

#     # if diff_x < 0.2 and diff_y < 0.2 and state == 2:
#     #     idnt = random.randrange(1, 9)
#     #     state = 3
#     #     diff_x = 99
    
#     # if diff_x < 0.2 and diff_y < 0.2 and state == 3:
#     #     idnt = random.randrange(1, 9)
#     #     state = 1
#     #     diff_x = 99


# rospy.init_node('moveit')
# sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, cmd_func)
# # pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=2)
# pub_cmd  = rospy.Publisher('/cf1/cmd_hover', Hover, queue_size=2)
# tf_buf   = tf2_ros.Buffer()
# tf_lstn  = tf2_ros.TransformListener(tf_buf)


# if __name__ == "__main__":
#     global idnt, state

#     rospy.spin()