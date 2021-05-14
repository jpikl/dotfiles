# shellcheck shell=bash

# Ip command with colors
alias ip='ip -color=auto'
## Print network devices with IPv4 address
alias ip4='ip -brief -family inet address show'
## Print IPv4 addresses of active network devices
alias ip4u='ip4 | fgrep " UP " | egrep --color=never --only-matching "[0-9]+(\.[0-9]+){3}"'
## Print network devices with IPv6 address
alias ip6='ip -brief -family inet6 address show'
## Print network devices with MAC address
alias iplink='ip -brief link show'
