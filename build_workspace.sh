#!/bin/bash

# Source ROS setup.bash
source /opt/ros/humble/setup.bash

# List of ROS packages to check
packages=("nav2_util" "nav2_simple_commander" "test_msgs")

# Loop through each package and check if it's installed
for pkg in "${packages[@]}"; do
    if ! dpkg -l | grep -q "ros-humble-$pkg"; then
        echo "Package $pkg is missing. Installing..."
        sudo apt install ros-humble-$pkg
    else
        echo "Package $pkg is already installed."
    fi
done

# Update rosdep
rosdep update

# Build the workspace
colcon build --symlink-install

#terminal cmd
#./build_workspace.sh
#chmod +x build_workspace.sh
