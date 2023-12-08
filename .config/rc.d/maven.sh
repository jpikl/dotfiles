# shellcheck shell=sh

alias mvni='mvn install'
alias mvnist='mvni -Dmaven.test.skip=true'
alias mvnci='mvn clean install'
alias mvncist='mvnci -Dmaven.test.skip=true'
alias mvndeps='mvn dependency:tree'

mvnsv() {
  mvn versions:set -DnewVersion="$1" -DgenerateBackupPoms=false --quiet
}
