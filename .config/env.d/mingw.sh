# shellcheck shell=sh

if [ "${MSYSTEM-}" = MINGW32 ] || [ "${MSYSTEM-}" = MINGW64 ]; then
  # Allow `ln -s` to create native symbolic links.
  # Requires Windows developer mode to be enabled.
  # See https://stackoverflow.com/a/59761201
  # See https://github.com/orgs/community/discussions/23591#discussioncomment-3241027
  export MSYS=winsymlinks:nativestrict
fi
