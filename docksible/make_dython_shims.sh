#!/usr/bin/env bash

set -e

if [ -f /.dockerenv ]; then
    mkdir -p /opt/dyton;

    for filename in $(ls -I __* /usr/local/bin/); do
      echo docker run --rm -v \$\(pwd\):/host -v /opt:/opt -v /etc/wpengine/wpe.cnf:/etc/wpengine/wpe.cnf  -v /etc/wpengine/cm:/etc/wpengine/cm -v /etc/ansible:/etc/ansible -v /etc/cluster-type:/etc/cluster-type  -v ~/$
    done ;
    chmod +x /opt/dyton/*
else
    echo "It has to be executed insice docker container";
fi
