#!/bin/bash
set -euo pipefail

# set the host user as the PHP user to avoid issues.
if [ $DOCKER_HOST_OS = "linux" ]; then
  userdel -f www-data &&\
      if getent group www-data ; then groupdel www-data; fi &&\
      groupadd -g $PHP_USER_GROUP www-data &&\
      useradd -l -u $PHP_USER_ID -g www-data www-data &&\
      install -d -m 0755 -o www-data -g www-data /home/www-data;
fi

while [ ! -f /tmp/mitmproxy/mitmproxy-ca.pem ]
do
  echo "Waiting for mitmproxy certificate to be generated"
  sleep 2
done

echo "Certificate found, installing"
mkdir -p /usr/local/share/ca-certificates/mitmproxy
cp -f /tmp/mitmproxy/mitmproxy-ca.pem /usr/local/share/ca-certificates/mitmproxy/mitmproxy-ca.crt
update-ca-certificates

exec "$@"
