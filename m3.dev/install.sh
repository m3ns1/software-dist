#!/bin/bash

sudo apt update
sudo apt -y install build-essential
sudo apt -y install manpages-dev maven
sudo apt -y install nodejs npm

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
sudo npm install -g @angular/cli
sudo npm install npv
