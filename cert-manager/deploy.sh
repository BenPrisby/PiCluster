#!/bin/bash

# Add the Helm repo if needed.
helm repo add jetstack https://charts.jetstack.io
helm repo update

# Install the CRDs.
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml

# Install the chart, with prod as the default issuer..
helm upgrade --install cert-manager jetstack/cert-manager --namespace kube-system --version v1.7.1 --set ingressShim.defaultIssuerName=letsencrypt-prod --set ingressShim.defaultIssuerKind=ClusterIssuer --set ingressShim.defaultIssuerGroup=cert-manager.io

# Configure the certificate issuers.
kubectl apply -f cert-issuer-staging.yaml
kubectl apply -f cert-issuer-prod.yaml

