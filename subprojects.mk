ws/src/marker_msgs:
		git clone -b ros2 git@github.com:tuw-robotics/marker_msgs.git $@

ws/src/tuw_msgs:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_msgs.git $@

ws/src/tuw_geometry:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_geometry.git $@

clone-ws: \
	ws/src/tuw_msgs \
	ws/src/tuw_geometry 

clone: clone-ws