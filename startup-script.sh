#!/bin/bash

sudo apt update && \
sudo apt install -y ruby-full ruby-bundler build-essential git mongodb  && \
sudo systemctl enable --now mongodb && \
cd $HOME && \
git clone -b monolith https://github.com/express42/reddit.git && \
cd reddit && \
bundle install && \
puma -d && \
nc -zv 127.0.0.1 9292 \
echo "Done"
