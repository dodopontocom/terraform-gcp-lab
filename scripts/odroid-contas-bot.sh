#!/bin/bash

project_name="odroid-contas"
git_clone_url="https://github.com/dodopontocom/${project_name}.git"

#install docker
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install -y docker-ce

#clone repository for hadoop lab sample
git clone ${git_clone_url}
cd ${project_name}
echo '${DEFINITIONS}' > .definitions.sh
sudo docker build -t bot .
sudo docker run -it --name bot bot
