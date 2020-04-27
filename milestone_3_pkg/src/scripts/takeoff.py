#!/usr/bin/env python

from std_srvs.srv import Empty, EmptyResponse
import rospy
from crazyflie_driver.msg import Position
from geometry_msgs.msg import PoseStamped
from tf.transformations import euler_from_quaternion


def callback(empty):
    rospy.sleep(1)
    pub_cmd  = rospy.Publisher('hover', Position, queue_size=2)
    msg=rospy.wait_for_message('/cf1/pose',PoseStamped) 


    roll, pitch, yaw = euler_from_quaternion((msg.pose.orientation.x,
                                                msg.pose.orientation.y,
                                                msg.pose.orientation.z,
                                                msg.pose.orientation.w))

    cmd = Position()
    cmd.header.stamp = rospy.Time.now()
    cmd.header.frame_id = msg.header.frame_id
    cmd.x = msg.pose.position.x
    cmd.y = msg.pose.position.y
    cmd.yaw = yaw



    cmd.z=0.4
    rospy.loginfo('Takeoff service called')
    

    pub_cmd.publish(cmd)
    rospy.loginfo('Service done!')
    return EmptyResponse()



def takeoff():
    rospy.loginfo("takeoff/landing service ready")
    s = rospy.Service('takeoff', Empty, callback)
    rospy.spin()


rospy.init_node('takeoff')

if __name__ == "__main__":
    takeoff()

