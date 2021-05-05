#! /bin/bash

cd $(dirname $0)

set -x

# Show container manifest and content
clear
cat container-example/Dockerfile
read
cat container-example/my-script.sh
read

# Build the container image with Docker
docker build -t container-example:latest container-example/
read

# Show built image and create a new container with it
clear
docker images container-example
read && clear
docker run container-example:latest
read && clear
docker run -it container-example:latest --
