#!/bin/sh

docker build --tag konradpoweska/minidlna minidlna

docker stop minidlna
docker rm minidlna

docker run --name=minidlna --restart=always -d \
  --net=host \
  -v /media/hdd0/system/config/minidlna.conf:/etc/minidlna.conf:ro \
  -v /media/hdd0/storage:/mnt/storage:ro \
  -v minidlna-cache:/var/cache/minidlna \
  -v minidlna-logs:/var/log/minidlna \
  konradpoweska/minidlna
