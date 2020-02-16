#!/usr/bin/env python

import math
import rospy
import tf2_ros
import tf2_geometry_msgs
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import PoseStamped
from crazyflie_driver.msg import Position
from Astar import Astar
import matplotlib.pyplot as plt

# Current goal (global state)
goal = []
pos = PoseStamped()

def position_callback(msg):
    global pos
    pos = msg

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

def main():
    global pos
    rate = rospy.Rate(20)  # Hz
    nav = Astar("/home/robot/dd2419_ws/src/project_packages/milestone_2_pkg/worlds/awesome.world.json",0.25)
    nav.start = [0,0,0.4]
    nav.goal = [-5,-5,2]
    nav.getPath()
    nav.printMAP()
    plt.show()
    
    while not rospy.is_shutdown():
        for goal in nav.droneWayPoints:
            tol = 0.1
            while math.sqrt( (pos.pose.position.x - goal[0])**2 + (pos.pose.position.y - goal[1])**2 + (pos.pose.position.z - goal[2])**2 ) > tol:
                publish_cmd(goal)
                rate.sleep()
        nav.droneWayPoints = []
        publish_cmd(goal)
        rate.sleep()
    # print("QUITING...")
    # while goal[2] > 0.15:
    #     goal[2] -= 0.01
    #     publish_cmd(goal)
    #     rospy.sleep(0.1)



    

if __name__ == '__main__':
    main()