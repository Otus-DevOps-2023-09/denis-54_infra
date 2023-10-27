#!/bin/bash

sudo apt update && \
sudo apt install -y mongodb && \
sudo systemctl enable --now mongodb
