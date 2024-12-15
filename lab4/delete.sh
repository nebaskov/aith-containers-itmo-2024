#!/bin/bash

kubectl delete -f k8s/s3-secret.yaml
kubectl delete -f k8s/s3.yaml

kubectl delete -f k8s/backend-secret.yaml
kubectl delete -f k8s/backend.yaml