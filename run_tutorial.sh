#!/usr/bin/env bash

docker run -it --rm  \
       -v /var/run/docker.sock:/var/run/docker.sock \
       romilb/k8stutorial \
       /bin/bash
