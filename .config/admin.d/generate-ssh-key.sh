#!/usr/bin/env sh

set -eu

printf "Enter purpose (p = personal, w = work): "
read -r PURPOSE

case "$PURPOSE" in
p) KEY_FILE=~/.ssh/id_personal ;;
w) KEY_FILE=~/.ssh/id_work ;;
*) exit 1 ;;
esac

DEFAULT_COMMENT=$(whoami)@$(hostname)
printf "Enter comment (empty for %s): " "$DEFAULT_COMMENT"
read -r COMMENT
ssh-keygen -t ed25519 -f "$KEY_FILE" -a 100 -C "${COMMENT:-$DEFAULT_COMMENT}"
echo
echo "Copy the following public key to a remote server:"
echo
cat "$KEY_FILE.pub"
