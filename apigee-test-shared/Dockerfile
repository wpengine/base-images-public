FROM node:7

ARG VERSION=1.0.0

WORKDIR /code/src
COPY package.json .
COPY package-lock.json .
COPY  test.sh ./bin/test.sh
RUN npm install
