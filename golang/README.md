# golang

Golang base image with additional tools for development.

## Versions

This image is bound by the following tagging scheme to support existing applications:
```
wpengine/golang:<major-golang-version>-wpe<internal-tooling-version>
```
where `<major-golang-version>` might be Go version `1.12` and `<internal-tooling-version>` would be an integer that is incremented (independently of the major Golang version) when any bundled tools are modified in a non-backwards-compatible fashion. This enables major golang versions to be updated, while preserving the versioning of our internal tooling.

## Usage

Lint files:
```
docker run --rm \
  -v $(pwd):/go/src/${package_name} \
  -w /go/src/${package_name} \
  wpengine/golang
  golangci-lint run --no-config --issues-exit-code=0 --disable-all --enable=vet --enable=golint --enable=gofmt
```

Run unit tests:
```
docker run --rm \
  -v $(pwd):/go/src/${package_name} \
  wpengine/golang
  /bin/bash unit_tests.sh -p ${package_name}
```

Installing dependencies:
```
docker run --rm  \
  -v $(pwd):/go/src/${package_name} \
  -w /go/src/${package_name} \
  wpengine/golang
  sh -c "git config --global url.'https://$(GITHUB_TOKEN):x-oauth-basic@github.com/'.insteadOf 'https://github.com/' \
  && go mod vendor"
```

## Changelog
This changelog describes changes made specifically to the `<internal-tooling-version>`.

### \<version\>-wpe0
This is the first version utilizing the tagging scheme described above. This version contains `protobuf-compiler` and the following Go tools:
```
github.com/golang/protobuf/proto
github.com/golang/protobuf/protoc-gen-go
google.golang.org/grpc
github.com/alecthomas/gometalinter
github.com/Masterminds/glide
github.com/golang/dep/cmd/dep
github.com/jstemmer/go-junit-report
github.com/axw/gocov/gocov
github.com/AlekSi/gocov-xml
github.com/golangci/golangci-lint/cmd/golangci-lint
```
