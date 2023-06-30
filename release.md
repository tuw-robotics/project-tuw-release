# release_ros_pkgs
root project to relase ROS2 packages

Wir arbeiten im branch ros2. 
Der Branch ros2 ist unser arbeitsbranch und wird in rolloing released.

Für jede distro wird ein Branch zum Release angelegt. 

[First-Time-Release](https://docs.ros.org/en/humble/How-To-Guides/Releasing/First-Time-Release.html)

## release team

View "tuw_robotics": https://github.com/orgs/ros2-gbp/teams/tuw_robotics

* Closed request on Add release team #180 
https://github.com/ros2-gbp/ros2-gbp-github-org/issues/180

## install
```
sudo apt install python3-bloom python3-catkin-pkg
```
### bloom access token
Store your access tocken in `~/.config/bloom`.

### all github chackouts via ssl/ssh
add to `~/.gitconfig` the following lines

```
# Always use ssh for github, even if the remote URL uses https or git
[url "git@github.com:"]
  insteadOf = git://github.com/
[url "git@github.com:"]
  insteadOf = https://github.com/
```

## Release
```
catkin_generate_changelog --all
catkin_prepare_release
```
### tuw_msgs

Bloom Release: 
```
# humble --> branch ros2
# bloom-release --new-track --rosdistro humble --track humble tuw_msgs # first-time
bloom-release --rosdistro humble tuw_msgs
# rolling --> branch ros2
# bloom-release --new-track --rosdistro rolling --track rolling tuw_msgs # first-time
bloom-release --rosdistro rolling tuw_msgs
```

Repository Name: `tuw_msgs`
Release Repository url: `https://github.com/tuw-robotics/tuw_msgs-release.git`
Upstream Repository URI: `https://github.com/tuw-robotics/tuw_msgs.git`
Upstream Devel Branch: ros2, humble

### tuw_geometry

Bloom Release: 
```
# humble --> branch ros2
# bloom-release --new-track --rosdistro humble --track humble tuw_geometry # first-time
bloom-release --rosdistro humble tuw_geometry
# rolling --> branch ros2
# bloom-release --new-track --rosdistro rolling --track rolling tuw_geometry # first-time
bloom-release --rosdistro rolling tuw_geometry
```

Repository Name: `tuw_geometry`
Release Repository url: `https://github.com/tuw-robotics/tuw_geometry-release.git`
Upstream Repository URI: `https://github.com/tuw-robotics/tuw_geometry.git`
Upstream Devel Branch: ros2, humble

### marker_msgs

Bloom Release: 
```
# humble --> branch ros2
# bloom-release --new-track --rosdistro humble --track humble marker_msgs # first-time
bloom-release --rosdistro humble marker_msgs
# rolling --> branch ros2
# bloom-release --new-track --rosdistro rolling --track rolling marker_msgs # first-time
bloom-release --rosdistro rolling marker_msgs
```

Repository Name: `marker_msgs`
Release Repository url: `https://github.com/tuw-robotics/marker_msgs-release.git`
Upstream Repository URI: `https://github.com/tuw-robotics/marker_msgs.git`
Upstream Devel Branch: ros2, humble

### marker_msgs

Bloom Release: 
```
# humble --> branch ros2
# bloom-release --new-track --rosdistro humble --track humble marker_msgs # first-time
bloom-release --rosdistro humble marker_msgs
# rolling --> branch ros2
# bloom-release --new-track --rosdistro rolling --track rolling marker_msgs # first-time
bloom-release --rosdistro rolling marker_msgs
```

Repository Name: `marker_msgs`
Release Repository url: `https://github.com/tuw-robotics/marker_msgs-release.git`
Upstream Repository URI: `https://github.com/tuw-robotics/marker_msgs.git`
Upstream Devel Branch: ros2, humble

## Testing

# uncrustify.xunit.xml
```
colcon test --packages-select tuw_geometry
colcon test-result --all
ament_uncrustify --reformat
```
