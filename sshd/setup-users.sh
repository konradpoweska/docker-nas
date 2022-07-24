#!/bin/sh
addgroup -g 950 group1

create_user() {
  user=$1
  pass=$2
  dir=$3
  adduser $user -D -h $dir
  adduser $user group1
  echo $pass | tee - | passwd $user
}

while read line; do
  create_user $line
done

rm $0
