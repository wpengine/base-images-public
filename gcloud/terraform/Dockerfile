FROM google/cloud-sdk

ENV TERRAFORM_VERSION=0.10.2
ENV TERRAFORM_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y unzip

RUN curl -O ${TERRAFORM_URL} && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip