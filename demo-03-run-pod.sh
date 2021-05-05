#! /bin/bash

cd $(dirname $0)

set -x

# Run a new pod with the kuard container image
clear
kubectl run --image=gcr.io/kuar-demo/kuard-amd64:blue kuard
kubectl get pods -w
read
echo 'Run `kubectl port-forward kuard 8080:8080` and open http://localhost:8080/'
read

# Output logs of the pod
clear
kubectl logs kuard
read

# Execute arbitrary commands inside the remote pod
clear
kubectl exec kuard -- ls /
read
kubectl exec kuard -- env
read
kubectl exec -it kuard -- /bin/sh
read

# Copy arbitrary file into the remote pod
clear
cat pod/message.txt
read
kubectl cp pod/message.txt kuard:/tmp/message.txt
read

# Delete the pod
clear
kubectl delete pod kuard
kubectl get pods

