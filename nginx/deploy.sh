#!/bin/bash

# Add the Helm repo if needed.
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

# Install the chart.
helm upgrade --install nginx-ingress nginx-stable/nginx-ingress --namespace ingress-nginx --create-namespace --set defaultBackend.enabled=false --set controller.setAsDefaultIngress=true

