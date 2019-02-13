# Apigee-test-shared
Docker image used to run unit tests on Apigee proxies

## Mounting tests
To use this image your tests should be mounted into /code/src using this folder structure
```
src  
.
.
.
└───<insert code to be tested here>
│   
└───tests
    |
    └───<insert tests here>
```

## Test filename naming convention

All units test filenames should be named: \<file_under_test\>.test.js 

## Building the container
```
docker run --rm -it -v ${PWD}/src/tests:/code/src/codeToTest -v ${PWD}/src/gateway:/code/src/codeToTest test-shanes2:latest  /bin/bash -ci  './bin/test.sh'
```