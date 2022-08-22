#!/bin/bash

arch=$(dpkg-architecture -q DEB_BUILD_ARCH)
deb=google-chrome-stable_current_${arch}.deb
wget https://dl.google.com/linux/direct/${deb}
name=`dpkg --info ./${deb}  | grep -E -o "Package: (.*)" | cut -d':' -f2`
name="${name:1}"
sudo apt-get -y purge ${name}
sudo apt-get -y autoremove
rm ${deb}
