#!/bin/bash

echo "=============== START - MOUNT PERSISTENT DISK ==============="

mount_point="/data"
ssd_by_id="google-${TF_VAR_ssd_name}"

[[ ! -d ${mount_point} ]] && sudo mkdir ${mount_point}
sudo mount /dev/disk/by-id/${ssd_by_id} ${mount_point}
if [[ $? -ne 0 ]]; then
  echo "Formatting persistent disk."
  mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/disk/by-id/${ssd_by_id}
  echo "Creating influxdb folder to be used in persistent disk."
  echo "Mounting point for persistent disk."
  echo UUID=$(sudo blkid -s UUID -o value /dev/disk/by-id/${ssd_by_id}) ${mount_point} ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab
  sudo mount ${mount_point}
else
  echo "Adding mounted point to system initialization."
  echo UUID=$(sudo blkid -s UUID -o value /dev/disk/by-id/${ssd_by_id}) ${mount_point} ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab
  sudo mount ${mount_point}
fi

echo "=============== END - MOUNT PERSISTENT DISK ==============="
