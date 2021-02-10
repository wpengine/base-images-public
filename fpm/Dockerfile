FROM ruby:2.4.6-stretch
RUN gem install fpm -v 1.11.0\
    && apt-get update \
    && apt install -y --no-install-recommends \
       python3-pip \
    && pip3 install \
       virtualenv \
       virtualenv-tools3
WORKDIR /workspace
ENTRYPOINT ["fpm"]