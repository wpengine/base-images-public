# Apigee Deploy Container
Docker image used for pushing XML API specifications to Apigee.

## Building the container
```
$ docker build -t apigee-build .
```

## Running locally on osx
Here's an example:
```
export REDIS_NAMESPACE='staging'
export APIGEE_ENV='test'
export APIGEE_ORG='ericadams-eval'
export APIGEE_USERNAME='eric.adams@wpengine.com'
export APIGEE_PASSWORD='<PASSWORD>'
export XML_ROOT='/Users/eric.adams/code/OAuth2-Proxy/src/gateway/proxies/oauth2-proxy'

docker-compose build
docker-compose up
```

## Using this to deploy your project

Create a pom.xml that looks like this:
```xhtml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>parent-pom</artifactId>
        <groupId>apigee</groupId>
        <version>1.0</version>
        <relativePath>./shared-pom.xml</relativePath>
    </parent>

    <modelVersion>4.0.0</modelVersion>
    <groupId>apigee</groupId>
    <artifactId>oidc-discovery</artifactId>
    <version>1.0</version>
    <name>oidc-discovery</name>
    <packaging>pom</packaging>
</project>
```

Change oidc-discovery to the name of your project. 