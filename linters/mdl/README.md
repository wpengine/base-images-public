# mdl

A minimal mdl image, with custom rules related to WPE standards, useful for linting markdown files.

Example:
docker run --rm -v `pwd`:/workspace wpengine/mdl /workspace

configuration
=============

If run from a directory with a .mdlrc configuration file, it will not be picked up automatically by mounting the
directory/file when running. There is already a .mdlrc file in the image, so it only needs to be overridden to work
correctly.

```
docker run --rm -v `pwd`:/workspace -v /full/path/to/.mdlrc:/mdl/.mdlrc wpengine/mdl /workspace
```