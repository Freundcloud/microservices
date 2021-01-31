.ONESHELL:
SHELL=/bin/bash

.PHONY:





cluster-dev:
	source ./environments/dev/.env-int.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-dev-i-aks-admin
	kustomize build ./cluster/ | envsubst |  kubectl apply -f -
	kubectl apply -f ./cluster/letsencrypt/namespace.yaml
	kubectl apply -f ./cluster/letsencrypt/deployment.yaml
	sleep 60
	kubectl apply -f ./cluster/letsencrypt/cluster_issuer.yaml
service-dev:
	source ./environments/dev/.env-int.sh
	source ./environments/env-all.sh
	kubectl config use-context ofg-dev-i-aks-admin
	kustomize build ./services/ | envsubst |  kubectl apply -f -

