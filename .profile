# shellcheck shell=bash

# Numbering convention of scripts in ~/.profile.d/
# 0x - Initialization
# 1x - Common configuration (fixed)
# 2x - Common configuration (overridable)
# 3x - App configuration (fixed)
# 4x - App configuration (overridable)
# 5x - Startup tasks
# 9x - Cleanup

for profile in ~/.profile.d/*.sh; do
  source "$profile"
done

unset profile
