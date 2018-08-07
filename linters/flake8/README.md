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

The .flake8 configuration file in the target lint directory should override flake8's default settings.
