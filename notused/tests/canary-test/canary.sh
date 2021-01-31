#!/bin/bash

kubectl -n canary-test set image deployment/podinfo-primary \
podinfod=stefanprodan/podinfo:3.1.4

kubectl -n canary-test describe canary/podinfo

watch kubectl get canaries --all-namespaces