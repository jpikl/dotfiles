# shellcheck shell=bash

if [[ ${MSYSTEM-} =~ ^MINGW(32|64)$ && -x "$(command -v python)" ]]; then
  # On Windows, binaries are installed into "%AppData%\Python\PythonXY\Scripts"
  PATH=$PATH:$(normalize_path "$(python -m site --user-site | sed 's/site-packages$/Scripts/')")
  export PATH
fi
