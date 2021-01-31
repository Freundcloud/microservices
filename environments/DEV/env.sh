#!/bin/bash

export ENV="dev"
export DNS_ZONE="$ENV.$DOMAIN"
export RESOURCE_GROUP="aks-demo-$ENV-aks-rg"
export INSTRUMENTATION_KEY="$(az keyvault secret show --name aks-demo-core-instrumentation-key --vault-name "aks-demo-core-kv" --query value -o tsv)"
export DOTNETENVIRONMENT_NAME="DEV"