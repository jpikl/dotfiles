# shellcheck shell=bash


## Read pipe and open the result with preffered application
openpipe() {
  if [[ $# -gt 0 ]]; then
    xpipe -e "$1" "${EDITOR/ *}"
  else
    echo "Usage: openpipe <extension>" >&2
  fi
}
