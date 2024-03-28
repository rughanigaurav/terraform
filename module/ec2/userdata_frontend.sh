#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install caddy -y
sudo apt install supervisor -y
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt update
sudo apt-get install -y nodejs
