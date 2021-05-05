#! /bin/bash

cd $(dirname $0)

set -x

# Create a pod via a manifest file
clear
cat pod/kuard.yaml
read
kubectl apply -f pod/kuard.yaml
read
echo 'Run `kubectl port-forward kuard 8080:8080` and open http://localhost:8080/'
read

# Delete the pod
clear
kubectl delete pod kuard

