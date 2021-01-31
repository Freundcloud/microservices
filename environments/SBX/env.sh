#!/bin/bash

export ENV="sbx"
export FACING="i"
export INSTRUMENTATION_KEY=$(az keyvault secret show --name ofg-sbx-i-core-instrumentation-key --vault-name "ofg-sbx-core-kv" --query value -o tsv)
export DOTNETENVIRONMENT_NAME="SBX-I"