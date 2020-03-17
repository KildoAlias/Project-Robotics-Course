#!/usr/bin/env python

import rospy
from std_srvs.srv import Empty

def main():
    rate = rospy.Rate(20)  # Hz

    while not rospy.is_shutdown():
        execute_state() ## execute the current state
        state=switcher.get('state','fallback') ## get what the current state is
        success=switcher.get('success',False) ## check if state succeded or failed
    
        ## determine what state to swith to
        if state=='takeoff':
            switcher['state']='detect'
        elif state=='detect':
            if success==True:
                switcher['state']='path'
            elif success==False:    
                switcher['state']='adjust'
        elif state=='path':
            if success==True:
                switcher['state']='detect'
            elif success==False:
                switcher['state']='land'
        
        rate.sleep()




## Placeholders for services
def path_placeholder():
    print('path placeholder')
    rospy.sleep(2)

def detect_placeholder():
    print('detect placeholder')
    rospy.sleep(2)


def adjust_placeholder():
    print('adjust placeholder')
    rospy.sleep(2)

## 

def takeoff():
    return takeoff()
 
def path():
    switcher['success']=True
    return path_placeholder()
 
def detect():
    switcher['success']=True
    return detect_placeholder()

def adjust():
    return adjust_placeholder()

def spin():
    return checkpointspin_server()

def fallback():
    rospy.loginfo('Invalid state! Landing!')
    return takeoff()

 
switcher = {
        'takeoff': takeoff, ## takeoff
        'path': path, ## find and follow path
        'detect': detect, ## detection and localization
        'adjust': adjust,
        'spin': spin, ## execute checkpointspin
        'land': takeoff, ## landing
        'fallback': fallback, ## fallback for invalid state
        'state':'takeoff', ## current state
        'success':False
    }
 
 
def execute_state():
    # Get the function from switcher dictionary
    argument=switcher.get('state','fallback')
    func = switcher.get(argument, takeoff)
    # Execute the function
    return func()
 

if __name__ == "__main__":

    rospy.init_node('controller')
    rospy.loginfo('controller started!')

    rospy.wait_for_service('checkpointspin_server')
    checkpointspin_server = rospy.ServiceProxy('checkpointspin_server', Empty)
    rospy.loginfo('checkpointspin_server started!')

    rospy.wait_for_service('takeoff')
    takeoff = rospy.ServiceProxy('takeoff', Empty)
    rospy.loginfo('checkpointspin_server started!')

    rospy.sleep(2)

    main()
