ARG OWNER=osrf
ARG ROS_DISTRO=humble
ARG UBUNTU_DISTRO=jammy
ARG BASE_CONTAINER=ros:${ROS_DISTRO}-desktop
ARG ROOT_CONTAINER=$OWNER/$BASE_CONTAINER 
FROM $ROOT_CONTAINER

ARG CONTAINER_PROJECT_ENV_NAME="MY_PROJECT_DIR"
ENV CONTAINER_PROJECT_ENV_NAME=${CONTAINER_PROJECT_ENV_NAME}

USER root

RUN apt-get update && apt-get -y upgrade
# dependencies for stage and stage_ros2
# RUN apt-get install -y python3-bloom python3-catkin-pkg python3-colcon-common-extensions


USER ${MY_USER}
# clone project root
RUN git config --global url."https://github.com/".insteadOf git@github.com:   && \
    git config --global url."https://".insteadOf git://   && \
    git clone git@github.com:tuw-robotics/project-tuw-release.git ${CONTAINER_PROJECT_DIR} 

RUN cd ${CONTAINER_PROJECT_DIR}  && \
    make clone   && \
    rm ~/.gitconfig
RUN git config --global url."git@github.com".insteadOf "https://github.com/":   && \
    git config --global url."git://".insteadOf "https://" 

USER root
# install project dependencies
RUN rosdep install -i --from-path ${CONTAINER_PROJECT_DIR}/ws/src --rosdistro ${ROS_DISTRO} -y

USER ${MY_USER}
# use ssl for all github repos
RUN git config --global user.email "${MY_USER}@container"
RUN git config --global user.name "${MY_USER}"
# change color in bash green -> red
RUN echo "export $CONTAINER_PROJECT_ENV_NAME=$CONTAINER_PROJECT_DIR" >> ~/.bashrc
RUN echo "if [ -f "env.sh" ]; then source env.sh; fi" >> ~/.bashrc
RUN echo "eval \`ssh-agent -s\`; ssh-add ~/.ssh/id_ed25519" >> ~/.bash_history

    
ENV TERM xterm-256color
WORKDIR ${CONTAINER_PROJECT_DIR}
ENV HOME=${MY_HOME}
CMD /bin/bash