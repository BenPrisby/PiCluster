#!/bin/bash

./ensure_root.sh

./do_base_setup.sh

# Mount the SSD on boot.
printf "\n# Kubernetes disk\nUUID=c4839cd6-522d-4d9c-8b68-2aa8e86150db /mnt/ssd ext4 defaults 0 0\n" >> /etc/fstab

# Install the NFS server.
apt install -y nfs-kernel-server

# Share the SSD via NFS.
printf "\n/mnt/ssd *(rw,no_root_squash,insecure,async,no_subtree_check,anonuid=1000,anongid=1000)\n" >> /etc/exports
exportfs -ra

# Don't deploy the default load balancer or proxy.
export INSTALL_K3S_EXEC=" --no-deploy servicelb --no-deploy traefik"

# Install the service.
./run_k3s_installer.sh

# Print the token used for setting up workers.
TOKEN=$(</var/lib/rancher/k3s/server/node-token)
echo "Master token:  ${TOKEN}"
echo "   Worker node setup:"
echo "   export K3S_TOKEN=\"${TOKEN}\""

# Signal that a reboot is required.
echo "Reboot the system when ready"

