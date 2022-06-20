#!/bin/sh
if [ $# -ne 1 ]; then
  echo "Usage: $0 <container_name>"
  exit 1
fi
docker network create lab &>/dev/null
docker container run -dti --net=lab --tmpfs /run --tmpfs /tmp -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name "$1" --privileged 172.31.2.198:5000/centos-init &>/dev/null
echo "$(docker container inspect -f '{{ .NetworkSettings.Networks.lab.IPAddress }}' $1) ansible_host=$1 ansible_connection=docker"
