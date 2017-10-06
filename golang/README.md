# golang

Golang base image with additional packages to assist in running unit tests.

## Usage

As a linter:
```
docker run --rm \
    -v $(pwd):/go/src/${package_name} \
    -w /go/src/${package_name} \
    wpengine/golang gometalinter --vendor --disable-all --enable=golint --enable=vet --enable=gofmt ./...
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
