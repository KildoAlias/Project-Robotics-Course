#!/usr/bin/env python

import sys
import math
import json

import rospy
import tf2_ros
import tf_conversions
import tf2_geometry_msgs
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import TransformStamped, Vector3, PointStamped, PoseStamped
from aruco_msgs.msg import MarkerArray


def transform_func(msg):
    t = TransformStamped()
    t.header.stamp = rospy.Time.now()
    t.header.frame_id = 'map'
    t.child_frame_id = 'cf1/odom'

    t.transform.translation = msg.pose.position
    t.transform.rotation = msg.pose.orientation

    rospy.loginfo(t)
    br.sendTransform(t)    









rospy.init_node('odom_trans')
sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, transform_func)
tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)
br = tf2_ros.StaticTransformBroadcaster()


if __name__ == "__main__":
    rospy.spin()