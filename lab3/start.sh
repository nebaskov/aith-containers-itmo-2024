#!/bin/bash

kubectl create -f ./k8s/nextcloud-secret.yaml
kubectl create -f ./k8s/postgres-secret.yaml

kubectl create -f ./k8s/postgres-pv.yaml

kubectl create -f ./k8s/postgres.yaml

kubectl create -f ./k8s/nextcloud.yaml
