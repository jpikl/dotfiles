# shellcheck shell=bash

# Go workspace directory
export GOPATH=${GOPATH:-~/.go}

# Update path for go binaries
export PATH=$PATH:$GOPATH/bin
