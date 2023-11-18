# shellcheck shell=bash

export BROWSER=${BROWSER:-$(find_executable \
  "librewolf firefox chromium chrome google-chrome google-chrome-stable" \
  "lynx links" \
)}
