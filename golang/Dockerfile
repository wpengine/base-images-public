FROM golang:1.8

RUN set -ex; \
    go get -u -v \
        github.com/alecthomas/gometalinter \
        github.com/Masterminds/glide \
    ; \
    gometalinter --install; \
    mv /go/bin/* /usr/local/go/bin/
