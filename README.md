# TUW Release Setup for ROS2 project root

## Setup and Install
### .bashrc
Prepare your .bashrc so that your work space get sourced if you open a terminal in work space with an env.sh file. All other ROS project sourcing commands in your .bashrc should be removed!
```
echo 'export ROS_DISTRO=humble' >> ~/.bashrc
echo 'export PROJECTS_DIR=${HOME}/projects' >> ~/.bashrc
echo 'export TUW_RELEASE_DIR=${PROJECTS_DIR}/tuw-release' >> ~/.bashrc
echo 'source /opt/ros/${ROS_DISTRO}/setup.bash' >> ~/.bashrc
echo "if [ -f "env.sh" ]; then source env.sh; fi" >> ~/.bashrc
```

### subprojects
The file subprojects.mk holds a list with all subprojects. You just need to run `make clone`. 
```
cd $MRRP2_DIR
make clone 
```

## Docker
There is a docker file ready
```
cd ${cd ${TUW_RELEASE_DIR}/docker
make build
make run
```