#!/bin/bash

SSD_MOUNT=/mnt/ssd
PROMETHEUS_MOUNT=${SSD_MOUNT}/prometheus
GRAFANA_MOUNT=${SSD_MOUNT}/grafana

if [ ! -d ${SSD_MOUNT} ]; then
    echo "SSD not mounted"
    exit 1
fi

sudo mkdir -p ${PROMETHEUS_MOUNT}
sudo mkdir -p ${GRAFANA_MOUNT}
sudo chown -R 1000:0 ${PROMETHEUS_MOUNT}
sudo chown -R 472:472 ${GRAFANA_MOUNT}

