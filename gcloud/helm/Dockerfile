# Builds a docker image with the requirements to do kubernetes deploys with Helm
From google/cloud-sdk

ARG helm_version=2.2.1

ADD https://storage.googleapis.com/kubernetes-helm/helm-v$helm_version-linux-amd64.tar.gz /

RUN apt-get update && apt-get install -y \
  make  && \
  tar -xzvf /helm-v$helm_version-linux-amd64.tar.gz && \
  cp /linux-amd64/helm /usr/local/bin/
