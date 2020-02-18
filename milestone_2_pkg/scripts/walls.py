from visualization_msgs.msg import Marker
import rospy




def publishWall():
    uint8=    


def main():

    rospy.sleep(5)
    rospy.spin()


rospy.init_node("walls")
pub_cmd  = rospy.Publisher('visualization_marker', Marker, queue_size=10)
# loadWalls()

if __name__ == '__main__':

    main()