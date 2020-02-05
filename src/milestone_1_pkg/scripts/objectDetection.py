#!/usr/bin/env python
from __future__ import print_function

import roslib
import sys
import rospy
import cv2
import numpy as np
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class image_converter:

  def __init__(self):
    self.image_pub = rospy.Publisher("/object_detection", Image, queue_size=2)
    self.image_pub_raw = rospy.Publisher("/object_detection_raw", Image, queue_size=2)
    self.bridge = CvBridge()
    self.image_sub = rospy.Subscriber("/cf1/camera/image_raw", Image, self.callback)

  def callback(self,data):
    # Convert the image from OpenCV to ROS format
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)

    # Convert BGR to HSV
    hsv = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)

    # define range of the color we look for in the HSV space
    lower_white = np.array([0,0,0])
    upper_white = np.array([180,5,255])

    lower_red = np.array([5,50  ,150])
    upper_red = np.array([25,200,255])

    # Threshold the HSV image to get only the pixels in ranage
    mask_white = cv2.inRange(hsv, lower_white, upper_white)
    mask_red = cv2.inRange(hsv, lower_red, upper_red)

    # Bitwise-AND mask and original image
    mask = mask_red
    res = cv2.bitwise_and(cv_image, cv_image, mask= mask)

    #Take out maxi
    max_red = np.amax(mask_red)
    max_white = np.amax(mask_white)
    number_of_red = np.count_nonzero(mask_red)
    number_of_white = np.count_nonzero(mask_white)
    #rospy.loginfo(number_of_red)


    test = np.where(mask_red == max_red)
    min_diag = np.min(test[0][:])
    max_diag = np.max(test[0][:])

    medel1 = np.mean(test[0][:])
    medel2 = np.mean(test[1][:])
    
    cols, rows, _ = res.shape
    if number_of_red > 3500:
     rospy.loginfo('Stop sign, is in the image') 
     if cols > 100 and rows > 100 :
      cv2.circle(img=cv_image, center=(int(medel2),int(medel1)), radius=int(abs(max_diag-min_diag)/2), color=(255,0,0), thickness=5)
      cv2.circle(img=res, center=(int(medel2),int(medel1)), radius=int(abs(max_diag-min_diag)/2), color=(255,0,0), thickness=5)

    # Publish the image
    try:
      self.image_pub_raw.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
      self.image_pub.publish(self.bridge.cv2_to_imgmsg(res, "bgr8"))
    except CvBridgeError as e:
      print(e)

def main(args):
  rospy.init_node('colorseg', anonymous=True)

  ic = image_converter()

  print("running...")
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")

  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)