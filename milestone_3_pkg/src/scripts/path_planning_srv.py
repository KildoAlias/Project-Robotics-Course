#!/usr/bin/env python

# TODO: get the goal point to the closest marker OR object in euclidan distance
# TODO: Should always face the closest object

import json
import os
import math
import rospy
import tf2_ros
import tf2_geometry_msgs
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from geometry_msgs.msg import PoseStamped, TransformStamped
from visualization_msgs.msg import Marker
from crazyflie_driver.msg import Position
from Astar import Astar
import matplotlib.pyplot as plt
from std_srvs.srv import Empty, EmptyResponse
from aruco_msgs.msg import MarkerArray

# Current pos (global state)
GOAL = []
pos = PoseStamped()
jsonfile = os.path.dirname(__file__) + "/worlds/dd2419_maps/demo01.world.json"
MARKERS = []
GOAL_YAW = 0
USED_ID = []


def position_callback(msg):
    global pos
    pos = msg


def publish_hover(goal):
    cmd = Position()
    cmd.header.stamp = rospy.Time.now()
    cmd.header.frame_id = "map"
    cmd.x = goal[0]
    cmd.y = goal[1]
    cmd.z = goal[2]
    cmd.yaw = GOAL_YAW
    pub_hover.publish(cmd)


def getRelativePose():
    global MARKERS
    

    with open(jsonfile, 'rb') as f:
            mapInfo = json.load(f)

    for m in mapInfo["roadsigns"]:
        goal = {'ID':None,
                'x':0,
                'y':0,
                'z':0,
                'yaw':0}
        marker = PoseStamped()
        marker.header.stamp = rospy.Time.now()
        marker.header.frame_id = "sign/"+str(m["sign"])
        marker.pose.position.x = 0
        marker.pose.position.y = 0.2
        marker.pose.position.z = 0
        [marker.pose.orientation.x,
        marker.pose.orientation.y,
        marker.pose.orientation.z,
        marker.pose.orientation.w ] = quaternion_from_euler(-90, 0, -90) 

        # Look if transform is valid
        if not tf_buf.can_transform(marker.header.frame_id, 'map', marker.header.stamp, rospy.Duration(0.5)):
            rospy.logwarn_throttle(5.0, 'No transform from %s to map' % marker.header.frame_id)
            continue
        # Does the transform
        pose_odom = tf_buf.transform(marker, 'map', rospy.Duration(0.5))

        goal['ID'] = str(m["sign"])
        goal['x'] = pose_odom.pose.position.x
        goal['y'] = pose_odom.pose.position.y
        goal['z'] = pose_odom.pose.position.z
        _, _, yaw = euler_from_quaternion((pose_odom.pose.orientation.x,
                                                pose_odom.pose.orientation.y,
                                                pose_odom.pose.orientation.z,
                                                pose_odom.pose.orientation.w))
        goal['yaw'] = math.degrees(yaw)
        print("goal", goal)
        MARKERS.append(goal)


def getNextGoal():
    global GOAL, GOAL_YAW
    getRelativePose()
    min_dist = 1000000000
    
    print(MARKERS)
    tmp_ID = None
    for marker in MARKERS:
        x = marker['x']
        y = marker['y']
        z = marker['z']
        dist = math.sqrt((pos.pose.position.x - x)**2 + (pos.pose.position.y - y)**2 + (pos.pose.position.z - z)**2)
        print(dist)
        if dist < min_dist and not(marker['ID'] in USED_ID):
            tmp_ID = marker['ID']
            min_dist = dist
            GOAL = [x,y,z]
            GOAL_YAW = marker['yaw']
            print("marker ID:", marker['ID'])
    USED_ID.append(tmp_ID)

def publish_path(goal, color = [0.0, 1.0, 0.0], id = 0):
    marker = Marker()
    marker.id = id
    marker.header.frame_id = 'map'
    marker.header.stamp = rospy.Time()
    marker.type = 2
    [marker.pose.orientation.x,
    marker.pose.orientation.y,
    marker.pose.orientation.z,
    marker.pose.orientation.w] = quaternion_from_euler(0,0,0)
    marker.pose.position.x = goal[0]
    marker.pose.position.y = goal[1]
    marker.pose.position.z = goal[2]
    marker.color.a = 0.5
    marker.color.r = color[0]
    marker.color.g = color[1]
    marker.color.b = color[2]
    marker.scale.x = 0.1
    marker.scale.y = 0.1
    marker.scale.z = 0.1
    marker.lifetime = rospy.Duration(15)
    pub_path.publish(marker)


rospy.init_node('path_planning_server')
sub_pos = rospy.Subscriber('/cf1/pose', PoseStamped, position_callback)
pub_hover = rospy.Publisher('hover', Position, queue_size=10)
pub_path = rospy.Publisher('visualization_marker', Marker, queue_size=10)

tf_buf   = tf2_ros.Buffer()
tf_lstn  = tf2_ros.TransformListener(tf_buf)

def main(empty):
    finnished = False
    rate = rospy.Rate(20)  # Hz
    getNextGoal()   # Get the new goal, closest aruco marker.
    
    # Using Astar to navigate. 
    nav = Astar(jsonfile,  0.1)
    nav.start = [pos.pose.position.x, pos.pose.position.y, 0.05] # pos.pose.position.z
    
    nav.goal = GOAL #[2.7, 1, 0.4]
    nav.getPath()

    while not finnished:
        id = 0
        for goal in nav.droneWayPoints: # Publish path to rviz
            publish_path(goal, id=id)
            id += 1
            rate.sleep()

        id = 0
        for goal in nav.droneWayPoints: # Publish waypoints to hover.
            publish_path(goal, color=[1.0, 0.0, 0.0], id=id)
            id += 1
            tol = 0.2
            while math.sqrt( (pos.pose.position.x - goal[0])**2 + (pos.pose.position.y - goal[1])**2 + (pos.pose.position.z - goal[2])**2 ) > tol:
                publish_hover(goal)
                rate.sleep()
        finnished = True
    return EmptyResponse()

def path_planning_server():
    rospy.loginfo("Path planning service ready")
    rospy.Service('path_planning_server', Empty, main)
    rospy.spin()


if __name__ == '__main__':
    path_planning_server()













