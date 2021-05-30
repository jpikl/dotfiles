# shellcheck shell=bash

# Cargo home directory
export CARGO_HOME=$USER_DATA_DIR/cargo

# Cargo install root directory
export CARGO_INSTALL_ROOT=$USER_LOCAL_DIR

# Update path for rust binaries
# We changed install root but cargo home might still contain some rustup/cargo binaries.
export PATH=$PATH:$CARGO_HOME/bin
