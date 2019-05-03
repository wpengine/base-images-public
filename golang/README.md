# golang

Golang base image with additional packages to assist in running unit tests.

## Usage

As a linter:

With gometalinter (deprecated 04/07/19):
```
docker run --rm \
    -v $(pwd):/go/src/${package_name} \
    -w /go/src/${package_name} \
    wpengine/golang gometalinter --vendor --disable-all --enable=golint --enable=vet --enable=gofmt ./...
```

With golangci-lint:
```
docker run --rm -v \
    -v $(pwd):/go/src/${package_name} \
    -w /go/src/${package_name} \
    wpengine/golang golangci-lint run --no-config --issues-exit-code=0 \
    --disable-all --enable=vet --enable=golint --enable=gofmt
```

Run unit tests:
```
docker run --rm -v \
    $(pwd):/go/src/${package_name} \
    wpengine/golang /bin/bash unit_tests.sh -p ${package_name}
```

Installing dependencies:
```
docker run --rm -v \
    $(pwd):/go/src/${package_name} \
    -w /go/src/${package_name} \
    wpengine/golang glide install -v
```
