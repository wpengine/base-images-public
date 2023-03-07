FROM google/cloud-sdk

ENV OS=linux
ENV ARCH=amd64
ENV TERRAFORM_VERSION=0.15.3
ENV TERRAFORM_SHA256SUM=5ce5834fd74e3368ad7bdaac847f973e66e61acae469ee86b88da4c6d9f933d4
ENV TERRAFORM_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${OS}_${ARCH}.zip
ENV USE_GKE_GCLOUD_AUTH_PLUGIN=True

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y unzip jq

RUN curl -O ${TERRAFORM_URL} && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -c --strict terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN pip install awscli==1.16.126

RUN curl -s -L -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x /usr/bin/aws-iam-authenticator
