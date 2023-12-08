# shellcheck shell=sh

# Change from the default ~/.rustup
export RUSTUP_HOME=~/.local/share/rustup

# Change from the default ~/.rust
# Until https://internals.rust-lang.org/t/pre-rfc-split-cargo-home/19747 is resolved.
export CARGO_HOME=~/.local/share/cargo

# Make `cargo install` output here
export CARGO_INSTALL_ROOT=~/.local/bin

# Rustup will install the main binaries here (cargo, rust, rustup, ...)
export PATH="$PATH:$CARGO_HOME/bin"
