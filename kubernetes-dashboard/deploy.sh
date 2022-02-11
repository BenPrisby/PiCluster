#!/bin/bash

# Install the dashboard.
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/2.5.0/aio/deploy/recommended.yaml

# Configure the admin account.
kubectl apply -f admin-account.yaml
kubectl apply -f admin-binding.yaml

