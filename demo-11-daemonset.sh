#! /bin/bash

cd $(dirname $0)

set -x


# Create DaemonSet
clear
cat daemonsets/kuard.yaml
read
kubectl apply -f daemonsets/kuard.yaml
read

# Watch the created ReplicaSet
kubectl get daemonset kuard -w
read

# Update Node selector to match existing node
clear
cat daemonsets/kuard-with-node-selector-matches.yaml
read
kubectl apply -f daemonsets/kuard-with-node-selector-matches.yaml
read

# Update Node selector to not match existing node
clear
cat daemonsets/kuard-with-node-selector-not-matches.yaml
read
kubectl apply -f daemonsets/kuard-with-node-selector-not-matches.yaml
read

# Clean up
clear
kubectl delete daemonset kuard

