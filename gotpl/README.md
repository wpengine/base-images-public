# gotpl

Scratch image with gotpl installed. In order to be useful, it will likely be
necessary to mount the source directory as a volume in the resulting container.

## Example
```
cat vars.yml | docker run -i --rm -v ${PWD}:/src -w /src wpengine/gotpl ./Dockerfile.gotpl > Dockerfile
```
