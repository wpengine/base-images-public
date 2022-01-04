FROM python:3.10.1-slim-bullseye

WORKDIR /workspace/
COPY requirements-ansible.txt ansible-requirements.yml /workspace/
COPY make_dython_shims.sh /root/

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install --no-install-recommends -y gcc sshpass git openssh-client libhdf5-dev libssl-dev libffi-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean &&\
    pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements-ansible.txt && \
    ansible-galaxy collection install -r ansible-requirements.yml && \
    rm -rf /root/.cache/pip


WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]
