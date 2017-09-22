yamllint
========

A minimal yamllint image useful for linting yaml files.

https://yamllint.readthedocs.io/en/latest/

usage
=====

// Lint all the files and folders in the current directory
```
docker run --rm -v `pwd`:/workspace wpengine/yamllint .
```

// Lint  particular files
```
docker run --rm -v `pwd`:/workspace wpengine/yamllint file1.yaml file2.yaml
```

configuration
=============
If run from a directory with a .yamllint configuration file, it will be picked up automatically. If you want to provide
one from a different directory, you can do something like:

```
docker run --rm -v `pwd`:/workspace -v /full/path/to/.yammllint:/myyamllint wpengine/yamllint -c /myyamllint .
```
