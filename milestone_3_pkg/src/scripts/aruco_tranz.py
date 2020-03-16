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


goal=None
def goal_callback(msg):
    global goal
    goal=msg


def transform_marker(data):

    for marker_detect in data.markers:  
        marker = PoseStamped()
        marker.header.stamp = rospy.Time.now()
        marker.header.frame_id = 'cf1/camera_link'
        marker.pose = marker_detect.pose.pose

        if not tf_buf.can_transform(marker.header.frame_id, 'map', marker.header.stamp, rospy.Duration(0.5)):
                rospy.logwarn_throttle(5.0, 'No transform from %s to map' % marker.header.frame_id)
                return


        marker_odom = tf_buf.transform(marker, 'map', rospy.Duration(0.5))

        trans = TransformStamped()
        trans.header.stamp = rospy.Time.now()
        trans.child_frame_id = "aruco/detected" + str(marker_detect.id)
        trans.header.frame_id = 'map'
        trans.transform.translation = marker_odom.pose.position
        trans.transform.rotation = marker_odom.pose.orientation

        br.sendTransform(trans)



rospy.init_node("aruco_tranz")

tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)
br = tf2_ros.StaticTransformBroadcaster()

sub_det = rospy.Subscriber('/aruco/markers', MarkerArray, goal_callback)

def main():
    rate = rospy.Rate(20)
    while not rospy.is_shutdown():
        if goal:
            transform_marker(goal)
        rate.sleep()



if __name__ == '__main__':
    main()