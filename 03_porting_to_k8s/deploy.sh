#!/usr/bin/env bash
kubectl apply -f myapp_deployment.yaml
kubectl apply -f myclient_deployment.yaml
kubectl apply -f myapp_services.yaml
