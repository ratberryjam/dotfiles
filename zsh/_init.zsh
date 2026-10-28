## BASICS ##

source "${ZSH_STUFF}/oh-my-zsh-config.zsh"

# Path
source "${ZSH_STUFF}/path.zsh"
# Aliases
source "${ZSH_STUFF}/aliases.zsh"
# Functions
source "${ZSH_STUFF}/functions.zsh"

# Setup different dev tools
source "${ZSH_STUFF}/tools.zsh"

# Completions
setopt complete_aliases
fpath=(${ZSH_STUFF}/completions $fpath)
