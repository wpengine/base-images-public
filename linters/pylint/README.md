# pylint

A minimal pylint image useful for linting python files.

https://pylint.org/

usage
=====

// Lint all python files in the current and sub directories

```
docker run --rm -v `pwd`:/workspace wpengine/pylint /workspace
```

// Lint  particular files

The pylint image expects a base directory to find python files in since pylint doesn't have a recursive *.py lookup. We
can just skip that first `find <base_dir> -iname "*.py"` call by passing in `.` as the directory however.

```
docker run --rm -v `pwd`:/workspace wpengine/pylint . /workspace/file1.py /workspace/file2.py
```

configuration
=============

If run from a directory with a .pylintrc configuration file, it will not be picked up automatically by mounting the
directory/file when running. There is already a .pylintrc file in the image, so it only needs to be overridden to work
correctly.

```
docker run --rm -v `pwd`:/workspace -v /full/path/to/.pylintrc:/pylint/.pylintrc wpengine/pylint /workspace
```