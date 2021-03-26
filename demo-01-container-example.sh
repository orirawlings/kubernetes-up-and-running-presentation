#! /bin/bash

cd $(dirname $0)

set -x

cat container-example/Dockerfile
read
cat container-example/my-script.sh
read
docker build -t container-example:latest container-example/
read
docker images container-example
read
docker run container-example:latest
read
docker run -it container-example:latest --
