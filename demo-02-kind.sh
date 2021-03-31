#! /bin/bash

cd $(dirname $0)

set -x

clear
which go docker
read && clear
GO111MODULE="on" go get sigs.k8s.io/kind@v0.10.0
read && clear
kind create cluster
read
kind load docker-image container-example:latest
read
kind load docker-image gcr.io/kuar-demo/kuard-amd64:blue
