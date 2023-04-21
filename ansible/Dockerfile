FROM gcr.io/wpe-cr/ubuntu_bionic_golden_base:latest

ENV ANSIBLE_VERSION=2.7.9
ENV ANSIBLE_LINT_VERSION=4.1.0
ENV TESTINFRA_VERSION=2.0.0
ENV MOLECULE_VERSION=2.19.0

# Install dependencies.
RUN apt update \
    && apt install -y \
       apt-transport-https ca-certificates curl software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" \
    && apt update \
    && apt install -y --no-install-recommends \
       apt-utils \
       build-essential \
       cowsay \
       docker-ce \
       python-dev \
       python-setuptools \
       python-pip \
       software-properties-common \
       sudo \
    && pip install \
       ansible==${ANSIBLE_VERSION} \
       ansible-lint==${ANSIBLE_LINT_VERSION} \
       testinfra==${TESTINFRA_VERSION} \
       molecule==${MOLECULE_VERSION} \
       docker-py \
       junit_xml \
    && apt purge -y \
       build-essential \
       python-dev \
       apt-transport-https ca-certificates curl software-properties-common \
    && apt autoremove -y \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && rm -Rf /root/.cache/pip \
    && apt-get clean
