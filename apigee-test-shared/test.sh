#!/usr/bin/env bash

set -euo pipefail

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT="$( cd "$BIN_DIR/.." && pwd)"

main()
{
    cd "$ROOT"

    npm test || die "Mocha test failed"
    echo "All tests pass!"
}

die()
{
    echo "ERROR: $*"
    exit 1
}

main "$@"
