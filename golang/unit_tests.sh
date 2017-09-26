#!/bin/bash

# Script to run all of our unit tests for each package,
# output junit-xml reports, and output coverage reports.
# Credits to: https://mlafeldt.github.io/blog/test-coverage-in-go/

SCRIPT_NAME=$(basename $0)
SCRIPT_DESC="Run unit and coverage tests for a go package"

# test return code value
TEST_RC=0

# Define variable for help text
read -r -d '' HELP_TEXT <<HELP_BLOCK
\n
-h      Shows help screen and description
-p      The path of the go package to test, relative to /go/src eg. github.com/wpengine/packagename
\n
HELP_BLOCK

# Iterate through options
while getopts ":hp:" opt; do
    case $opt in
        h)
            echo "Name: $SCRIPT_NAME"
            echo "Description: $SCRIPT_DESC"
            echo -e "$HELP_TEXT"
            exit 0
            ;;
        p)
            export package_path="src/$OPTARG" >&2
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

if [[ -z $package_path ]]; then
    echo -e "-p is required"
    echo -e "$HELP_TEXT"
    exit 1
fi

artifacts_test_dir="$package_path/artifacts/unit_tests"
profile="$artifacts_test_dir/cover.out"
mode="count"
go_junit_report="/go/src/github.com/jstemmer/go-junit-report"

mkdir -p artifacts_test_dir

generate_cover_data() {
  for package in $(go list ./$package_path/... | grep -v '/vendor/' \
    | grep -v '/artifacts/')
  do
    f="$(echo $package | tr / -)"

    # tee the test output so that we can see it in stdout
    go test -v -covermode=$mode -coverprofile=$artifacts_test_dir/$f.cover $package 2>&1 | \
    tee $artifacts_test_dir/temp-$f.out

    # preserve the return code of the test, which is the first step in the above pipeline
    LAST_RC=${PIPESTATUS[0]}
    if [[ $LAST_RC != 0 ]] ; then
        TEST_RC=$LAST_RC
    fi

    # If there were tests, pipe that output into the junit-formatter for jenkins
    if [ -f $artifacts_test_dir/temp-$f.out ]; then

      cat $artifacts_test_dir/temp-$f.out | go run $go_junit_report/go-junit-report.go \
      $go_junit_report/junit-formatter.go > $artifacts_test_dir/$f-report.xml
    fi
  done

  echo "mode: $mode" > "$profile" # Necessary prefix for coverage report
  grep -h -v "^mode:" "$artifacts_test_dir"/*.cover >> "$profile"

  gocov convert $profile | gocov-xml > $artifacts_test_dir/coverage.xml
}

show_cover_report() {
    go tool cover -html="$profile" -o $artifacts_test_dir/coverage.html
}

mkdir -p $artifacts_test_dir
generate_cover_data
show_cover_report

chmod -R 777 $artifacts_test_dir
exit $TEST_RC
