FROM maven:3.6.0-jdk-11

ARG MAVEN_VERSION=3.6.0
ARG USER_HOME_DIR="/root"
ARG SHA=fae9c12b570c3ba18116a4e26ea524b29f7279c17cbaadc3326ca72927368924d9131d11b9e851b8dc9162228b6fdea955446be41207a5cfc61283dd8a561d2f
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries
ARG APIGEE_ENV
ARG APIGEE_USERNAME
ARG APIGEE_PASSWORD
ARG APIGEE_ORG

WORKDIR /xmlroot
COPY ./shared-pom.xml /shared-xml/shared-pom.xml
CMD ["sh", "-c", "cp /shared-xml/shared-pom.xml /xmlroot && mvn install -P${APIGEE_ENV} -Dusername=${APIGEE_USERNAME} -Dpassword=${APIGEE_PASSWORD} -Dorg=${APIGEE_ORG}; rm /xmlroot/shared-pom.xml"]
