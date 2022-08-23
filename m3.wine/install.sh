#!/bin/bash

sudo dpkg --add-architecture i386
sudo apt update

wine5() {
  sudo apt -y install wine64 wine32 winbind
}

wine6() {
  wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
  sudo apt-add-repository -y "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"
  sudo apt -y install --install-recommends wine-stable
}

wine5

wine --version
winecfg
