# packer

Hashicorp's packer image with docker installed. This allows for use of packer's [docker builder](https://www.packer.io/docs/builders/docker.html).

Example:
```
docker run --rm -w /workspace -v `pwd`:/workspace wpengine/packer build some_packer_template.json
```
