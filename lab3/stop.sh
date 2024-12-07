#!/bin/bash

kubectl delete -f ./k8s/nextcloud.yaml

kubectl delete -f ./k8s/postgres.yaml

kubectl delete -f ./k8s/postgres-secret.yaml

kubectl delete -f ./k8s/nextcloud-secret.yaml
