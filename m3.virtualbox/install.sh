#!/bin/bash

wget -O virtualbox.deb - https://download.virtualbox.org/virtualbox/6.1.38/virtualbox-6.1_6.1.38-153438~Ubuntu~jammy_amd64.deb

sudo apt -y install --fix-broken ./virtualbox.deb

rm -f ./virtualbox.deb
