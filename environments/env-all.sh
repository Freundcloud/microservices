#!/bin/bash


export NAMESPACE="aks-demo-$ENV-infra"
export APPGW_NAME="$ENV-appgw"
export APPGW_SUBNET="appgwsubnet"
export CONTACT="olaf@freundcloud.com"
export AKSNAME="aks-demo-$ENV-aks"
export KEYVAULT="aks-demo-$ENV-core-kv"
export AKS_KEYVAULT="aks-demo-$ENV-kv"
export MI_RESOURCE_GROUP="aks-demo-$ENV-aks-rg"
export MI_NAME="aks-demo-$ENV-identity"
export IDENTITY_CLIENT_ID="$(az identity show -g $MI_RESOURCE_GROUP -n $MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query clientId -o tsv)"
export IDENTITY_RESOURCE_ID="$(az identity show -g $MI_RESOURCE_GROUP -n $MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query id -o tsv)"
export IDENTITY_ASSIGNMENT_ID="$(az role assignment create --role Reader --assignee $IDENTITY_CLIENT_ID --scope /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$MI_RESOURCE_GROUP --query id -o tsv)"
export AZURE_OPERATOR_KEYVAULT="aks-demo-$ENV-kv"
export ACR=""