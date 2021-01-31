# Self signed SSL certificates for the cluster

## Create the certificate

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out emojivoto-aks-qa-corp-ingress-tls.crt \
    -keyout emojivoto-aks-qa-corp-ingress-tls.key \
    -subj "/CN=emojivoto.aks.qa.rer.ofgem.corp/O=emojivoto-aks-qa-corp-ingress-tls"
```

## Create k8s secret for the certificate

```bash
kubectl create secret tls emojivoto-aks-qa-corp-ingress-tls \
    --namespace emojivoto \
    --key emojivoto-aks-qa-corp-ingress-tls.key \
    --cert emojivoto-aks-qa-corp-ingress-tls.crt
```
