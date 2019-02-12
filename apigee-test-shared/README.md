# Apigee-test-shared
Docker image used to run unit tests on Apigee proxies

## Building the container
```
docker run --rm -v ${PWD}/src:/code/src/
        apigee-test-shared  cp runUnitTests.sh
        /code/src/ && ./code/src/runUnitTests.sh
```