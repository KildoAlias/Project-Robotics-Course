#!/usr/bin/env python

from std_srvs.srv import Empty, EmptyResponse
import rospy
import math
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import PoseStamped
from crazyflie_driver.msg import Position





def handle_spin(empty):
    rospy.loginfo('Spin server called')

    state = True
    angle = 0
    pub_cmd  = rospy.Publisher('hover', Position, queue_size=2)
    msg=rospy.wait_for_message('/cf1/pose',PoseStamped) 
    # rospy.loginfo(msg)

    x = msg.pose.position.x
    y = msg.pose.position.y
    z = msg.pose.position.z



    roll, pitch, yaw = euler_from_quaternion((msg.pose.orientation.x,
                                                    msg.pose.orientation.y,
                                                    msg.pose.orientation.z,
                                                    msg.pose.orientation.w))


    cmd = Position()
    cmd.header.stamp = rospy.Time.now()
    cmd.header.frame_id = msg.header.frame_id
    cmd.x = x
    cmd.y = y
    cmd.z = z
    cmd.yaw = yaw
    endYaw=yaw + 360

    ## STAND ALONE
    # while count<50:
    #     pub_cmd.publish(cmd)
    #     rospy.sleep(0.1)
    #     count += 1



    rospy.sleep(0.2)

    r = rospy.Rate(10)
    while(state==True):

        angle = 4
        cmd.yaw = cmd.yaw + angle

        if cmd.yaw >= endYaw:
            cmd.yaw = endYaw - 360
            state = False

        r.sleep()
        pub_cmd.publish(cmd)
        


    rospy.loginfo('Spin service done!')
    return EmptyResponse()


 

rospy.init_node('checkpointspin_server')


def checkpointspin_server():
    rospy.loginfo("Checkpoint service ready")
    s = rospy.Service('checkpointspin_server', Empty, handle_spin)
    rospy.spin()



if __name__ == "__main__":
    checkpointspin_server()
