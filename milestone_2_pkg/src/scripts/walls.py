#!/usr/bin/env python
import rospy
import math
import rospy
import tf2_ros
import tf2_geometry_msgs
import numpy as np
import json
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from geometry_msgs.msg import PoseStamped
from visualization_msgs.msg import Marker
from crazyflie_driver.msg import Position

def publish_wall(center, size, id = 0):
    marker = Marker()
    marker.id = id
    marker.header.frame_id = 'map'
    marker.type = 1
    [marker.pose.orientation.x,
    marker.pose.orientation.y,
    marker.pose.orientation.z,
    marker.pose.orientation.w] = quaternion_from_euler(0,0,0)
    marker.pose.position.x = center[0]
    marker.pose.position.y = center[1]
    marker.pose.position.z = center[2]
    marker.color.a = 0.5
    marker.color.r = 1.0
    marker.color.g = 1.0
    marker.color.b = 1.0
    marker.scale.x = size[0]
    marker.scale.y = size[1]
    marker.scale.z = size[2]
    marker.header.stamp = rospy.Time()
    pub_wall.publish(marker)


def publish_airspace(line, size, id=100):
    marker = Marker()
    marker.id = id
    marker.header.frame_id = 'map'
    marker.type = 1
    [marker.pose.orientation.x,
    marker.pose.orientation.y,
    marker.pose.orientation.z,
    marker.pose.orientation.w] = quaternion_from_euler(0,0,0)
    marker.pose.position.x = line[0]
    marker.pose.position.y = line[1]
    marker.pose.position.z = 0
    marker.color.a = 1
    marker.color.r = 1.0
    marker.color.g = 1.0
    marker.color.b = 1.0
    marker.scale.x = size[0]
    marker.scale.y = size[1]
    marker.scale.z = 0.01
    marker.header.stamp = rospy.Time()
    pub_wall.publish(marker)

rospy.init_node('walls')
pub_wall = rospy.Publisher('visualization_marker', Marker, queue_size=20)

def main():
    rospy.loginfo("Initilizing the world map...")
    rospy.loginfo("done initilizing.")
    rate = rospy.Rate(30)  # Hz
    cSpace=0.2
    jsonfile="/home/robot/dd2419_ws/src/project_packages/milestone_2_pkg/src/worlds/test.world.json"
    with open(jsonfile, 'rb') as f:
        world = json.load(f)
    init = False
    while not rospy.is_shutdown():
        id = 0
        for wall in world["walls"]:
            pos_start = np.array(wall["plane"]["start"])
            pos_stop = np.array(wall["plane"]["stop"])
            size = np.subtract(pos_stop, pos_start)
            center = np.add(pos_start,np.divide(np.subtract(pos_stop, pos_start),2))
            if pos_start[0]-pos_stop[0] == 0: size[0] = cSpace
            if pos_start[1]-pos_stop[1] == 0: size[1] = cSpace
            if pos_start[2]-pos_stop[2] == 0: size[2] = cSpace
            publish_wall(center, size, id)
            id += 1
            rate.sleep()

        
        line=world["airspace"]
        pos_start = np.array(line["min"])
        pos_stop = np.array(line["max"])
        sizeX = pos_stop[0]-pos_start[0]
        sizeY = pos_stop[1]-pos_start[1]
        CP = np.subtract(pos_stop, pos_start)/2


        publish_airspace(CP, [sizeX,sizeY])
        rate.sleep()
        




if __name__=='__main__':
    main()
