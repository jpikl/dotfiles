# shellcheck shell=bash

#####################################################################
# Any helper function declared here should be unset in 99-cleanup.sh
#####################################################################

# Detect first available GUI or CLI program
find_executable() {
  local file
  local files

  if [[ $DISPLAY ]]; then
    files="$1 $2" # GUI programs and then terminal programs
  else
    files=$2 # Terminal programs only
  fi

  for file in $files; do
    if [[ -x $(command -v "$file") ]]; then
      echo "$file"
      break
    fi
  done
}
