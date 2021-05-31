# shellcheck shell=bash

# Change the default ~/go path to ~/.local/lib/go
export GOPATH=${GOPATH:-$USER_LIBRARIES_DIR/go}

# Cange the default $GOPATH/bin path to ~/.local/bin
export GOBIN=${GOBIN:-$USER_BINARIES_DIR}
