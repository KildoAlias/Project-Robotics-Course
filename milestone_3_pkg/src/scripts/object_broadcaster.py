#!/usr/bin/env python

import sys
import math
import os
import json

import rospy
import tf2_ros 
from tf.transformations import quaternion_from_euler
from geometry_msgs.msg import TransformStamped, Vector3

def transform_from_marker(m):
    t = TransformStamped()
    t.header.frame_id = 'map'
    t.child_frame_id = 'sign/' + m["sign"]
    t.transform.translation = Vector3(*m['pose']['position'])
    roll, pitch, yaw = m['pose']['orientation']
    (t.transform.rotation.x,
     t.transform.rotation.y,
     t.transform.rotation.z,
     t.transform.rotation.w) = quaternion_from_euler(math.radians(roll),
                                                     math.radians(pitch),
                                                     math.radians(yaw))
    return t

rospy.init_node('displaymapobjects')

def main():
    rospy.loginfo("Initilizing object broadcaster")
 
    map_world = open(os.path.dirname(__file__) + '/map.txt', 'r').readline()
    jsonfile = os.path.dirname(__file__) + map_world

    # Load world JSON
    with open(jsonfile, 'rb') as f:
        world = json.load(f)

    # Create a transform for each marker
    transforms = [transform_from_marker(m) for m in world['roadsigns']]

    # Publish these transforms statically forever
    broadcaster = tf2_ros.StaticTransformBroadcaster()
    broadcaster.sendTransform(transforms)
    rospy.spin()

if __name__ == "__main__":
    main()