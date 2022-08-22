#!/bin/bash

sudo apt-get -y purge libappindicator1 libgconf-2-4
sudo apt-get -y autoremove
sudo dpkg -r keeweb-desktop
sudo rm -f /usr/share/applications/keeweb.desktop
