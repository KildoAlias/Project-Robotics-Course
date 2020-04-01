#!/usr/bin/env python
import rospy
from aruco_msgs.msg import MarkerArray
from geometry_msgs.msg import TransformStamped, Vector3, PoseStamped
import sys
import math
import tf2_ros 
from tf.transformations import quaternion_from_euler
import tf_conversions
import tf2_geometry_msgs

goal=None
def goal_callback(msg):
    global goal
    #rospy.loginfo('Marker detected!')

    goal=msg


def trans(m):
    tmp = PoseStamped()
    tmp.header.frame_id = 'cf1/camera_link'
    tmp.header.stamp = rospy.Time.now()
    tmp.pose = m.pose.pose 
    # m.header.stamp = rospy.Time.now()
    
    if not tf_buf.can_transform(tmp.header.frame_id, 'map', tmp.header.stamp, rospy.Duration(1) ):
        rospy.logwarn_throttle(2.0, 'No transform from %s to map' % tmp.header.frame_id)
        return


    mTransformed = tf_buf.transform(tmp, 'map', rospy.Duration(1) )

    t = TransformStamped()
    t.header.stamp = rospy.Time.now()
    t.header.frame_id = 'map'
    t.child_frame_id = 'aruco_detect' + str(m.id)
    t.transform.translation = mTransformed.pose.position
    t.transform.rotation= mTransformed.pose.orientation
    broadcaster.sendTransform(t)
    rospy.loginfo('Transform broadcasted')
    return


rospy.init_node('arucodetect2')
tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)
sub_goal = rospy.Subscriber('/aruco/markers', MarkerArray, goal_callback)
broadcaster = tf2_ros.TransformBroadcaster()

def main():
    rate = rospy.Rate(20)  # Hz
    while not rospy.is_shutdown():
        
        if goal:
            transforms = [trans(m) for m in goal.markers]
        rate.sleep()

    

if __name__ == "__main__":
    main()



