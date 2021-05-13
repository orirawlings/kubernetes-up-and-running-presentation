#! /bin/bash

cd $(dirname $0)

set -x

# Create pods with label app=kuard
clear
kubectl apply -f service/pods.yaml
read

# Create service
clear
cat service/kuard.yaml
read
kubectl apply -f service/kuard.yaml
read

kubectl get endpoints kuard -w
read

# Clean up
clear
kubectl delete -f service/{kuard,pods}.yaml

