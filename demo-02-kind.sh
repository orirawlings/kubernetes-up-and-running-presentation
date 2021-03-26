#! /bin/bash

cd $(dirname $0)

set -x

which go docker
read
GO111MODULE="on" go get sigs.k8s.io/kind@v0.10.0
read
kind create cluster
read
kind load docker-image container-example:latest
