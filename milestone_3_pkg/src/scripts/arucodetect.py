#!/usr/bin/env python
import rospy
from aruco_msgs.msg import MarkerArray
from geometry_msgs.msg import TransformStamped, Vector3
import sys
import math
import tf2_ros 
from tf.transformations import quaternion_from_euler
import tf_conversions



def arudet(msg):
    
    transforms = [trans(m) for m in msg.markers]
    return transforms

def trans(m):
    broadcaster = tf2_ros.TransformBroadcaster()
    t = TransformStamped()
    t.header.stamp = rospy.Time.now()
    t.header.frame_id = 'cf1/camera_link'
    t.child_frame_id = 'aruco/detected' + str(m.id)
    t.transform.translation = m.pose.pose.position
    t.transform.rotation= m.pose.pose.orientation
    broadcaster.sendTransform(t)
    return t



def main():
    rospy.init_node('arucodetect')
    transforms= rospy.Subscriber('/aruco/markers', MarkerArray,  arudet)
    rospy.spin()
    
    



if __name__ == "__main__":
    main()






