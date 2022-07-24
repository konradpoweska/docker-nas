#!/bin/sh

docker build --tag konradpoweska/samba samba

docker stop samba
docker rm samba

docker run --name=samba --restart=always -d \
  --net=host \
  -v /media/hdd0/storage:/mnt/storage \
  -v /media/hdd0/system/config/smb.conf:/etc/samba/smb.conf:ro \
  -v samba-logs:/usr/local/samba/var \
  konradpoweska/samba

docker cp samba/setup-users.sh samba:/
gpg -d -o - users.gpg | docker exec -i samba ./setup-users.sh
