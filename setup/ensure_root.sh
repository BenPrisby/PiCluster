#!/bin/bash

# Ensure we are running as sudo.
if [ ${EUID} -ne 0 ]; then
    echo "Run this script as root and try again"
    exit 1
fi

