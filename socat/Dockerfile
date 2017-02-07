FROM alpine:latest
MAINTAINER devops@wpengine.com

RUN apk add --update socat

ENV LISTEN_PROTO=TCP4 \
    LISTEN_PORT=11211 \
    TARGET_SOCK=/socket

CMD socat $LISTEN_PROTO-LISTEN:$LISTEN_PORT,bind=127.0.0.1,reuseaddr,fork,su=nobody,range=127.0.0.1/8,unlink-close=0 UNIX-CLIENT:$TARGET_SOCK

