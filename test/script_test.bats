#!/usr/bin/env bats

setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'

  DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
  PATH="$DIR/../src:$PATH"

  TEST_DIR=$(mktmp -d)
  mkdir -p "$TEST_DIR/level1/level2/level3"
  export TEST_DIR
}

@test "can run our script" {
  scripts.sh
}

teardown() {
  if [ -n "${TEST_DIR:-}" ] && [ -d "$TEST_DIR" ]; then
    rm -rf "$TEST_DIR"
  fi
}

@test "example test using nested dirs" {
  # Verify the structure was created
  [ -d "$TEST_DIR/level1/level2/level3" ]
}
