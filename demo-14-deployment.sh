#! /bin/bash

cd $(dirname $0)

set -x


# Create Deployment
clear
cat deployments/kuard.yaml
read
kubectl apply -f deployments/kuard.yaml

# Inspect created resources
kubectl get deployments
kubectl get replicasets
kubectl get pods
read

# Upgrade the container image of Deployment to a new version
kubectl set image deployment/kuard kuard=gcr.io/kuar-demo/kuard-amd64:green --record

# Track the status of the rolling update
kubectl rollout status deployment/kuard
read

# Inspect the history of changes to the Deployment
kubectl rollout history deployment/kuard
read

# Do a rolling restart of pods in the Deployment
kubectl rollout restart deployment/kuard
kubectl rollout history deployment/kuard
read

# Rollback to an older version
kubectl rollout undo deployment/kuard --to-revision=1
kubectl rollout history deployment/kuard
read

# Clean up
clear
kubectl delete deployment kuard

