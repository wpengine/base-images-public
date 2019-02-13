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

All units test filenames should be named: \<test description\>.test.js 

## Building the container
```
docker run --rm -v ${PWD}/src/tests:/code/src/tests -v ${PWD}/src/codeToTest:/code/src/codeToTest apigee-test-shared  -ci  './code/src/bin/test.sh'
```