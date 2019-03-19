FROM ubuntu:16.04

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       python-software-properties \
       python-dev \
       python-setuptools \
       python-pip \
       build-essential \
       software-properties-common \
       rsyslog \
       systemd \
       systemd-cron \
       sudo \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Ensure latest pip version
RUN pip install --upgrade pip

ENV ANSIBLE_VERSION=2.7.9
ENV ANSIBLE_LINT_VERSION=4.1.0
ENV TESTINFRA_VERSION=2.0.0

# Install Ansible
RUN pip install ansible==${ANSIBLE_VERSION}

# Testing and linting requirements
RUN pip install ansible-lint==${ANSIBLE_LINT_VERSION}
RUN pip install testinfra==${TESTINFRA_VERSION}

# Disable / mock out some standard functionality that may be used in ansible roles under test
RUN sed -i 's/^\($ModLoad imklog\)/#\1/' /etc/rsyslog.conf
COPY initctl_faker .
RUN chmod +x initctl_faker && rm -fr /sbin/initctl && ln -s /initctl_faker /sbin/initctl
