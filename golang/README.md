# golang

Golang base image with additional packages to assist in running unit tests.

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
