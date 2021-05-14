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

## Print maven property for each remote Git branch
alias mvnprgb='git lsb -r | xargs -r mvnpgb --'
