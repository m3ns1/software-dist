#!/bin/bash

curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sudo sh /tmp/get-docker.sh

dc=`which docker-compose`

sudo newgrp docker
sudo usermod -aG docker $USER
sudo chgrp docker $dc
sudo chmod 750 $dc

echo Ab- und Anmelden, damit die Berechtigung für docker übernommen werden.

