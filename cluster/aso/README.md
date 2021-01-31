# Deploy Open Service Broker for Azure on the cluster

```bash
helm repo add azure https://kubernetescharts.blob.core.windows.net/azure
```

```bash
helm template osba azure/open-service-broker-azure --namespace osba \
  --set azure.subscriptionId=1AZURE_SUBSCRIPTION_ID \
  --set azure.tenantId=1AZURE_TENANT_ID \
  --set azure.clientId=1AZURE_CLIENT_ID \
  --set azure.clientSecret=1AZURE_CLIENT_SECRET \
  --set modules.minStability=EXPERIMENTAL > deployment.yaml
```

```bash
helm install aso https://github.com/Azure/azure-service-operator/raw/master/charts/azure-service-operator-0.1.0.tgz \
        --create-namespace \
        --namespace=azureoperator-system \
        --set azureSubscriptionID=$ARM_SUBSCRIPTION_ID \
        --set azureTenantID=$ARM_TENANT_ID \
        --set azureClientID=$ARM_CLIENT_ID \
        --set azureClientSecret=$ARM_CLIENT_SECRET \
        --set azureOperatorKeyvault=$AZURE_OPERATOR_KEYVAULT \
        --set image.repository="mcr.microsoft.com/k8s/azureserviceoperator:latest" > test_deployment.yaml
```
