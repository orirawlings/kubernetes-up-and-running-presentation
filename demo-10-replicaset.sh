#! /bin/bash

cd $(dirname $0)

set -x


# Create ReplicaSet
clear
cat replicasets/kuard.yaml
read
kubectl apply -f replicasets/kuard.yaml
read

# Watch the created ReplicaSet
kubectl get replicaset kuard -w
read

# Scale up
clear
kubectl scale replicaset/kuard --replicas=10
read

# Scale down
kubectl scale replicaset/kuard --replicas=2
read

# Scale by editing manifest
kubectl edit replicaset/kuard
read

# Clean up
clear
kubectl delete -f replicasets/kuard.yaml

