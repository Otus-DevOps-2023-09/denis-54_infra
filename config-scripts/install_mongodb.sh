#!/bin/bash

apt update && \
apt install -y mongodb && \
systemctl enable --now mongodb
