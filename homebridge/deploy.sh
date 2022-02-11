#!/bin/bash

# Create the namespace.
kubectl create namespace homebridge

# Create the persistent volume and claim.
kubectl apply -f homebridge-persistentvolume.yaml
kubectl apply -f homebridge-persistentvolumeclaim.yaml

# Deploy the app.
kubectl apply -f homebridge-values.yaml
kubectl apply -f homebridge.yaml
kubectl apply -f homebridge-service.yaml

# Create the ingress.
kubectl apply -f homebridge-ingress.yaml

