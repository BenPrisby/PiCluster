#!/bin/bash

./ensure_root.sh

# Update and install packages.
apt update
apt upgrade -y
apt install -y vim unattended-upgrades nfs-common

# Enable kernel container features.
sed -ie "1s/$/ cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory/" /boot/cmdline.txt

# Make the mount point for the SSD.
SSD_MOUNT=/mnt/ssd
mkdir ${SSD_MOUNT}
chown -R pi:pi ${SSD_MOUNT}

