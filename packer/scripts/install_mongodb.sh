#!/bin/bash

apt update && \
sleep 60 \
apt install -y mongodb && \
systemctl enable --now mongodb
