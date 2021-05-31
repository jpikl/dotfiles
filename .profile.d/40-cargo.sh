# shellcheck shell=bash

# Cargo home directory
export CARGO_HOME=${CARGO_HOME:-~/.cargo}

# Update path for rust binaries
export PATH=$PATH:$CARGO_HOME/bin
