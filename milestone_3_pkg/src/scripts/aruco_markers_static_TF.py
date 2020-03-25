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
    t.child_frame_id = 'aruco/marker' + str(m['id'])
    t.transform.translation = Vector3(*m['pose']['position'])
    roll, pitch, yaw = m['pose']['orientation']
    (t.transform.rotation.x,
     t.transform.rotation.y,
     t.transform.rotation.z,
     t.transform.rotation.w) = quaternion_from_euler(math.radians(roll),
                                                     math.radians(pitch),
                                                     math.radians(yaw))
    return t

def main():
    # Let ROS filter through the arguments
    jsonfile = os.path.dirname(__file__) + "/worlds/dd2419_maps/demo01.world.json"

    # Load world JSON
    with open(jsonfile, 'rb') as f:
        world = json.load(f)

    # Create a transform for each marker
    transforms = [transform_from_marker(m) for m in world['markers']]

    # Publish these transforms statically forever
    rospy.init_node('displaymapmarkers')
    broadcaster = tf2_ros.StaticTransformBroadcaster()
    broadcaster.sendTransform(transforms)
    rospy.spin()

if __name__ == "__main__":
    main()
