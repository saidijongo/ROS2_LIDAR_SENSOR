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


#########################
''' 
cd ~/Documents/simulation_ws

# List of packages to build
packages=(
    costmap_queue
    dwb_core
    dwb_critics
    dwb_msgs
    dwb_plugins
    nav2_amcl
    nav2_behavior_tree
    nav2_behaviors
    nav2_bringup
    nav2_bt_navigator
    nav2_collision_monitor
    nav2_common
    nav2_constrained_smoother
    nav2_controller
    nav2_core
    nav2_costmap_2d
    nav2_dwb_controller
    nav2_graceful_controller
    nav2_lifecycle_manager
    nav2_map_server
    nav2_mppi_controller
    nav2_msgs
    nav2_navfn_planner
    nav2_planner
    nav2_regulated_pure_pursuit_controller
    nav2_rotation_shim_controller
    nav2_rviz_plugins
    nav2_simple_commander
    nav2_smac_planner
    nav2_smoother
    nav2_system_tests
    nav2_theta_star_planner
    nav2_util
    nav2_velocity_smoother
    nav2_voxel_grid
    nav2_waypoint_follower
    nav_2d_msgs
    nav_2d_utils
    navigation2
)

# Iterate over the packages and build each one
for pkg in "${packages[@]}"; do
    echo "Building package: $pkg"
    colcon build --symlink-install --packages-select $pkg
done

'''
###########################
