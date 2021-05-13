#! /bin/bash

cd $(dirname $0)

set -x

# Create pods with varying labels
clear
kubectl run --image=gcr.io/kuar-demo/kuard-amd64:blue zap-prod    --labels="ver=1,app=zap,env=prod"
kubectl run --image=gcr.io/kuar-demo/kuard-amd64:blue zap-test    --labels="ver=2,app=zap,env=test"
kubectl run --image=gcr.io/kuar-demo/kuard-amd64:blue bam-prod    --labels="ver=2,app=bam,env=prod"
kubectl run --image=gcr.io/kuar-demo/kuard-amd64:blue bam-staging --labels="ver=2,app=bam,env=staging"
read

# Show created pods
clear
kubectl get pods --show-labels
read

# Query various subsets based on labels
clear
kubectl get pods --show-labels -l ver=2
read
kubectl get pods --show-labels -l ver!=2
read
kubectl get pods --show-labels -l env=prod,app=bam
read
kubectl get pods --show-labels -l 'app in (zap,bam)'
read
kubectl get pods --show-labels -l app
read
kubectl get pods --show-labels -l foobar
read
clear

# Create a pod with labels via manifest
cat labels/tik-prod.yaml
read
kubectl apply -f labels/tik-prod.yaml
read

kubectl delete pods -l 'app in (zap,bam,tik)'
