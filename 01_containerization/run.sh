#!/usr/bin/env bash
# Runs your docker container with port 8000 published

# Change romilb to your dockerhub username
docker run -it --rm -p 8000:8000 romilb/myapp:latest
