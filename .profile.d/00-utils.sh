# shellcheck shell=bash

#####################################################################
# Any helper function declared here should be unset in 99-cleanup.sh
#####################################################################

# Convert paths like 'C:\x\y\z' to '/c/x/y/z' for use with MSYS
normalize_path() {
  local path=$1
  if [[ $path =~ ^[a-zA-Z]: ]]; then
    path=${path,}       # Lower case first char
    path=${path/:/}     # Remove ':'
    path=/${path//\\//} # '\' to '/'
  fi
  echo "$path"
}

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
