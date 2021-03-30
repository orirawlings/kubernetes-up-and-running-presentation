#! /bin/bash

cd $(dirname $0)

set -x

clear
kubectl get pods
read
kubectl get namespaces
read
kubectl -n kube-system get pods
read && clear
cat kubectl-demo/my-namespace.yaml
read
kubectl apply -f kubectl-demo/my-namespace.yaml
read
kubectl get namespaces
read
kubectl get namespaces my-namespace
read && clear
kubectl get namespaces my-namespace -o yaml
read
kubectl edit namespaces my-namespace
read && clear
kubectl label namespace my-namespace awesome=true foo=bar
read
kubectl get namespaces my-namespace -o yaml
read
kubectl get namespaces -l awesome=true
read && clear
kubectl annotate namespace my-namespace ori=rawlings
read
kubectl get namespaces my-namespace -o yaml
read && clear
kubectl delete namespace my-namespace
read
kubectl get namespaces
