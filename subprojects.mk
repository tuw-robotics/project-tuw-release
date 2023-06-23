ws01/src/marker_msgs:
		git clone -b ros2 git@github.com:tuw-robotics/marker_msgs.git $@

ws01/src/tuw_msgs:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_msgs.git $@

ws01/src/tuw_geometry:
		git clone -b ros2 git@github.com:tuw-robotics/tuw_geometry.git $@

clone-ws00:
	@echo " clone-ws00"

clone-ws01: \
	ws01/src/tuw_msgs \
	ws01/src/tuw_geometry 

clone: clone-ws00 clone-ws01