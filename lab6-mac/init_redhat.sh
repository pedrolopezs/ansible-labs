#!/bin/sh
if [ $# -ne 1 ]; then
  echo "Usage: $0 <container_name>"
  exit 1
fi
docker network create lab &>/dev/null
docker container run -dti --net=lab --tmpfs /tmp --name "$1" --privileged redhat/ubi9-init
echo "$(docker container inspect -f '{{ .NetworkSettings.Networks.lab.IPAddress }}' $1) ansible_host=$1 ansible_connection=docker"
