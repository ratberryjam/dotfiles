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

# function _refresh_slack() {
#   osascript -e 'tell application "Slack" to activate'
#   osascript -e 'tell application "System Events" to keystroke "r" using command down'
# }

# function dark() {
#   # Prep for Slack
#   SLACK_STYLE_FILE=/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
#   SLACK_BACKUP_FILE=${SLACK_STYLE_FILE}~backup
#   SLACK_REMOTE_STYLESHEET=https://gist.githubusercontent.com/jamesratcliffe/744bf7ed7f5ba657341bd06c46cfc1de/raw/52abed1436d76e08c6b1a237de0c5bd3d2a19938/slack-full-aubergine.css

#   # Find out the current mode
#   local DARK
#   DARK=$(osascript -e 'tell app "System Events" to tell appearance preferences to return dark mode')

#   if [[ $DARK == 'true' ]]; then
#     echo 'Switching to light mode…'
#     # Slack
#     if [ -a SLACK_BACKUP_FILE ]; then
#       cp "$BACKUP_FILE" "$STYLE_FILE"
#       _refresh_slack
#     else
#       echo "Couldn't restore default (light) Slack style!"
#     fi
#   else
#     echo 'Switching to dark mode…'
#     # Slack to dark more
#     SLACK_JS='document.addEventListener("DOMContentLoaded",function(){$.ajax({url:"'$SLACK_REMOTE_STYLESHEET'",success:function(e){$("<style></style>").appendTo("head").html(e)}})});'
#     echo "$SLACK_JS" >> "$SLACK_STYLE_FILE"
#     _refresh_slack
#   fi

#   # System
#   osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'

#   # Chrome Dark Reader
#   osascript -e 'tell app "Chrome" to activate'
#   osascript -e 'tell application "System Events" to keystroke "d" using {shift down, option down}'
}
