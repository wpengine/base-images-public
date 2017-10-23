FROM golang:1.9

RUN set -ex; \
    go get -u -v \
        github.com/alecthomas/gometalinter \
        github.com/Masterminds/glide \
        github.com/golang/dep/cmd/dep \
    ; \
    gometalinter --install; \
    mv /go/bin/* /usr/local/go/bin/
