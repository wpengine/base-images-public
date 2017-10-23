FROM golang:1.9

RUN set -ex; \
    go get -u -v -t \
        github.com/alecthomas/gometalinter \
        github.com/Masterminds/glide \
        github.com/golang/dep/cmd/dep \
        github.com/jstemmer/go-junit-report \
        github.com/axw/gocov/gocov \
        github.com/AlekSi/gocov-xml \
    ; \
    gometalinter --install; \
    mv /go/bin/* /usr/local/go/bin/

COPY unit_tests.sh .
