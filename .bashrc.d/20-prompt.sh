# shellcheck shell=bash

build_prompt() {
  local col1
  local col2
  local col3
  local rst

  col1=$(tput setaf 6)
  col2=$(tput setaf 3)
  col3=$(tput setaf 1)
  rst=$(tput sgr0)

  # shellcheck disable=SC2028
  echo -n "\n$col1\w$rst\nat $col2\t$rst err $col3\$?$col1 ❭ $rst"
}

PS1=$(build_prompt)

unset build_prompt
