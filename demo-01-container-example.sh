#! /bin/bash

cd $(dirname $0)

set -x

clear
cat container-example/Dockerfile
read
cat container-example/my-script.sh
read
docker build -t container-example:latest container-example/
read && clear
docker images container-example
read && clear
docker run container-example:latest
read && clear
docker run -it container-example:latest --
