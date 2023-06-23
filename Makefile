PROJECT_DIR = $(shell pwd)
SHELL = /bin/bash
BUILD_TYPE = Release
include *.mk

all: help

help:
	@echo ""
	@echo "   Help Menu"
	@echo ""
	@echo "   make build            - builds all workspaces in release"
	@echo "   make clean            - removes from workspaces install, build, log"
	@echo "   make delete-packages  - deletes all packages in wsXX/src/*"
	@echo "   make docker-build     - pulls base and builds develop"
	@echo "   make clone            - clones the subrepostories needed"
	@echo ""

docker-build:
	cd docker; make build; 

clean-ws00:
	rm -rf ./ws00/install ./ws00/build  ./ws00/log

clean-ws01:
	rm -rf ./ws01/install ./ws01/build  ./ws01/log

clean: clean-ws00 clean-ws01
	rm -rf ./install ./build  ./log

delete-packages:
	rm -rf ./ws00/src/*
	rm -rf ./ws01/src/*

build:  \
	build-ws00 \
	build-ws01

build-ws00: 
	cd ${PROJECT_DIR}/ws00; \
	source /opt/ros/${ROS_DISTRO}/setup.bash; \
	colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=${BUILD_TYPE}; \

build-ws01: 
	source /opt/ros/${ROS_DISTRO}/setup.bash; \
	source ${PROJECT_DIR}/ws00/install/setup.bash; \
	cd ${PROJECT_DIR}/ws01; \
	colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=${BUILD_TYPE}

pull:
	git pull origin
	find . -type d -name .git -exec echo {} \; -exec git --git-dir={} --work-tree=${PROJECT_DIR}/{}/.. pull origin \;
