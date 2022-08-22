#!/bin/bash

wine5() {
  sudo apt -y purge wine
  sudo apt update
  sudo dpkg --remove-architecture i386
  sudo apt autoremove
}

wine6() {
  sudo apt -y purge wine-stable
  sudo apt-add-repository -y -r "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"
}

wine6
