#!/bin/bash

# Copy the token to the clipboard.
./get_token.sh | pbcopy
echo "Token copied to clipboard"

# Start the proxy if needed.
kubectl proxy &

# Open the page.
open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

