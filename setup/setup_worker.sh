#!/bin/bash

./ensure_root.sh

# Ensure the master token is available.
if [ -z "${K3S_TOKEN}" ]; then
    echo "No token specified, export K3S_TOKEN=<token> and run this script again."
    exit 1
fi

./do_base_setup.sh

# Mount the shared SSD on boot.
printf "\n# Kubernetes disk\n10.20.0.10:/mnt/ssd /mnt/ssd nfs rw 0 0\n" >> /etc/fstab

# Point to the master node (token in environment).
export K3S_URL="https://10.20.0.10:6443"

# Install the agent.
./run_k3s_installer.sh

# Signal that a reboot is required.
echo "Reboot the system when ready"

