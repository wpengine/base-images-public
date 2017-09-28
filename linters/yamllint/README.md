# yamllint

A minimal yamllint image useful for linting yaml files.

https://yamllint.readthedocs.io/en/latest/

usage
=====

// Lint all the files and folders in the current directory
```
docker run --rm -v `pwd`:/workspace wpengine/yamllint /workspace
```

// Lint  particular files
```
docker run --rm -v `pwd`:/workspace wpengine/yamllint /workspace/file1.yaml /workspace/file2.yaml
```

configuration
=============

If run from a directory with a .yamllint configuration file, it will not be picked up automatically by passing mounting
the directory/file when running. There is already a .yamllint file in the image, so it only needs to be overridden to
work correctly.

```
docker run --rm -v `pwd`:/workspace -v /full/path/to/.yammllint:/yamllint/.yamllint wpengine/yamllint /workspace
```
