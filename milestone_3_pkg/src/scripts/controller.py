#!/usr/bin/env python

import rospy
from std_srvs.srv import Empty


def main():
    rate = rospy.Rate(20)  # Hz

    while not rospy.is_shutdown():
        execute_state()  # execute the current state
        # get what the current state is
        state = switcher.get('state', 'fallback')
        # check if state succeded or failed
        success = switcher.get('success', False)

        # determine what state to swith to
        if state == 'takeoff':
            switcher['state'] = 'detect'
        elif state == 'detect':
            if success == True:
                switcher['state'] = 'spin'
            elif success == False:
                switcher['state'] = 'adjust'
        elif state == 'spin':
            switcher['state'] = 'path'
        elif state == 'adjust':
            switcher['state'] = 'detect'
        elif state == 'path':
            if success == True:
                switcher['state'] = 'detect'
            elif success == False:
                switcher['state'] = 'land'

        rate.sleep()


# Placeholders for services
# def path_srv():
#     print('path placeholder')
#     rospy.sleep(2)


def detect_srv():
    print('detect placeholder')
    rospy.sleep(2)


def adjust_srv():
    print('adjust placeholder')
    rospy.sleep(2)

##


def takeoff():
    return takeoff_srv()


def path():
    switcher['success'] = True
    return path_srv()


def detect():
    switcher['success'] = True
    return detect_srv()


def adjust():
    return adjust_srv()


def spin():
    return checkpointspin_srv()


def fallback():
    rospy.loginfo('Invalid state! Landing!')
    return takeoff()


switcher = {
    'takeoff': takeoff,  # takeoff
    'path': path,  # find and follow path
    'detect': detect,  # detection and localization
    'adjust': adjust,
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
    rospy.loginfo('controller started!')

    rospy.wait_for_service('checkpointspin_server')
    checkpointspin_srv = rospy.ServiceProxy('checkpointspin_server', Empty)
    rospy.loginfo('checkpointspin srv started!')

    rospy.wait_for_service('takeoff')
    takeoff_srv = rospy.ServiceProxy('takeoff', Empty)
    rospy.loginfo('takeoff srv started!')

    rospy.wait_for_service('path_planning_server')
    path_srv = rospy.ServiceProxy('path_planning_server', Empty)
    rospy.loginfo('path planning srv started!')

    rospy.sleep(1)

    main()
