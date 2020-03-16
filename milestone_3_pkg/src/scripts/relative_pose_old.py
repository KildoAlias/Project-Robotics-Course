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



class RelativePose:
    def __init__(self):
        self.msg = None


    def aruco_position(self, data):
        global detected, x, y, z, yaw, cur_x, cur_y, cur_z, cur_yaw


        marker = PoseStamped()
        marker.header.stamp = rospy.Time.now()
        marker.header.frame_id = 'aruco/detected' + str(data.markers[0].id)
        marker.pose.position.x = 0
        marker.pose.position.y = 0.5
        marker.pose.position.z = 0
        marker.pose.orientation = data.markers[0].pose.pose.orientation
    

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

        detected = True

        cur_x = self.msg.pose.position.x
        cur_y = self.msg.pose.position.y
        cur_z = self.msg.pose.position.z
        roll, pitch, cur_yaw = euler_from_quaternion((self.msg.pose.orientation.x,
                                                    self.msg.pose.orientation.y,
                                                    self.msg.pose.orientation.z,
                                                    self.msg.pose.orientation.w))


    def cmd_func(self, msg):    
        global detected, count, state, cur_x, cur_y, cur_z, cur_yaw

        self.msg = msg

        if count < 1:
            cur_x = self.msg.pose.position.x
            cur_y = self.msg.pose.position.y
            cur_z = self.msg.pose.position.z
            cur_yaw = 0
            count = 1

        z_dist = 0.4
        diff_z = abs(msg.pose.position.z - z_dist)

        cmd = Position()
        cmd.header.stamp = rospy.Time.now()
        cmd.header.frame_id = msg.header.frame_id

 
        if state == 0:
            cmd.x = cur_x
            cmd.y = cur_y
            cmd.z = z_dist
            cmd.yaw = cur_yaw
            pub_cmd.publish(cmd)
            rospy.sleep(0.2)

            if diff_z < 0.05:
                rospy.sleep(0.2)
                cmd.z = cur_z
                state = 1


        if state == 1:
            if detected == False:
                cmd.x = cur_x
                cmd.y = cur_y
                cmd.z = cur_z
                cmd.yaw = cur_yaw
                pub_cmd.publish(cmd)
                rospy.sleep(0.2)

            else:
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
 
    pose = RelativePose()

    sub_det = rospy.Subscriber('/aruco/markers', MarkerArray, pose.aruco_position)
    sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, pose.cmd_func)
    pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=2)
    # sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, cmd_func)

    # listener = tf2_ros.TransformListener(tf_buf)
    
    rospy.spin()