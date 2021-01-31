export ACR_NAME=commonrercr.azurecr.io
export ACR_UNAME=$(az acr credential show -n $ACR_NAME --query="username" -o tsv --subscription 1dda66b2-2d18-40b8-98c4-6fb5471bdbea )
export ACR_PASSWD=$(az acr credential show -n $ACR_NAME --query="passwords[0].value" -o tsv --subscription 1dda66b2-2d18-40b8-98c4-6fb5471bdbea)
kubectl create secret docker-registry acr-secret \
  --docker-server=$ACR_NAME \
  --docker-username=$ACR_UNAME \
  --docker-password=$ACR_PASSWD \
  --docker-email=olaf.freund@ofgem.gov.uk