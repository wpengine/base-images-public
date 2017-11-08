# New Relic PHP Daemon Docker Image
The New Relic daemon acts as a proxy between the New Relic PHP agent and the New Relic collector to reduce network traffic and to improve response time for instrumented applications. Without the daemon running, no data is reported to New Relic.

This container is intended to be run as a side car.

## Updates & Prebuilt Images

These images are are tied to specific [New Relic daemon releases](https://download.newrelic.com/php_agent/archive/), and configured as Automated builds on [Docker Hub](https://hub.docker.com/r/wpengine/newrelic-php-daemon/).

## Running
The following command runs the New Relic daemon and exposes the service on port 8004. `NR_PORT` can also contain a socket name that could be shared between containers.
```
docker run -d -e NR_PORT=8004 -p 8004:8004 wpengine/newrelic-php-daemon:7.6.0.201
```

## Building
```
docker build -t wpengine/newrelic-php-daemon .
```
