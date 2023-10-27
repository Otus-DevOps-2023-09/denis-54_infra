#!/bin/bash

sudo apt update && \
sudo apt install -y ruby-full ruby-bundler build-essential

if nc -zv 127.0.0.1 9292 2>&1 | grep -q "succeeded"; then
    echo "Порт 9292 доступен"
else
    echo "Порт 9292 недоступен"
fi
