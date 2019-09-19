#!/bin/bash
#
#ref.: https://github.com/dodopontocom/hadoop-cluster-docker.git
#

#install docker
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install -y docker-ce

#clone repository for hadoop lab sample
git clone https://github.com/dodopontocom/hadoop-cluster-docker.git
cd hadoop-cluster-docker
sudo docker build -t hadoop .
sudo /bin/bash start-container.sh hadoop
