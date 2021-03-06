#!/usr/bin/env bash
set -e

# Copy the app into the build context for Docker
cp -r ../app .

# Build the Docker image. -t specifies the tag to use.
# Change romilb to your dockerhub username
docker build -t romilb/myapp:latest .
