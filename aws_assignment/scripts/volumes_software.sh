#!/bin/bash

set -ex 

vgchange -ay

DEVICE_FS=`blkid -o value -s TYPE ${DEVICE} || echo ""`
if [ "`echo -n $DEVICE_FS`" == "" ] ; then 
  # wait for the device to be attached
  DEVICENAME=`echo "${DEVICE}" | awk -F '/' '{print $3}'`
  DEVICEEXISTS=''
  while [[ -z $DEVICEEXISTS ]]; do
    echo "checking $DEVICENAME"
    DEVICEEXISTS=`lsblk |grep "$DEVICENAME" |wc -l`
    if [[ $DEVICEEXISTS != "1" ]]; then
      sleep 15
    fi
  done
  pvcreate ${DEVICE}
  vgcreate data ${DEVICE}
  lvcreate --name volume1 -l 100%FREE data
  mkfs.ext4 /dev/data/volume1
fi
mkdir -p /data
echo '/dev/data/volume1 /data ext4 defaults 0 0' >> /etc/fstab
mount /data

# provision software
sudo apt-get update
sudo apt-get -y install nginx

# sudo rm /var/www/html/index.nginx-debian.html
# sudo mv /tmp/html_content.html /var/www/html/index.nginx-debian.html


sudo mv /tmp/html_content.html /data/index.html
sudo sed -i '41d' /etc/nginx/sites-available/default   
sudo sed -i '41 a root /data;' /etc/nginx/sites-available/default
# make sure nginx is started
sudo service nginx restart
