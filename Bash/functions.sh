# shellcheck shell=bash

function cdmvnroot() {
  local -r root_pom_xml=$(find-upwards -name pom.xml | tail --lines=1)
  [[ $root_pom_xml ]] && cd "$(dirname "$root_pom_xml")" || return
}
