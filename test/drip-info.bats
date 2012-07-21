#!/usr/bin/env bats

@test "it_should_require_an_argument" {
  run ./bin/drip info
  [ "${status}" -eq 1 ]
  [ "${output}" = "This command requires a definition argument." ]
}

@test 'it_should_verify_existance_of_package' {
  run ./bin/drip info example
  [ "${status}" -eq 1 ]
  [ "${output}" = "No available definition for \`example'." ]
}

@test 'it_should_show_default_package_info' {
  run ./bin/drip info git-1.7.10

  [ "${status}" -eq 0 ]
  [ "${output}" = "No info provided for \`git-1.7.10'." ]
}

@test 'it_should_show_package_info' {
  expected="
Set up databases with:

  unset TMPDIR
  mysql_install_db

You can start/stop MySQL with:

  mysql.server start
  mysql.server stop"

  run ./bin/drip info mariadb-5.3.5-ga
  [ "${status}" -eq 0 ]
  [ "${output}" = "${expected}" ]
}
