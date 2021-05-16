# shellcheck shell=bash

## Maven install
alias mvni='mvn install'
## Maven install (skip tests)
alias mvnist='mvni -Dmaven.test.skip=true'

## Maven clean and install
alias mvnci='mvn clean install'
## Maven clean and install (skip tests)
alias mvncist='mvnci -Dmaven.test.skip=true'

## Maven dependency tree
alias mvndeps='mvn dependency:tree'

# Set version of a Maven project
mvnsv() {
  mvn versions:set -DnewVersion="$1" -DgenerateBackupPoms=false --quiet
}
