# the first part of this Dockerfile is exactly the same with ros:indigo-base 
FROM ros:indigo-ros-core

# install ros packages
RUN apt-get update && apt-get install -y \
    ros-indigo-ros-base=1.1.4-0* \
    && rm -rf /var/lib/apt/lists/*
    
# install biuld-essential package
RUN apt-get install build-essential

# set flags
RUN export CMAKE_C_COMPILER=gcc-4.8 \
    && export CMAKE_CXX_COMPILER=g++-4.8

# initialize a catkin workspace
RUN mkdir -p ~/catkin_ws/src \
    && catkin_init_workspace \
    && source /opt/ros/indigo/setup.bash \
    && source ~/catkin_ws/devel/setup.bash
    
# then run container with volume
