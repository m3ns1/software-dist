#!/bin/bash


sudo apt-get -y install libappindicator1 libgconf-2-4

url="https://github.com/keeweb/keeweb/releases/download/v1.18.7/KeeWeb-1.18.7.linux.x64.deb"
wget -O keeweb.deb ${url}
sudo dpkg -i ./keeweb.deb
rm ./keeweb.deb

sudo mv ./keeweb.desktop /usr/share/applications/keeweb.desktop
