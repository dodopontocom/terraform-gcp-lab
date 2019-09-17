#!/bin/bash
# ref.: https://about.gitlab.com/install/#ubuntu

#GET VIRTUAL MACHINE IP
VM_EXTERNAL_IP=$(curl -H "Metadata-Flavor: Google" http://metadata/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip
)

DEBIAN_FRONTEND=noninteractive

sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

echo "============================= GITLAB INSTALLATION =========================================="
sudo EXTERNAL_URL="https://${VM_EXTERNAL_IP}" apt-get install -y gitlab-ce
if [[ "$?" -ne 0 ]]; then
  echo "============================= RE TRYING GITLAB INSTALLATION =========================================="
  sudo dpkg --configure -a
  sudo EXTERNAL_URL="https://${VM_EXTERNAL_IP}" apt-get install -y gitlab-ce
fi
