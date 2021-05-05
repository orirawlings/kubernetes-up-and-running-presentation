#! /bin/bash

cd $(dirname $0)

set -x

# Create a new, local, single-node Kubernetes cluster
clear
kind create cluster
