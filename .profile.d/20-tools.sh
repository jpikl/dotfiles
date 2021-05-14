# shellcheck shell=bash

# Configurable tool variables
BROWSER=${BROWSER:-$(find_executable "chromium chrome google-chrome google-chrome-stable firefox" "links lynx")}
EDITOR=${EDITOR:-$(find_executable "sublime_text subl3 subl code codium" "vim nano")}
EDITOR_CMD=$EDITOR # EDITOR might get modified later, we use this to preserve the original value

# If we want to use Sublime Text or Visual Studio Code as Git commit editor,
# they need their process to be foreground until they are really closed.
if [[ $EDITOR =~ ^sublime_text|subl3|subl|code|codium$ ]]; then
  EDITOR="$EDITOR --wait"
fi

# Export variables
export BROWSER
export EDITOR
export EDITOR_CMD
export VISUAL=$EDITOR
