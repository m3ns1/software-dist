#!/bin/bash

arch=$(dpkg-architecture -q DEB_BUILD_ARCH)
deb=google-chrome-stable_current_${arch}.deb
wget https://dl.google.com/linux/direct/${deb}
sudo dpkg -i ${deb}
rm ${deb}
