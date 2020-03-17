#!/usr/bin/env python
import rospy
from crazyflie_driver.msg import Position
from geometry_msgs.msg import PoseStamped

goal=None

def goal_callback(msg):
    global goal
    goal=msg


def main():
    global goal
    rate = rospy.Rate(20)  # Hz
    on=True

    while not rospy.is_shutdown():    
        if goal:
            if goal.z !=0:
                pub_cmd.publish(goal)
                on=True
            elif on==True:
                rospy.loginfo('Landing and shutting down!')
                pub_cmd.publish(goal)
                on=False
        rate.sleep() 


rospy.init_node('hover')
sub = rospy.Subscriber('hover', Position, goal_callback)
pub_cmd  = rospy.Publisher('/cf1/cmd_position', Position, queue_size=2)


if __name__ == "__main__":
    main()


