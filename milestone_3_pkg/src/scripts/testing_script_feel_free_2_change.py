#!/usr/bin/env python


import rospy
from std_srvs.srv import Empty





rospy.init_node("client")
rospy.wait_for_service("path_planning_server")
path_server = rospy.ServiceProxy("path_planning_server", Empty)

path_server()