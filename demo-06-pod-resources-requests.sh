#! /bin/bash

cd $(dirname $0)

set -x

# Create a pod that requests more CPU and memory than is available in cluster
clear
cat pod/kuard-requests-too-much.yaml
read
kubectl apply -f pod/kuard-requests-too-much.yaml
read

clear
kubectl describe pod kuard
read

# Delete the pod
clear
kubectl delete pod kuard
kubectl get pods

