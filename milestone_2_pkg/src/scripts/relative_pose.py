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
from std_srvs.srv import Empty



# GLOBAL VARIABLES
detected = False
stand_pos = True
pos = { 'x':0,
        'y':0,
        'z':0,
        'yaw':0}

goal = {'x':0,
        'y':0,
        'z':0,
        'yaw':0}


def relativePose_callback(data):
    global goal, detected
    # Wanted position in aruco detected frame. 
    marker = PoseStamped()
    marker.header.stamp = rospy.Time.now()
    marker.header.frame_id = 'aruco/detected' + str(data.markers[0].id)
    marker.pose.position.x = 0
    marker.pose.position.y = 0.5
    marker.pose.position.z = 0
    [marker.pose.orientation.x,
    marker.pose.orientation.y,
    marker.pose.orientation.z,
    marker.pose.orientation.w ] = quaternion_from_euler(-90, 0, -90) 

    # Look if transform is valid
    if not tf_buf.can_transform(marker.header.frame_id, 'map', marker.header.stamp, rospy.Duration(0.5)):
        rospy.logwarn_throttle(5.0, 'No transform from %s to map' % marker.header.frame_id)
        return
    # Does the transform
    pose_odom = tf_buf.transform(marker, 'map', rospy.Duration(0.5))


    goal['x'] = pose_odom.pose.position.x
    goal['y'] = pose_odom.pose.position.y
    goal['z'] = pose_odom.pose.position.z
    _, _, yaw = euler_from_quaternion((pose_odom.pose.orientation.x,
                                              pose_odom.pose.orientation.y,
                                              pose_odom.pose.orientation.z,
                                              pose_odom.pose.orientation.w))
    goal['yaw'] = math.degrees(yaw)
    detected = True


def getPosition_callback(msg):
    global pos
    pos['x'] = msg.pose.position.x
    pos['y'] = msg.pose.position.y
    pos['z'] = msg.pose.position.z
    _, _, pos['yaw'] = euler_from_quaternion((  msg.pose.orientation.x,
                                                msg.pose.orientation.y,
                                                msg.pose.orientation.z,
                                                msg.pose.orientation.w))

rospy.init_node("relative_pose")
sub_det = rospy.Subscriber('/aruco/markers', MarkerArray, relativePose_callback)
sub_goal = rospy.Subscriber('/cf1/pose', PoseStamped, getPosition_callback)
pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=5)
tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)

rospy.wait_for_service('checkpointspin_server')
checkpointspin_server = rospy.ServiceProxy('checkpointspin_server', Empty)




def main():
    global pos, goal, detected
    rate = rospy.Rate(5)
    z_dist = 0.4
    tol_takeOff = 0.05
    tol2 = 0.1
    takeOff = True
    spin = True
    cmd = Position()

    while not rospy.is_shutdown():
        
        
        if takeOff == True:
            print("Take off")
            while math.sqrt((z_dist-pos['z'])**2) > tol_takeOff:
                cmd.header.stamp = rospy.Time.now()
                cmd.header.frame_id = "map"
                cmd.x = pos['x']
                cmd.y = pos['y']
                cmd.z = 0.4
                cmd.yaw = pos['yaw']
                pub_cmd.publish(cmd)
                rate.sleep()
            print("done")
            takeOff = False
        else:
            
            if detected == True:
                rospy.loginfo("detected")

                while math.sqrt((goal['x']-pos['x'])**2 + (goal['y']-pos['y'])**2 + (goal['z']-pos['z'])**2 ) > tol2:
                    cmd.header.stamp = rospy.Time.now()
                    cmd.header.frame_id = "map"
                    cmd.x = goal['x']
                    cmd.y = goal['y']
                    cmd.z = goal['z']
                    cmd.yaw = goal['yaw'] 
                    pub_cmd.publish(cmd)
                    rate.sleep()

                detected = False

                if(spin == True):
                    rospy.sleep(1.5)
                    checkpointspin_server()
                    spin = False

            else:
                cmd.header.stamp = rospy.Time.now()
                cmd.header.frame_id = "map"
                pub_cmd.publish(cmd)
                rate.sleep()
                
                    
if __name__ == '__main__':
    main()
    