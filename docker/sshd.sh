#!/bin/sh

docker build --tag konradpoweska/sshd sshd

docker stop sshd
docker rm sshd

docker run --name=sshd \
  --restart=always -d \
  --network host \
  -v /media/hdd0/storage:/mnt/storage \
  konradpoweska/sshd

docker cp sshd/setup-users.sh sshd:/
gpg -d -o - users.gpg | docker exec -i sshd /setup-users.sh
