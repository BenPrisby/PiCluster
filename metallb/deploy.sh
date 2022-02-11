#!/bin/bash

# Add the Helm repo if needed.
helm repo add metallb https://metallb.github.io/metallb
helm repo update

# Install the chart with the custom values.
helm upgrade --install metallb metallb/metallb --namespace metallb-system --create-namespace -f metallb-values.yaml

