# golang

Golang base image with additional tools for development.

## Versions

This image is versioned by the following tagging scheme to support existing applications:
```
wpengine/golang:<major-golang-version>-wpe<toolset-version>
```
where `<major-golang-version>` might be Go version `1.12` and `<toolset-version>` would be an integer that is incremented (independently of the major Golang version) when any bundled tools are modified in a non-backwards-compatible fashion. This enables major golang versions to be updated, while preserving the versioning of our tooling dependencies.

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
  bash -c "gocov test ./... | gocov report"
```

Run unit tests with coverage:
```
mkdir -p ./artifacts/
docker run --rm --volume `pwd`/artifacts:/go/src/$(package_name)/artifacts wpengine/golang \
  bash -c "go test ./... -coverprofile=artifacts/coverage.out -v 2>&1 | tee artifacts/test-results.out"
docker run --rm --volume `pwd`/artifacts:/go/src/$(package_name)/artifacts wpengine/golang \
  bash -c "cat artifacts/test-results.out | go-junit-report -set-exit-code > artifacts/junit.xml"
docker run --rm --volume `pwd`/artifacts:/go/src/$(package_name)/artifacts wpengine/golang \
  bash -c "gocov convert ./artifacts/coverage.out | gocov-xml > ./artifacts/coverage.xml"

```

Install dependencies:
```
docker run --rm  \
  -v $(pwd):/go/src/${package_name} \
  -w /go/src/${package_name} \
  wpengine/golang
  bash -c "git config --global url.'https://$(GITHUB_TOKEN):x-oauth-basic@github.com/'.insteadOf 'https://github.com/' \
  && go mod vendor"
```

## Changelog
This changelog describes changes made specifically to the `<toolset-version>` described above.

### \<version\>-wpe0
This version contains `protobuf-compiler` and the following Go tools:
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
