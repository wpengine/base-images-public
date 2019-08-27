# golang

Golang base image with additional tools for development.

## Tagged Versions

This image is bound by the following tagging scheme to support existing applications:
```
wpengine/golang:<major-golang-version>-wpe<image-version>
```
where `<major-golang-version>` might be Go version `1.12` and `<image-version>` would be an integer that is incremented when any bundled tools are modified in a non-backwards-compatible fashion.


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
