#!/usr/bin/env bash

kubectl apply -f dashboard.yaml
echo "Dashboard installed, please run 'kubectl proxy' and visit http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/node?namespace=default"
kubectl proxy
