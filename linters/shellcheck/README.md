# shellcheck

A minimal shellcheck image useful for linting scripting files (e.g., bash scripts).

https://github.com/koalaman/shellcheck/wiki

usage
=====

Lint particular scripts
```
docker run --rm -v `pwd`:/shellcheck wpengine/shellcheck /shellcheck/script1.sh /shellcheck/script2.sh
```
