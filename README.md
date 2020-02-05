# Drone Project, Group 6, course code dd2419_ws
crazyflie drone:

Video channel: F7

Control channel: 86

## ROSBAG:
### 1: Make temporary directory bagfiles:
```
mkdir ~/bagfiles
cd ~/bagfiles

```
### 2:Record rosbag
```
rosbag record <topic>
```

for example to record topic /cf1/pose:
```
rosbag record /cf1/pose
```
### 2: Check info about the bag recorded
```
rosbag info <bagfile> 
```
for example:

```
rosbag info testflight.bag 
```

### 3: Playback the rosbag
```
rosbag play <bagfile>
```
Note: flag with -d to change the delay until the bag start publishing
