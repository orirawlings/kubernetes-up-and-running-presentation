#! /bin/bash

cd $(dirname $0)

set -x

# Create a pod via a manifest file
clear
cat pod/kuard-with-probes.yaml
read
kubectl apply -f pod/kuard-with-probes.yaml
read

# Kubelet can still detect when the container exits and trigger a restart
clear
kubectl exec kuard -- kill 1
read

# Delete the pod
clear
kubectl delete pod kuard
kubectl get pods

