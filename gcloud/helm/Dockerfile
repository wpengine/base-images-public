# Builds a slim docker image for helm usage that doesn't require interacting with Tiller
# eg. helm lint, helm package, helm template
FROM alpine:latest

ARG helm_version=2.8.1

ADD https://storage.googleapis.com/kubernetes-helm/helm-v$helm_version-linux-amd64.tar.gz /

RUN apk add --update --no-cache ca-certificates && \
  tar -xzvf /helm-v$helm_version-linux-amd64.tar.gz && \
  mv /linux-amd64/helm /usr/local/bin/ && \
  rm -f /helm-v$helm_version-linux-amd64.tar.gz && \
  helm init -c

CMD ["/usr/local/bin/helm"]
