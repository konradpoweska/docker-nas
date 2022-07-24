#!/bin/sh

docker build --tag konradpoweska/samba-wsdd samba-wsdd

docker stop samba-wsdd
docker rm samba-wsdd

docker run --name=samba-wsdd --restart=always -d \
  --net=host \
  konradpoweska/samba-wsdd \
  -n RASPBERRYPI -w WORKGROUP
