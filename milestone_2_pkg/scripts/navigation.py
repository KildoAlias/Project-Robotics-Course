#!/usr/bin/env python

import math
import rospy
import tf2_ros
import tf2_geometry_msgs
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from geometry_msgs.msg import PoseStamped
from visualization_msgs.msg import Marker
from crazyflie_driver.msg import Position
from Astar import Astar
import matplotlib.pyplot as plt

# Current goal (global state)
goal = []
pos = PoseStamped()

def position_callback(msg):
    global pos
    pos = msg

def publish_path(goal, color = [0.0, 1.0, 0.0], id = 0):
    marker = Marker()
    marker.id = id
    marker.header.frame_id = 'map'
    marker.header.stamp = rospy.Time()
    marker.type = 2
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
    pub_path.publish(marker)

def publish_cmd(goal):
    cmd = Position()
    cmd.header.stamp = rospy.Time.now()
    cmd.header.frame_id = "map"
    cmd.x = goal[0]
    cmd.y = goal[1]
    cmd.z = goal[2]

    pub_cmd.publish(cmd)


rospy.init_node('navigation')
sub_pos = rospy.Subscriber('/cf1/pose', PoseStamped, position_callback)
pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=2)
pub_path = rospy.Publisher('visualization_marker', Marker, queue_size=10)

def main():
    global pos
    rate = rospy.Rate(20)  # Hz
    nav = Astar("/home/i/l/ilianc/dd2419_ws/src/project_packages/milestone_2_pkg/worlds/tutorial_1.world.json",0.25)
    nav.start = [0,0,0.4]
    nav.goal = [-5,-5,2]
    nav.getPath()
    nav.printMAP()
    plt.show()
    
    while not rospy.is_shutdown():
        id = 0
        for goal in nav.droneWayPoints:
            publish_path(goal, id=id)
            id += 1

        id = 0
        for goal in nav.droneWayPoints:
            publish_path(goal, color=[1.0, 0.0, 0.0], id=id)
            id += 1
            tol = 0.1
            while math.sqrt( (pos.pose.position.x - goal[0])**2 + (pos.pose.position.y - goal[1])**2 + (pos.pose.position.z - goal[2])**2 ) > tol:
                publish_cmd(goal)
                rate.sleep()
        nav.droneWayPoints = []
        publish_cmd(goal)
        rate.sleep()



    

if __name__ == '__main__':
    main()