#!/bin/bash

curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sudo sh /tmp/get-docker.sh

sudo groupadd docker
sudo usermod -aG docker $USER

echo Ab- und Anmelden, damit die Berechtigung für docker übernommen werden.

