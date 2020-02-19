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
cur_x = 0
cur_y = 0
cur_z = 0
cur_yaw = 0
x = 0
y = 0
z = 0
yaw = 0



def aruco_position(data):
    global detected, x, y, z, yaw
    # print("aruco position function")
    marker = PoseStamped()
    marker.header.stamp = rospy.Time.now()
    marker.header.frame_id = 'aruco/detected' + str(data.markers[0].id)
    marker.pose.position.x = 0
    marker.pose.position.y = 0.8
    marker.pose.position.z = 0
    # marker.pose.orientation = data.markers[0].pose.pose.orientation
    # tmp = euler_from_quaternion( (marker.pose.orientation.x, marker.pose.orientation.y, marker.pose.orientation.z, marker.pose.orientation.w) ) 
    # print("x: ", math.degrees(tmp[0]), "y: ", math.degrees(tmp[1]), "z: ", math.degrees(tmp[2]))
    [marker.pose.orientation.x,
    marker.pose.orientation.y,
    marker.pose.orientation.z,
    marker.pose.orientation.w ] = quaternion_from_euler(-90, 0, -90) 
    # marker.pose.orientation.x = 0
    # marker.pose.orientation.y = 0
    # marker.pose.orientation.z = 0
    # marker.pose.orientation.w = 0

    if not tf_buf.can_transform(marker.header.frame_id, 'map', marker.header.stamp, rospy.Duration(0.5)):
        rospy.logwarn_throttle(5.0, 'No transform from %s to map' % marker.header.frame_id)
        return

    pose_odom = tf_buf.transform(marker, 'map', rospy.Duration(0.5))


    x = pose_odom.pose.position.x
    y = pose_odom.pose.position.y
    z = pose_odom.pose.position.z
    # rospy.loginfo(pose_odom)

    _, _, yaw = euler_from_quaternion((pose_odom.pose.orientation.x,
                                              pose_odom.pose.orientation.y,
                                              pose_odom.pose.orientation.z,
                                              pose_odom.pose.orientation.w))

    yaw = math.degrees(yaw)
    print(yaw)
    detected = True

 
    




def cmd_func(msg):
    global cur_x, cur_y, cur_z, cur_yaw
    
    cur_x = msg.pose.position.x
    cur_y = msg.pose.position.y
    cur_z = msg.pose.position.z
    _, _, cur_yaw = euler_from_quaternion((msg.pose.orientation.x,
                                                msg.pose.orientation.y,
                                                msg.pose.orientation.z,
                                                msg.pose.orientation.w))


rospy.init_node("relative_pose")
sub_det = rospy.Subscriber('/aruco/markers', MarkerArray, aruco_position)
sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, cmd_func)
pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=5)
tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)

def main():
    global cur_x, cur_y, cur_z, cur_yaw, x, y, z, yaw, state, detected
    rate = rospy.Rate(10)
    z_dist = 0.4
    tol = 0.05
    tol2 = 0.2

    cmd = Position()
    while not rospy.is_shutdown():
        
        
        if state == 0:
            print("Take off")
            while math.sqrt((z_dist-cur_z)**2) > tol:
                cmd.header.stamp = rospy.Time.now()
                cmd.header.frame_id = "map"
                cmd.x = 0
                cmd.y = 0
                cmd.z = 0.4
                cmd.yaw = cur_yaw
                pub_cmd.publish(cmd)
                rate.sleep()
            print("done")
            state = 1
        else:
            
            if detected == True:
                while math.sqrt((x-cur_z)**2 + (y-cur_y)**2 + (z-cur_z)**2) > tol2:
                    rospy.loginfo("detected")
                    cmd.header.stamp = rospy.Time.now()
                    cmd.header.frame_id = "map"
                    cmd.x = x
                    cmd.y = y
                    cmd.z = z
                    cmd.yaw = yaw 
                    pub_cmd.publish(cmd)
                    rate.sleep()
                detected = False
            else:
                # rospy.loginfo("current!")
                cmd.header.stamp = rospy.Time.now()
                cmd.header.frame_id = "map"

                pub_cmd.publish(cmd)
                rate.sleep()
                
                    

            




if __name__ == '__main__':
    main()
    