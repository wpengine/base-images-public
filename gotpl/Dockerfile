FROM golang:1.9

RUN go get -v github.com/tsg/gotpl

FROM scratch

COPY --from=0 /go/bin/gotpl /usr/local/bin/gotpl

ENTRYPOINT ["/usr/local/bin/gotpl"]

