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

## Set version of a Maven project
mvnsv() {
  mvn versions:set -DnewVersion="$1" -DgenerateBackupPoms=false --quiet
}

## Print property of a Maven project in Git branches.
mvnpgb() {
  local c1="git grep --fixed-strings '<$1>' '{}' -- pom.xml"
  local c2="sed --regexp-extended 's/.*>(.*)<\/.*/\1/'"
  git ls-branches -r | xtable -sI "$c1|$c2"
}
