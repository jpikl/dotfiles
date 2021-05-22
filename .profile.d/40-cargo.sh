# shellcheck shell=bash

# Cargo home directory
export CARGO_HOME=$USER_DATA_DIR/cargo

# Update path for rust binaries
export PATH=$PATH:$CARGO_HOME/bin
