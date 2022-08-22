#!/bin/bash

# show available versions
codename=$(lsb_release -c -s)
arch=$(dpkg-architecture -q DEB_BUILD_ARCH)
curl https://download.docker.com/linux/ubuntu/dists/${codename}/pool/stable/${arch}/ | grep -o ">docker-ce_.*<"
read -p "Docker Engine? " docker_engine

curl https://download.docker.com/linux/ubuntu/dists/${codename}/pool/stable/${arch}/ | grep -o ">containerd\.io_.*<"
read -p "Containerd? " containerd

curl https://download.docker.com/linux/ubuntu/dists/${codename}/pool/stable/${arch}/ | grep -o ">docker-ce-cli_.*<"
read -p "CLI? " cli

curl https://download.docker.com/linux/ubuntu/dists/${codename}/pool/stable/${arch}/ | grep -o ">docker-compose-plugin_.*<"
read -p "Docker-Compose? " compose

wget https://download.docker.com/linux/ubuntu/dists/${codename}/pool/stable/${arch}/${docker_engine}
wget https://download.docker.com/linux/ubuntu/dists/${codename}/pool/stable/${arch}/${containerd}
wget https://download.docker.com/linux/ubuntu/dists/${codename}/pool/stable/${arch}/${cli}
wget https://download.docker.com/linux/ubuntu/dists/${codename}/pool/stable/${arch}/${compose}

sudo dpkg -i ./${cli}
sudo dpkg -i ./${containerd}
sudo dpkg -i ./${docker_engine}
sudo dpkg -i ./${compose}
sudo docker run --rm hello-world

rm ${docker_engine}
rm ${containerd}
rm ${cli}
rm ${compose}


sudo groupadd docker
sudo usermod -aG docker $USER

echo Ab- und Anmelden, damit die Berechtigung für docker übernommen werden.

