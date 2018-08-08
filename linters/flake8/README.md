# flake8

A minimal flake8 image useful for linting python files.

https://flake8.pycqa.org/

usage
=====

// Lint all python files in the current and sub directories

```
docker run --rm -v `pwd`:/workspace wpengine/flake8 /workspace
```

configuration
=============

There is an included flake8 file that enforces some sane defaults for django projects. If you would like to
override the configuration, you must mount your flake8 file over the system one.

```
docker run --rm -v `pwd`:/workspace -v /full/path/to/.flake8:/.flake8 wpengine/flake8 /workspace
```
