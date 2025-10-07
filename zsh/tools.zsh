eval "$(starship init zsh)"

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Ruby
if [ "$(command -v rbenv)" ]; then
	eval "$(rbenv init -)"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# zcli autocomplete setup
# shellcheck source="$HOME/Library/Caches/@zendesk/zcli/autocomplete/zsh_setup"
ZCLI_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/@zendesk/zcli/autocomplete/zsh_setup" && test -f "$ZCLI_AC_ZSH_SETUP_PATH" && source "$ZCLI_AC_ZSH_SETUP_PATH"

# PHP Brew
source "$HOME/.phpbrew/bashrc"

# Lightspeed shared Docker environment
export SHARED_ENV_PATH=/dev/docker-shared-environment

# rbenv
eval "$(rbenv init - zsh)"

# GPG (for signing commits)
GPG_TTY="$(tty)"
export GPG_TTY

# 1Password plugins
source "$HOME/.config/op/plugins.sh"

# zoxide (replaces fasd)
eval "$(zoxide init zsh)"

# Google Cloud
if [ -f '/Volumes/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Volumes/dev/google-cloud-sdk/path.zsh.inc'; fi

# thefuck
eval $(thefuck --alias)

# moor
export PAGER=/opt/homebrew/bin/moor
# export MOOR=

# bat
export BAT_THEME="TwoDark"

# zsh-artisan
export ARTISAN_OPEN_ON_MAKE_EDITOR=code

# VS Code
if [ -x "$(command -v code)" ]; then
	[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
fi
