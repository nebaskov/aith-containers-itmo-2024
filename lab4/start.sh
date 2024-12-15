#!/bin/bash

kubectl create -f k8s/s3-secret.yaml
kubectl create -f k8s/s3.yaml

kubectl create -f k8s/backend-secret.yaml
kubectl create -f k8s/backend.yaml