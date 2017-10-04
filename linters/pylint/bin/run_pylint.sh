#!/usr/bin/env bash

function run_pylint() {
    find $1 -iname "*.py" | xargs pylint --rcfile /pylint/.pylintrc ${@:2}
}

run_pylint $*