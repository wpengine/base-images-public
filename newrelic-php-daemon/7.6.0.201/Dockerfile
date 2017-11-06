FROM alpine:3.6

ENV NR_PORT /tmp/.newrelic.sock

ENV NR_VERSION=7.6.0.201
ENV NR_FILE_NAME=newrelic-php5-$NR_VERSION-linux-musl
ENV NR_FILE_URL=https://download.newrelic.com/php_agent/archive/$NR_VERSION/$NR_FILE_NAME.tar.gz

RUN set -ex; \
    apk --no-cache add curl; \
    curl --connect-timeout 10 -o nr.tar.gz -fSL $NR_FILE_URL; \
    tar -xf nr.tar.gz; \
    cp $NR_FILE_NAME/daemon/newrelic-daemon.x64 /usr/local/bin/newrelic-daemon; \
    mkdir -p /var/log/newrelic; \
    rm -rf newrelic-php5* nr.tar.gz;

CMD ["sh", "-c", "/usr/local/bin/newrelic-daemon -f --port ${NR_PORT}"]
