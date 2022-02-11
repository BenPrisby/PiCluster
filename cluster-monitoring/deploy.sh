#!/bin/bash

# Create the volumes.
kubectl apply -f prometheus-persistentvolume.yaml
kubectl apply -f grafana-persistentvolume.yaml

# Clone the repo.
if [ -d cluster-monitoring ]; then
    echo "Cleaning old repository clone"
    rm -rf cluster-monitoring
fi
git clone https://github.com/carlosedp/cluster-monitoring.git

# Overwrite the configuration.
cp vars.jsonnet cluster-monitoring/

# Overwrite the utils file to add NGINX ingress annotations.
cp utils.libsonnet cluster-monitoring/

# Build the manifests.
cd cluster-monitoring
make vendor
make

# Deploy the manifests.
make deploy

