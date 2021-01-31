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
