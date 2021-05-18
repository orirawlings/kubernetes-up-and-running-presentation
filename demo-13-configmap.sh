#! /bin/bash

cd $(dirname $0)

set -x


# Create ConfigMap and Pod
clear
cat configmaps/kuard.yaml
read
kubectl apply -f configmaps/kuard.yaml

# Port forward to pod and inspect the filesystem browser
kubectl get pods -w
kubectl port-forward pod/kuard 8080:8080
read

# Clean up
clear
kubectl delete -f configmaps/kuard.yaml

