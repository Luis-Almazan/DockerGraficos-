#!/bin/bash

echo "Inicia Fedora"
#construir la imagen
docker build -f fedora/Dockerfile -t img_fedora:latest .

docker rm -f srv_fedora

docker run -itd \
  --privileged \
  --cgroupns=host \
  --name srv_fedora \
  --hostname srv_fedora \
  -p 5902:5901 \
  --network net_30 \
  --ip 30.0.0.35 \
  -v /sys/fs/cgroup:/sys/fs/cgroup:rw \
  --tmpfs /run \
  --tmpfs /run/lock \
  img_fedora:latest\
  /sbin/init

sleep 2
#systemctl enable gdm --now
docker exec -it srv_fedora systemctl enable gdm --now

docker restart srv_fedora
