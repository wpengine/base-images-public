FROM ubuntu:18.04

ENV PATH="/opt/pyenv/bin:/opt/pyenv/shims:$PATH"
ENV PYENV_ROOT="/opt/pyenv"
ENV PYTHON_VERSION="3.10.0"
ENV INITRD No
ENV DEBIAN_FRONTEND noninteractive
# Need for pip-tools and to test scripts with click
ENV LC_ALL C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && \
  apt-get install -y \
  make \
  build-essential \
  # required for building ruby
  libffi-dev \
  # required for python cryptography, which is required for ansible
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  wget \
  curl \
  llvm \
  libncurses5-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  liblzma-dev \
  python-openssl \
  git

RUN git clone https://github.com/pyenv/pyenv.git /opt/pyenv && \
    pyenv install $PYTHON_VERSION && \
    eval "$(pyenv init -)" && \
    pyenv local 3.10.0


