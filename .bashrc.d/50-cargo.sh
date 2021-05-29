# shellcheck shell=bash

# shellcheck disable=SC2139
## Install globaly the most essential cargo packages
alias cargoboot="xargs --arg-file=""$USER_DATA_DIR/cargo/boot"" cargo install"
