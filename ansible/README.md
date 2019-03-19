# ansible

[![Docker Automated build](https://img.shields.io/docker/automated/wpengine/ansible.svg?maxAge=2592000)](https://hub.docker.com/r/wpengine/ansible/)

Ubuntu 18.04 LTS (Xenial) Docker container for Ansible playbook and role testing. Also includes the ansible-lint, testinfra, and molecule python modules.

## Usage

Linting a playbook:
```
docker run --rm \
    --volume=$(pwd)/ansible:/etc/ansible/:ro \
    wpengine/ansible ansible-lint /etc/ansible/playbook.yml
```

## Credit

Derived in part from Jeff Geerling's [geerlingguy/docker-ubuntu1604-ansible](https://github.com/geerlingguy/docker-ubuntu1604-ansible) image.
