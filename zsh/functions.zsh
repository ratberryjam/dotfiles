# Open new window in CWD
function nw() {
  # Must not have trailing semicolon, for iTerm compatibility
  local command="cd \\\"$PWD\\\"; clear"
  (($# > 0)) && command="${command}; $*"

  local the_app=$(_omz_osx_get_frontmost_app)

  if [[ "$the_app" == 'Terminal' ]]; then
    # Discarding stdout to quash "tab N of window id XXX" output
    osascript >/dev/null <<EOF
      tell application "System Events"
        tell process "Terminal" to keystroke "n" using command down
      end tell
      tell application "Terminal" to do script "${command}" in front window
EOF

  elif [[ "$the_app" == 'iTerm' ]]; then
    osascript <<EOF
      tell application "iTerm"
        set current_terminal to create new terminal
        tell current_terminal
          set current_session to current session
          tell current_session
            write text "${command}"
          end tell
        end tell
      end tell
EOF

  elif [[ "$the_app" == 'iTerm2' ]]; then
    osascript <<EOF
        tell application "iTerm2"
          set current_window to create window with default profile
          tell current_window
            tell current session to write text "${command}"
          end tell
        end tell
EOF

  else
    echo "tab: unsupported terminal app: $the_app"
    false

  fi
}

function fl() {
  open -a Forklift $(pwd)
}
