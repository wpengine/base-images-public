FROM golang:1.14.2

ENV GO111MODULE=on

RUN set -ex; \
    apt-get update && apt-get install -y --no-install-recommends \
        protobuf-compiler \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    go get -u -v -t \
        github.com/golang/protobuf/proto \
        github.com/golang/protobuf/protoc-gen-go \
        google.golang.org/grpc \
    ;

RUN set -ex; \
    go get -u -v -t \
        github.com/jstemmer/go-junit-report \
        github.com/axw/gocov/gocov \
        github.com/AlekSi/gocov-xml \
        github.com/golangci/golangci-lint/cmd/golangci-lint \
    ; \
    mv /go/bin/* /usr/local/go/bin/

COPY unit_tests.sh .
