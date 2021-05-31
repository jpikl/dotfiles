# shellcheck shell=bash

# TODO: Use separate config/cache dirs once the following issue is resolved: https://github.com/rust-lang/cargo/pull/9178

# Change the default CARGO_HOME install root to ~/.local
export CARGO_INSTALL_ROOT=${CARGO_INSTALL_ROOT:-$USER_LOCAL_DIR}

# Update path for rust binaries
# CARGO_INSTALL_ROOT applies only to `cargo install`.
# CARGO_HOME/bin might still contain rustup binaries.
export PATH=$PATH:${CARGO_HOME:-~/.cargo}/bin
