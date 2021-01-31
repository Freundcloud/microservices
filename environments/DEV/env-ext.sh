#!/bin/bash

export ENV="uat"
export FACING="e"
export DOMAIN="rercloud.co.uk"
export DNS_ZONE="$ENV.$DOMAIN"
export RESOURCE_GROUP="ofg-$ENV-$FACING-aks-rg"
export INSTRUMENTATION_KEY="$(az keyvault secret show --name ofg-uat-e-core-instrumentation-key --vault-name "ofg-uat-core-kv" --query value -o tsv)"
export DOTNETENVIRONMENT_NAME="UAT-E"