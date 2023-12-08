# shellcheck shell=sh

# Make FNM (Fast Nome Manager) binary available
export PATH="$PATH:$HOME/.local/share/fnm"

# Make binaries provided by FNM (node, npm, yarn, pnpm) available
if [ -x "$(command -v fnm)" ]; then
  eval "$(fnm env)"
fi

if [ "${MSYSTEM-}" = MINGW32 ] || [ "${MSYSTEM-}" = MINGW64 ]; then
  # NPM on Windows uses different directory layout where binaries are stored
  # directly  in the `${prefix}` directory, not in `${prefix}/bin`.
  # We could detect these by calling `npm prefix -g` and `$(yarn global bin)`
  # but they are slow as hell and block shell initialization.
  export PATH="$PATH:$APPDATA\\npm"
  export PATH="$PATH:$LOCALAPPDATA\\Yarn\\bin"
else
  # Change from the default /usr/local
  # Make `npm install -g` and `yarn global install` output to ~/.local/bin
  export NPM_CONFIG_PREFIX=~/.local

  # Change from the default ~/.npm
  export NPM_CONFIG_CACHE=~/.cache/npm

  # Yarn classic uses automatically ~/.cache/yarn
  # Yarn modern needs the following configuration
  # Change from the default ~/.yarn/berry/global
  export YARN_GLOBAL_FOLDER=~/.cache/yarn/berry
fi
