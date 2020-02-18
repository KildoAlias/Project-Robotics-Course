#!/usr/bin/env python
import rospy
from visualization_msgs.msg import Marker
import json
import numpy as np
from tf.transformations import euler_from_quaternion, quaternion_from_euler

def publish_path(center, size):
    marker = Marker()
    marker.id = id
    marker.header.frame_id = 'map'
    marker.header.stamp = rospy.Time()
    marker.type = 1
    [marker.pose.orientation.x,
    marker.pose.orientation.y,
    marker.pose.orientation.z,
    marker.pose.orientation.w] = quaternion_from_euler(0,0,0)
    marker.pose.position.x = center[0]
    marker.pose.position.y = center[1]
    marker.pose.position.z = center[2]
    marker.color.a = 0.5
    marker.color.r = 1
    marker.color.g = 1
    marker.color.b = 1
    marker.scale.x = size[0]
    marker.scale.y = size[1]
    marker.scale.z = size[2]
    rospy.loginfo('hejhej')
    pub_path.publish(marker)

rospy.init_node('walls')
pub_path = rospy.Publisher('visualization_marker', Marker, queue_size=10)

def main():
    # rate = rospy.Rate(10)  # Hz
    cSpace=0.2
    jsonfile="/home/k/i/kildo/dd2419_ws/src/testnodes/scripts/test.world.json"
    with open(jsonfile, 'rb') as f:
        world = json.load(f)


    for wall in world["walls"]:
        pos_start = np.array(wall["plane"]["start"])
        pos_stop = np.array(wall["plane"]["stop"])
        size = np.subtract(pos_stop, pos_start)
        center = np.divide(np.subtract(pos_stop, pos_start),2)
        if pos_start[0]-pos_stop[0] == 0: size[0] = cSpace
        if pos_start[1]-pos_stop[1] == 0: size[1] = cSpace
        if pos_start[2]-pos_stop[2] == 0: size[2] = cSpace
        publish_path(center, size)
    rospy.spin()


if __name__=='__main__':
    main()
