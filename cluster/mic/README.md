# Azure Pod Identity

## Installation: 

This code installes Pod Identity for AKS
should be run like this:

`export IDENTITY_CLIENT_ID="$(az identity show -g $RESOURCE_GROUP -n $IDENTITY_NAME --subscription $ARM_SUBSCRIPTION_ID --query clientId -otsv)"`
`export IDENTITY_RESOURCE_ID="$(az identity show -g $RESOURCE_GROUP -n $IDENTITY_NAME --subscription $ARM_SUBSCRIPTION_ID --query id -otsv)"`
`export IDENTITY_ASSIGNMENT_ID="$(az role assignment create --role Reader --assignee $IDENTITY_CLIENT_ID --scope /subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP --query id -otsv)"`

`kustomize build ./mic | envsubst | kubectl apply -f -`

You can run the test pod to verify if the mic service is running correctly.

`kubectl apply -f test.yaml`

Then verify with:

`kubectl logs demo`

Clean up by using:

`kubectl delete pod demo`
`kubectl delete azureidentity $IDENTITY_NAME`
`kubectl delete azureidentitybinding $IDENTITY_NAME-binding`
`az role assignment delete --id $IDENTITY_ASSIGNMENT_ID`
`az identity delete -g $RESOURCE_GROUP -n $IDENTITY_NAME`

## Remember: 

The NMI pods modify the nodes' iptables to intercept calls to IMDS endpoint within a node. This allows NMI to insert identities assigned to a pod before executing the request on behalf of the caller.
