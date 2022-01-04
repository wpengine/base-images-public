# Docksible
(Docker+Ansible)
Tool that can be used instead of Ansible package.
Also it can be used at the Python (here it is called dyton as Docker + Python) interpreter.

## Installation and usage

To generate shims you have to run

```
docker run --rm -it -v `pwd`:/host -v /opt:/opt --workdir /host truesysadmin/docksible bash /root/make_dython_shims.sh
```

This will create needed wrappers in `/opt/dyton` folder.

Add this one to PATH

```
export PATH=/opt/dyton:$PATH
```

