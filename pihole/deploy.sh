#!/bin/bash

# Make sure a password is available in the environment.
if [ -z "${PIHOLE_PASSWORD}" ]; then
    echo "No Pi-hole password in environment, export PIHOLE_PASSWORD=<my_password> and run this script again"
    exit 1
fi

# Add the Helm repo if needed.
helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/
helm repo update

# Create the namespace.
kubectl create namespace pihole

# Create the persistent volume and claim.
kubectl apply -f pihole-persistentvolume.yaml
kubectl apply -f pihole-persistentvolumeclaim.yaml

# Create the admin password as a secret.
kubectl create secret generic pihole-secret --from-literal="password=${PIHOLE_PASSWORD}" --namespace pihole

# Deploy the chart with the customized values.
helm upgrade --install pihole mojo2600/pihole --namespace pihole --values pihole-values.yaml

# Create the ingress.
kubectl apply -f pihole-ingress.yaml

