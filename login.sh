#!/bin/bash
az login --service-principal --username $ID --password $PASSWORD --tenant $TENANT
az aks get-credentials --name ofg-sbx-i-aks --resource-group  ofg-sbx-i-aks-rg --admin --overwrite-existing