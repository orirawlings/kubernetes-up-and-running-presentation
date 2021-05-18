#! /bin/bash

cd $(dirname $0)

set -x


# Create Job
clear
cat jobs/job.yaml
read
kubectl apply -f jobs/job.yaml

# Watch the created Job
kubectl get job my-job -w
read

kubectl delete job my-job

# Create Job with parallelism
clear
cat jobs/parallel-job.yaml
read
kubectl apply -f jobs/parallel-job.yaml

# Watch the created Job
kubectl get job my-job -w
read

# Clean up
clear
kubectl delete job my-job

