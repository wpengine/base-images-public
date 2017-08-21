FROM golang:1.8

RUN set -ex; \
    go get -u -v \
        github.com/alecthomas/gometalinter \
        github.com/Masterminds/glide \
        github.com/jstemmer/go-junit-report \
        github.com/axw/gocov/gocov \
        github.com/AlekSi/gocov-xml \
    ; \
    gometalinter --install; \
    mv /go/bin/* /usr/local/go/bin/

COPY unit_tests.sh .
