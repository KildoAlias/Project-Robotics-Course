#!/usr/bin/env python

import rospy
import tf2_ros
import tf2_geometry_msgs
from std_srvs.srv import Empty
from darknet_ros_msgs.msg import BoundingBoxes

clearedSigns=  {'Object_Detected/stop sign' :True, 
                'Object_Detected/PLACEHOLDER sign':True}
def detection():



    if tf_buf.can_transform("Object_Detected/stop sign", 'map', rospy.Time.now(), rospy.Duration(0.05)): 
        if clearedSigns["Object_Detected/stop sign"]:
            clearedSigns["Object_Detected/stop sign"] = False
            return True
    elif tf_buf.can_transform("Object_Detected/PLACEHOLDER sign", 'map', rospy.Time.now(), rospy.Duration(0.05)):
        if clearedSigns["Object_Detected/PLACEHOLDER sign"]:
            clearedSigns["Object_Detected/PLACEHOLDER sign"] = False
            return True
    else:
        rospy.logwarn('NO SIGN')
    return False



def main():

    while not rospy.is_shutdown():
        execute_state()  # execute the current state
        rospy.sleep(1)
        # get what the current state is
        state = switcher.get('state', 'fallback')
        # check if state succeded or failed
        success = switcher.get('success', False)

        # determine what state to switch to
        if state == 'takeoff':
            rospy.sleep(0.5)
            switcher['state'] = 'path'
        elif state == 'detect':
            if detection():
                switcher['state'] = 'spin'
        elif state == 'spin':
            switcher['state'] = 'path'
        elif state == 'path':
            switcher['state'] = 'detect'

        rospy.sleep(1)



def detect_srv():
    print('detect called!')
    rospy.sleep(1)
    return


def takeoff():
    print('takeoff called')
    takeoff_srv()
    return takeoff_srv()


def path():
    print('path called')
    return path_srv()


def detect():
    print('detect called')
    return detect_srv()


def spin():
    print('spin called')
    return checkpointspin_srv()


def fallback():
    print('fallback called')
    rospy.loginfo('Invalid state! Landing!')
    return takeoff()


switcher = {
    'takeoff': takeoff,  # takeoff
    'path': path,  # find and follow path
    'detect': detect,  # detection and localization
    'spin': spin,  # execute checkpointspin
    'land': takeoff,  # landing
    'fallback': fallback,  # fallback for invalid state
    'state': 'takeoff',  # current state
    'success': False
}


def execute_state():
    # Get the function from switcher dictionary
    argument = switcher.get('state', 'fallback')
    func = switcher.get(argument, takeoff)
    # Execute the function
    return func()


if __name__ == "__main__":

    rospy.init_node('controller')
    tf_buf   = tf2_ros.Buffer()
    tf_lstn  = tf2_ros.TransformListener(tf_buf)

    rospy.loginfo('controller started!')

    rospy.loginfo('Waiting for "checkpointspin_server" service ...')
    rospy.wait_for_service('checkpointspin_server')
    checkpointspin_srv = rospy.ServiceProxy('checkpointspin_server', Empty)
    rospy.loginfo('checkpointspin srv started!')

    rospy.loginfo('Waiting for "takeoff" service...')
    rospy.wait_for_service('takeoff')
    takeoff_srv = rospy.ServiceProxy('takeoff', Empty)
    rospy.loginfo('takeoff srv started!')

    rospy.loginfo('Waiting for "path_planning_server" service...')
    rospy.wait_for_service('path_planning_srv')
    path_srv = rospy.ServiceProxy('path_planning_srv', Empty)
    rospy.loginfo('path planning srv started!')
    
    
    rospy.loginfo('All services are running!')
    rospy.sleep(2)

    main()
