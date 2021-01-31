#!/bin/bash

az ad sp create-for-rbac -n "ofg-$ENV-azure-service-operator" --role contributor \
    --scopes /subscriptions/$ARM_SUBSCRIPTION_ID