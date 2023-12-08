# shellcheck shell=sh

alias ip='ip -color=auto'                        # Colored by default
alias ip4='ip -brief -family inet address show'  # Devices with IPv4
alias ip6='ip -brief -family inet6 address show' # Devices with IPv6
alias iplink='ip -brief link show'               # Devices with MAC
