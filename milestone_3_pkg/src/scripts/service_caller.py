#!/usr/bin/env python

from std_srvs.srv import Empty, EmptyResponse
import rospy
from crazyflie_driver.msg import Position

rospy.wait_for_service('takeoff')
takeoff = rospy.ServiceProxy('takeoff', Empty)
takeoff()


# rospy.wait_for_service('checkpointspin_server')
# checkpointspin_server = rospy.ServiceProxy('checkpointspin_server', Empty)
# checkpointspin_server()