#!/bin/bash
set -euo pipefail

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
