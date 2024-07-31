FROM google/cloud-sdk

ENV OS=linux
ENV ARCH=amd64
ENV TERRAFORM_VERSION=1.9.3
ENV TERRAFORM_SHA256SUM=e52520cf6d677155e69a8fcfe64054891f4d991802b0d36d4c8b670d60a7e899
ENV TERRAFORM_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${OS}_${ARCH}.zip

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y unzip jq

RUN curl -O ${TERRAFORM_URL} && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -c --strict terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN pip install awscli==1.33.33

RUN curl -s -L -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x /usr/bin/aws-iam-authenticator
