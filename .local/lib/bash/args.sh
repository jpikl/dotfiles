# shellcheck shell=bash

ERR_NO_GNU_GETOPT=10
ERR_UNPROCESSABLE_ARGS=11
ERR_INVALID_ARGS=12
ERR_MISSING_ARGS=13

PURE_GETOPT_DIR=$BASH_LIB_DIR/pure-getopt
PURE_GETOPT_SCRIPT=$PURE_GETOPT_DIR/getopt.bash

help_usage() {
  echo "Try '$(self) --help' for more information."
}

die_no_gnu_getopt() {
  {
    alert "GNU getopt is required"
    echo "You can get pure bash implementation of GNU getopt with:"
    echo "  dotfiles submodule update "$PURE_GETOPT_DIR""
  } >&2
  exit $ERR_NO_GNU_GETOPT
}

die_unprocessable_args() {
  alert "internal error: unable to process arguments" >&2
  exit $ERR_UNPROCESSABLE_ARGS
}

die_invalid_args() {
  help_usage >&2
  exit $ERR_INVALID_ARGS
}

die_missing_args() {
  {
    alert "missing required argument"
    help_usage
  } >&2
  exit $ERR_MISSING_ARGS
}

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
  die_no_gnu_getopt
fi

parse_args() {
  local -r short_opts=$1
  local -r long_opts=$2
  shift 2
  call_getopt \
    --name "$(self)" \
    --options "$short_opts" \
    --longoptions "$long_opts" \
    -- "$@"
}

get_args() {
  parse_args "$@" || die_invalid_args
}
