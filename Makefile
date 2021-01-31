.ONESHELL:
SHELL=/bin/bash

.PHONY:


services-qa-internal:
	source ./environments/qa/.env-int.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-qa-i-aks-admin
	kustomize build ./cluster/ | envsubst |  kubectl apply -f -
	kubectl apply -f ./cluster/letsencrypt/namespace.yaml
	kubectl apply -f ./cluster/letsencrypt/deployment.yaml
	sleep 60
	kubectl apply -f ./cluster/letsencrypt/cluster_issuer.yaml
services-qa-internal:
	source ./environments/qa/.env-int.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-qa-i-aks-admin
	kustomize build ./services/| envsubst |  kubectl apply -f -
services-qa-external:
	source ./environments/qa/.env-ext.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-qa-e-aks-admin
	kustomize build ./cluster/ | envsubst |  kubectl apply -f -
	kubectl apply -f ./cluster/letsencrypt/namespace.yaml
	kubectl apply -f ./cluster/letsencrypt/deployment.yaml
	sleep 60
	kubectl apply -f ./cluster/letsencrypt/cluster_issuer.yaml
services-qa-external:
	source ./environments/qa/.env-ext.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-qa-e-aks-admin
	kustomize build ./services/external-web/ | envsubst |  kubectl apply -f -
cluster-uat-internal:
	source ./environments/uat/.env-int.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-uat-i-aks-admin
	kustomize build ./cluster/ | envsubst |  kubectl apply -f -
	kubectl apply -f ./cluster/letsencrypt/namespace.yaml
	kubectl apply -f ./cluster/letsencrypt/deployment.yaml
	sleep 60
	kubectl apply -f ./cluster/letsencrypt/cluster_issuer.yaml
service-uat-internal:
	source ./environments/uat/.env-int.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-uat-i-aks-admin
	kustomize build ./services/ | envsubst |  kubectl apply -f -
cluster-uat-external:
	source ./environments/uat/.env-ext.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-uat-e-aks-admin
	kustomize build ./cluster/ | envsubst |  kubectl apply -f -
	kubectl apply -f ./cluster/letsencrypt/namespace.yaml
	kubectl apply -f ./cluster/letsencrypt/deployment.yaml
	sleep 60
	kubectl apply -f ./cluster/letsencrypt/cluster_issuer.yaml
service-uat-external:
	source ./environments/uat/.env-ext.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-uat-e-aks-admin
	kustomize build ./services/external-web/ | envsubst |  kubectl apply -f -
cluster-data-internal:
	source ./environments/data/.env-int.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-data-i-aks-admin
	kustomize build ./cluster/ | envsubst |  kubectl apply -f -
	kubectl create namespace cert-manager
	kubectl apply -f ./cluster/letsencrypt/deployment.yaml
	sleep 60
	kubectl apply -f ./cluster/letsencrypt/cluster_issuer.yaml
service-data-internal:
	source ./environments/data/.env-int.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-data-i-aks-admin
	kustomize build ./services/ | envsubst |  kubectl apply -f -
cluster-data-external:
	source ./environments/data/.env-ext.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-data-e-aks-admin
	kustomize build ./cluster/ | envsubst |  kubectl apply -f -
	kubectl apply -f ./cluster/letsencrypt/namespace.yaml
	kubectl apply -f ./cluster/letsencrypt/deployment.yaml
	kubectl apply -f ./cluster/letsencrypt/cluster_issuer.yaml
service-data-external:
	source ./environments/data/.env-ext.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-data-e-aks-admin
	kustomize build ./services/external-web/ | envsubst |  kubectl apply -f -


cluster-dev-internal:
	source ./environments/dev/.env-int.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-dev-i-aks-admin
	kustomize build ./cluster/ | envsubst |  kubectl apply -f -
	kubectl apply -f ./cluster/letsencrypt/namespace.yaml
	kubectl apply -f ./cluster/letsencrypt/deployment.yaml
	sleep 60
	kubectl apply -f ./cluster/letsencrypt/cluster_issuer.yaml
service-dev-internal:
	source ./environments/dev/.env-int.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-dev-i-aks-admin
	kustomize build ./services/ | envsubst |  kubectl apply -f -
cluster-dev-external:
	source ./environments/dev/.env-ext.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-dev-e-aks-admin
	kustomize build ./cluster/ | envsubst |  kubectl apply -f -
	kubectl apply -f ./cluster/letsencrypt/namespace.yaml
	kubectl apply -f ./cluster/letsencrypt/deployment.yaml
	sleep 60
	kubectl apply -f ./cluster/letsencrypt/cluster_issuer.yaml
service-dev-external:
	source ./environments/dev/.env-ext.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-dev-e-aks-admin
	kustomize build ./services/external-web/ | envsubst |  kubectl apply -f -

