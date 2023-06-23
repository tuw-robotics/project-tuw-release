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

clean-ws:
	rm -rf ./ws/install ./ws/build  ./ws/log

clean: clean-ws
	rm -rf ./install ./build  ./log

delete-packages:
	rm -rf ./ws/src/*

build:  \
	build-ws

build-ws: 
	cd ${PROJECT_DIR}/ws; \
	source /opt/ros/${ROS_DISTRO}/setup.bash; \
	colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=${BUILD_TYPE}; \

pull:
	git pull origin
	find . -type d -name .git -exec echo {} \; -exec git --git-dir={} --work-tree=${PROJECT_DIR}/{}/.. pull origin \;
