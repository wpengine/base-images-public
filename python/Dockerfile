FROM ubuntu:focal

RUN apt update && apt install python3-pip -y
RUN pip3 install \
  docutils \
  flake8 \
  nose \
  paver \
  pbr \
  pip-tools \
  pylint \
  tox \
  ;

WORKDIR /workspace
