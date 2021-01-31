#!/bin/bash

export ENV="sbx"
export INSTRUMENTATION_KEY=$(az keyvault secret show --name aks-demo-sbx-core-instrumentation-key --vault-name "aks-demo-sbx-core-kv" --query value -o tsv)
export DOTNETENVIRONMENT_NAME="SBX"