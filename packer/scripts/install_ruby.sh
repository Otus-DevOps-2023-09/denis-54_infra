#!/bin/bash
sudo apt update
echo Waiting for apt-get to finish...
a=1; while [ -n "$(pgrep apt-get)" ]; do echo $a; sleep 1s; a=$(expr $a + 1); done
sudo apt install -y ruby-full ruby-bundler build-essential

