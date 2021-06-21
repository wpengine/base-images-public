FROM ubuntu:latest

ENV AWS_CLI_V2_ZIP_SRC https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
ENV AWS_CLI_V2_ZIP_TDIR /usr/local/src
ENV AWS_CLI_V2_ZIP_TFILE awscli-exe-linux-x86_64.zip
ENV GCP_KEYRING_SRC https://packages.cloud.google.com/apt/doc/apt-key.gpg
ENV GCP_KEYRING_TGT /usr/share/keyrings/cloud.google.gpg

ADD ${GCP_KEYRING_SRC} ${GCP_KEYRING_TGT}
ADD ${AWS_CLI_V2_ZIP_SRC} ${AWS_CLI_V2_ZIP_TDIR}/${AWS_CLI_V2_ZIP_TFILE}
COPY google-cloud-sdk.list /etc/apt/sources.list.d/google-cloud-sdk.list

RUN chmod 0444 \
		/etc/apt/sources.list.d/google-cloud-sdk.list \
		${GCP_KEYRING_TGT} \
	&& apt update \
	&& DEBIAN_FRONTEND=noninteractive apt install -y \
		awscli \
		docker.io \
		google-cloud-sdk \
		groff \
		libc6 \
		python3-pip \
		unzip \
	&& cd ${AWS_CLI_V2_ZIP_TDIR} \
	&& unzip ${AWS_CLI_V2_ZIP_TFILE} \
	&& ${AWS_CLI_V2_ZIP_TDIR}/aws/install \
	&& apt clean
