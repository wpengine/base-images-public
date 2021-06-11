FROM ubuntu:latest

ENV GCP_KEYRING_SRC https://packages.cloud.google.com/apt/doc/apt-key.gpg

ADD ${GCP_KEYRING_SRC} /usr/share/keyrings/cloud.google.gpg
COPY google-cloud-sdk.list /etc/apt/sources.list.d/google-cloud-sdk.list

RUN chmod 0444 \
		/etc/apt/sources.list.d/google-cloud-sdk.list \
		/usr/share/keyrings/cloud.google.gpg \
	&& apt update \
	&& DEBIAN_FRONTEND=noninteractive apt install -y \
		awscli \
		docker.io \
		google-cloud-sdk \
		python3-pip \
	&& pip3 install awscliv2 \
	&& apt clean
