#!/bin/bash


export NAMESPACE="ofg-$ENV-$FACING-infra"
export APPGW_NAME="$ENV-rer-$FACING-appgw"
export APPGW_SUBNET="appgwsubnet"
export CONTACT="olaf@freundcloud.com"
export AKSNAME="ofg-$ENV-$FACING-aks"
export KEYVAULT="ofg-$ENV-core-kv"
export AKS_KEYVAULT="ofg-$ENV-$FACING-kv"
export MI_RESOURCE_GROUP="ofg-$ENV-$FACING-aks-rg"
export MI_NAME="ofg-$ENV-$FACING-identity"
export IDENTITY_CLIENT_ID="$(az identity show -g $MI_RESOURCE_GROUP -n $MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query clientId -o tsv)"
export IDENTITY_RESOURCE_ID="$(az identity show -g $MI_RESOURCE_GROUP -n $MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query id -o tsv)"
export IDENTITY_ASSIGNMENT_ID="$(az role assignment create --role Reader --assignee $IDENTITY_CLIENT_ID --scope /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$MI_RESOURCE_GROUP --query id -o tsv)"
export AZURE_OPERATOR_KEYVAULT="ofg-$ENV-$FACING-kv"
export ACR="commonrercr"

#RER-CORE
if [ $FACING != "e" ];  then 
    echo "RER-CORE"
    export RER_MI_RESOURCE_GROUP="ofg-$ENV-$FACING-rer-core-rg"
    export RER_MI_NAME="$ENV-$FACING-rer-core-user-pi"
    export RER_IDENTITY_CLIENT_ID="$(az identity show -g $RER_MI_RESOURCE_GROUP -n $RER_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query clientId -o tsv)"
    export RER_IDENTITY_RESOURCE_ID="$(az identity show -g $RER_MI_RESOURCE_GROUP -n $RER_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query id -o tsv)"
    export RER_IDENTITY_ASSIGNMENT_ID="$(az role assignment create --role Contributor --assignee $RER_IDENTITY_CLIENT_ID --scope /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$RER_MI_RESOURCE_GROUP --query id -o tsv)"
else 
    echo "This is External no need for RER-CORE"
fi

#ADDRESS LOOKUP
if [ $FACING != "e" ];  then 
    echo "ADDRESS-LOOKUP"
    export AL_MI_RESOURCE_GROUP="ofg-$ENV-$FACING-address-rg"
    export AL_MI_NAME="$ENV-$FACING-address-lookup-pi"
    export AL_IDENTITY_CLIENT_ID="$(az identity show -g $AL_MI_RESOURCE_GROUP -n $AL_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query clientId -o tsv)"
    export AL_IDENTITY_RESOURCE_ID="$(az identity show -g $AL_MI_RESOURCE_GROUP -n $AL_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query id -o tsv)"
    export AL_IDENTITY_ASSIGNMENT_ID="$(az role assignment create --role Contributor --assignee $AL_IDENTITY_CLIENT_ID --scope /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$AL_MI_RESOURCE_GROUP --query id -o tsv)"
else 
    echo "This is External no need for ADDRESS-LOOKUP"
fi

if [ $FACING != "e" ];  then 
#DOCUMENT MANAGEMENT
    echo "DOCUMENT MANAGEMENT"
    export DOC_MI_RESOURCE_GROUP="ofg-$ENV-$FACING-document_management-rg"
    export DOC_MI_NAME="$ENV-$FACING-document-management-user-pi"
    export DOC_IDENTITY_CLIENT_ID="$(az identity show -g $DOC_MI_RESOURCE_GROUP -n $DOC_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query clientId -o tsv)"
    export DOC_IDENTITY_RESOURCE_ID="$(az identity show -g $DOC_MI_RESOURCE_GROUP -n $DOC_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query id -o tsv)"
    export DOC_IDENTITY_ASSIGNMENT_ID="$(az role assignment create --role Contributor --assignee $DOC_IDENTITY_CLIENT_ID --scope /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$DOC_MI_RESOURCE_GROUP --query id -o tsv)"
else 
    echo "This is External no need for DOCUMENT MANAGEMENT"
fi

#EXT WEB
echo "WEB APP"
export WA_MI_RESOURCE_GROUP="ofg-$ENV-$FACING-web-app-rg"
export WA_MI_NAME="$ENV-$FACING-web-app-user-pi"
export WA_IDENTITY_CLIENT_ID="$(az identity show -g $WA_MI_RESOURCE_GROUP -n $WA_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query clientId -o tsv)"
export WA_IDENTITY_RESOURCE_ID="$(az identity show -g $WA_MI_RESOURCE_GROUP -n $WA_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query id -o tsv)"
export WA_IDENTITY_ASSIGNMENT_ID="$(az role assignment create --role Contributor --assignee $WA_IDENTITY_CLIENT_ID --scope /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$WA_MI_RESOURCE_GROUP --query id -o tsv)"

if [ $FACING != "e" ];  then 
#COMPANIES HOUSE
    echo "COMPANIES HOUSE"
    export CH_MI_RESOURCE_GROUP="ofg-$ENV-$FACING-companies-house-rg"
    export CH_MI_NAME="$ENV-$FACING-companies-house-user-pi"
    export CH_IDENTITY_CLIENT_ID="$(az identity show -g $CH_MI_RESOURCE_GROUP -n $CH_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query clientId -o tsv)"
    export CH_IDENTITY_RESOURCE_ID="$(az identity show -g $CH_MI_RESOURCE_GROUP -n $CH_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query id -o tsv)"
    export CH_IDENTITY_ASSIGNMENT_ID="$(az role assignment create --role Contributor --assignee $CH_IDENTITY_CLIENT_ID --scope /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$CH_MI_RESOURCE_GROUP --query id -o tsv)"
else 
    echo "This is External no need for COMPANIES HOUSE"
fi

if [ $FACING != "e" ];  then 
    #COMPANIES HOUSE
    echo "ADB2CUSERSERViCE"
    export AD_MI_RESOURCE_GROUP="ofg-$ENV-$FACING-adb2c-rg"
    export AD_MI_NAME="$ENV-$FACING-adb2c-user-pi"
    export AD_IDENTITY_CLIENT_ID="$(az identity show -g $AD_MI_RESOURCE_GROUP -n $AD_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query clientId -o tsv)"
    export AD_IDENTITY_RESOURCE_ID="$(az identity show -g $AD_MI_RESOURCE_GROUP -n $AD_MI_NAME --subscription $ARM_SUBSCRIPTION_ID --query id -o tsv)"
    export AD_IDENTITY_ASSIGNMENT_ID="$(az role assignment create --role Contributor --assignee $AD_IDENTITY_CLIENT_ID --scope /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$AD_MI_RESOURCE_GROUP --query id -o tsv)"
 else 
    echo "This is External no need for ADB2CUSERSERViCE"
fi   