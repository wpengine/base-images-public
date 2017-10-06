# helm

Image with the requirements to manage GKE / Kubernetes deploys with Helm.

https://docs.helm.sh/

## Usage

Mount a service account private key and perform and upgrade:
```
docker run \
    -v some/service_account.json:/service-account.json \
    -e GOOGLE_APPLICATION_CREDENTIALS=/service-account.json
    helm upgrade release_name
```
