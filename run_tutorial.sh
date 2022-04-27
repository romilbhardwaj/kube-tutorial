#!/usr/bin/env bash
# Runs a new docker container or connects to an existing one.

if [ ! "$(docker ps -q -f name=k8stutorial)" ]; then
  # Container exists, check if its exited
  if [ "$(docker ps -aq -f status=exited -f name=k8stutorial)" ]; then
      # cleanup
      docker rm k8stutorial
  fi
  # run the container
  docker run -d  \
         -v /var/run/docker.sock:/var/run/docker.sock \
         --name k8stutorial \
         -p 6443:6443 \
         -p 8001:8001 \
         -p 10000:10000 \
         romilb/k8stutorial
fi

docker exec -it k8stutorial /bin/bash
