## BASICS ##
export ZSH_STUFF=~/Dropbox/Apps/zsh

# oh-my-zsh
source "${ZSH_STUFF}/zsh-config.zsh"

# hh (shell history)
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors
bindkey -s "\C-r" "\eqhh\n"     # bind hh to Ctrl-r (for Vi mode check doc)

# fasd
# eval "$(fasd --init auto)"

# Path
source "${ZSH_STUFF}/path.zsh"
# Custom aliased
source "${ZSH_STUFF}/aliases.zsh"
# Custom functions
source "${ZSH_STUFF}/misc_functions.zsh"
# OnSite stuff
source "${ZSH_STUFF}/onsite.zsh"
# Support Ops stuff
source "${ZSH_STUFF}/supp_ops.zsh"

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Virtual Go
# command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell zsh)"

# Dad joke for lulz
# cowsay $(curl -s -H "Accept: text/plain" https://icanhazdadjoke.com/; echo)

# Ruby
eval "$(rbenv init -)"
