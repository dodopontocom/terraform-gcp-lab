#!/bin/bash

VM_EXTERNAL_IP=${1:-$(curl -H "Metadata-Flavor: Google" http://metadata/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip)}

sudo yum update -y

which java
if [[ $? -ne 0 ]]; then
  sudo yum install -y \
    java-1.8.0-openjdk \
    java-1.8.0-openjdk-devel
  export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
fi
  
sudo yum install -y curl policycoreutils-python openssh-server openssh-clients cronie lokkit
sudo lokkit -s http -s ssh

sudo yum install -y postfix
sudo service postfix start
sudo chkconfig postfix on

curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | bash
EXTERNAL_URL="http://${VM_EXTERNAL_IP}" yum install -y gitlab-ce
