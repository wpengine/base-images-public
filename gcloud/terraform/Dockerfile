FROM google/cloud-sdk

ENV OS=linux
ENV ARCH=amd64
ENV TERRAFORM_VERSION=1.0.2
ENV TERRAFORM_SHA256SUM=7329f887cc5a5bda4bedaec59c439a4af7ea0465f83e3c1b0f4d04951e1181f4
ENV TERRAFORM_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${OS}_${ARCH}.zip

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y unzip jq

RUN curl -O ${TERRAFORM_URL} && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -c --strict terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN pip install awscli==1.19.110

RUN curl -s -L -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x /usr/bin/aws-iam-authenticator
