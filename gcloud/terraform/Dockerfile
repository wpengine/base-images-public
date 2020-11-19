FROM google/cloud-sdk

ENV TERRAFORM_VERSION=0.12.21
ENV TERRAFORM_SHA256SUM=ca0d0796c79d14ee73a3d45649dab5e531f0768ee98da71b31e423e3278e9aa9
ENV TERRAFORM_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y unzip jq

RUN curl -O ${TERRAFORM_URL} && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -c --strict terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.1.2.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sh ./aws/install
