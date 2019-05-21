# shellcheck shell=bash

PURE_GETOPT_DIR=$BASH_LIB_DIR/pure-getopt
PURE_GETOPT_SCRIPT=$PURE_GETOPT_DIR/getopt.bash

is_gnu_getopt() {
  local result=0
  getopt --test &>/dev/null || result=$?
  [[ $result -eq 4 ]]
}

if is_gnu_getopt; then
  call_getopt() {
    getopt "$@"
  }
elif [[ -f $PURE_GETOPT_SCRIPT ]]; then
  source "$PURE_GETOPT_SCRIPT"

  call_getopt() (
    set +euo pipefail # pure-getopt does not support strict mode.
    getopt "$@"
  )
else
  cat >&2 <<-EOT
		$(self): GNU getopt is required
		You can get pure bash implementation of GNU getopt with:
		  dotfiles submodule update "$PURE_GETOPT_DIR"
	EOT
  die_missing_dependency
fi

parse_args() {
  local -r short_opts=$1
  local -r long_opts=$2
  shift 2
  call_getopt --name "$(self)" \
              --options "$short_opts" \
              --longoptions "$long_opts" \
              -- "$@"
}

get_args() {
  parse_args "$@" || die_invalid_args
}
