# Google Service Catalog

## Install

```bash
helm template catalog svc-cat/catalog --namespace catalog \
   --set apiserver.storage.etcd.persistence.enabled=true \
   --set apiserver.healthcheck.enabled=false \
   --set controllerManager.healthcheck.enabled=false \
   --set apiserver.verbosity=2 \
   --set controllerManager.verbosity=2 > deployment.yaml
```
