#!/bin/bash

 USERNAME=$(az keyvault secret show --name rer-terraform-sp-id --vault-name "ofg-core-core-kv" --query value -o tsv)
 PASSWORD=$(az keyvault secret show --name rer-terraform-sp-password --vault-name "ofg-core-core-kv" --query value -o tsv)
 TENANT=$(az keyvault secret show --name rer-terraform-sp-tentant --vault-name "ofg-core-core-kv" --query value -o tsv)
 az login --service-principal --username $ID --password $PASSWORD --tenant $TENANT
 az aks get-credentials --name ofg-sbx-i-aks --resource-group  ofg-sbx-i-aks-rg --admin --overwrite-existing