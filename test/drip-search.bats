#!/usr/bin/env bats

@test "drip-search without arguments returns a list of definitions" {
  expected="ctags-5.8
redis-2.4.15
ruby-1.9.3-p0
ruby-1.9.3-p125"

  export STOW_VERSIONS_PATH="test/fixtures/versions"
  export STOW_PATH="tmp/stow"

  run ./bin/drip search
  [ "${status}" -eq 0 ]
  [ "${output}" = "${expected}" ]
}

@test "drip-search with arguments returns a filtered list of definitions for ruby" {
  expected="ruby-1.9.3-p0
ruby-1.9.3-p125"

  export STOW_VERSIONS_PATH="test/fixtures/versions"
  export STOW_PATH="tmp/stow"

  run ./bin/drip search ruby
  [ "${status}" -eq 0 ]
  [ "${output}" = "${expected}" ]
}

@test "drip-search with arguments returns a filtered list of definitions starting with r" {
  expected="redis-2.4.15
ruby-1.9.3-p0
ruby-1.9.3-p125"

  export STOW_VERSIONS_PATH="test/fixtures/versions"
  export STOW_PATH="tmp/stow"

  run ./bin/drip search r
  [ "${status}" -eq 0 ]
  [ "${output}" = "${expected}" ]
}

@test "drip-search should exit with error when STOW_VERSIONS_PATH is not found" {
  export STOW_VERSIONS_PATH="unexisting"
  run ./bin/drip search
  [ "${status}" -eq 1 ]
  [ "${output}" = "Provided STOW_VERSION_PATH does not exist." ]
}
