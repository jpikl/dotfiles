# shellcheck shell=bash

# shellcheck disable=SC2139
## Install globaly the most essential go packages
alias goboot="xargs --arg-file=""$USER_DATA_DIR/go/boot"" go get -u"
