#! /bin/bash

cd $(dirname $0)

# Ensure metrics-server add-on is deployed
kubectl apply -k kustomize/modules/metrics-server > /dev/null

set -x

# Create a pod with a memory limit
clear
cat pod/kuard-resources-limits.yaml
read
kubectl apply -f pod/kuard-resources-limits.yaml
read

# Delete the pod
clear
kubectl delete pod kuard
kubectl get pods

