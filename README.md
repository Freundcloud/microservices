# Introduction

This repo contains infrastructure as code to install DevOps microservices which support the CI\CD pipeline. These include:

- LetsEncrypt
- Linkerd
- Flagger
- nginx
- External DNS
- MIC

 

## LetsEncrypt

Cert management

## Linkerd

Service mesh, similar to istio, but simpler implementation  
Provides portal to show network traffic between services  

````bash
linkerd dashboard
````

## Flagger

Enables blue green and canary deployments  
Can deploy to a percentage of pods, reroute to new pods then migrate fully or revert as appropriate

## Nginx

Ingress Control Manager

## Kustomize

Facilitates 'environment substitution' to allow environment appropriate config values to be inserted into YAML file

Example:

````bash
kustomize build ./services | envsubst | kubectl apply -f -
````


## RER Services

All services are to be found inside the "Services" folder.

Each service includes:

    1. Azure Identity
    2. Azure Identity Binding
    3. Namespace config.
    4. Service
    5. Deployment


## Environments Folder 

This folder holds all the .env file for each environment used by RER.

````
env-ext = External
env-int = Internal
````

env-all.sh set environment vars for every cluster and has to be run first.

## Manually run from you workstation

Use the Makefile

Example:

```bash
make services-qa-internal
```

## Login to the environment

Make sure that You have access to the keyvault "ofg-core-core-kv"

````bash

 USERNAME=$(az keyvault secret show --name rer-terraform-sp-id --vault-name "ofg-core-core-kv" --query value -o tsv)
 PASSWORD=$(az keyvault secret show --name rer-terraform-sp-password --vault-name "ofg-core-core-kv" --query value -o tsv)
 TENANT=$(az keyvault secret show --name rer-terraform-sp-tentant --vault-name "ofg-core-core-kv" --query value -o tsv)
 az login --service-principal --username $ID --password $PASSWORD --tenant $TENANT
 az aks get-credentials --name ofg-sbx-i-aks --resource-group  ofg-sbx-i-aks-rg --admin --overwrite-existing
 kubectl get node
````

Each K8s cluster has it's own:

1. Clusteradmin group: ofg-$env-i-aks-clusteradmin / ofg-$env-e-aks-clusteradmin
1. Cluster users group: ofg-$env-i-aks-users / ofg-$env-e-aks-users

## Running code locally:

This is an example for "data" subscription and set for "external" fencing cluster. Please adapt where needed.

````bash
#!/bin/bash

az account set --subscription "231b7368-bbed-4b1b-9ab7-460b5393260b"

export ENV="data"
export FACING="e"
export ARM_SUBSCRIPTION_ID=$(az keyvault secret show --name subscription-id --vault-name "ofg-data-core-kv" --query value -o tsv) 
export ARM_CLIENT_ID=$(az keyvault secret show --name client-id --vault-name "ofg-data-core-kv" --query value -o tsv)
export ARM_CLIENT_SECRET=$(az keyvault secret show --name client-secret --vault-name "ofg-data-core-kv" --query value -o tsv) 
export ARM_TENANT_ID="1e432686-1607-4e46-a624-f57fd6fcf3f3"
export DOMAIN="rercloud.co.uk"
export DNS_ZONE="$ENV.$DOMAIN"
export RESOURCE_GROUP="ofg-$ENV-$FACING-aks-rg"
export INSTRUMENTATION_KEY=$(az keyvault secret show --name ofg-data-core-e-instrumentation-key --vault-name "ofg-data-core-kv" --query value -o tsv)
export DOTNETENVIRONMENT_NAME="DATA-E"
````
