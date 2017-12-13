FROM google/cloud-sdk

ENV DOCKER_VERSION 1.13.1-0~wheezy

RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
    echo 'deb http://http.debian.net/debian wheezy-backports main' > /etc/apt/sources.list.d/backports.list && \
    echo 'deb https://apt.dockerproject.org/repo debian-wheezy main' > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-engine=$DOCKER_VERSION
