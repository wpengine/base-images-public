# Python

Python image to lint, test, and build python packages.

Uses the `ubuntu:focal` image and installs python3-pip which
is currently python 3.8.5.

## Includes

* [flake8](https://pypi.org/project/flake8/)
* [nose](https://pypi.org/project/nose/)
* [paver](https://github.com/paver/paver)
* [pbr](https://pypi.org/project/pbr/)
* [pip-tools](https://pypi.org/project/pip-tools/)
* [pylint](https://pypi.org/project/pylint/)
* [tox](https://pypi.org/project/tox/)

## Example usage

tox.ini

```
[flake8]
max-line-length = 120
exclude: .git,.venv,.tox

[tox]
envlist = py27,py35

[testenv]
usedevelop = True
sitepackages = False
deps =
  -rrequirements.txt
commands =
  py{27,35}: nosetests

```

lint, test, and build:

```
docker run --rm -t -v $PWD:/workspace wpengine/python flake8
docker run --rm -t -v $PWD:/workspace wpengine/python tox
docker run --rm -t -v $PWD:/workspace wpengine/python paver build
```
