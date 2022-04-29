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
         --net host \
         -v /var/run/docker.sock:/var/run/docker.sock \
         --name k8stutorial \
         romilb/k8stutorial:latest
fi

docker exec -it k8stutorial /bin/bash
