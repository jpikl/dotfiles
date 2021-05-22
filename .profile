# shellcheck shell=bash

# Numbering convention of scripts in ~/.profile.d/
# 0x - Initialization
# 1x - Common configuration (local)
# 2x - Common configuration (shared)
# šx - App configuration (local)
# 4x - App configuration (shared)
# 5x - Startup tasks (local)
# 6x - Startup tasks (shared)
# 9x - Cleanup

for profile in ~/.profile.d/*.sh; do
  source "$profile"
done

unset profile
