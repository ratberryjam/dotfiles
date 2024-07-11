#!/usr/bin/env zsh

DOTFILES="${HOME}/.dotfiles"
ZSH="${HOME}/.oh-my-zsh"
BACKUP_SUFFIX=backup

# Homebrew packages
if [ ! -x /usr/local/bin/brew ]; then
    echo "Homebrew not installed. Go to https://brew.sh."
fi

source "${DOTFILES}/brew.zsh"

# Link
mv "${HOME}/.zshrc" "${HOME}/.zshrc.${BACKUP_SUFFIX}"
ln -s "${DOTFILES}/zsh/zshrc" "${HOME}/.zshrc"

mv "${HOME}/.zlogout" "${HOME}/.zlogout.${BACKUP_SUFFIX}"
ln -s "${DOTFILES}/zsh/zlogout" "${HOME}/.zlogout"

# Install spaceship zsh theme
mkdir -p "$ZSH/custom/themes"
if [[ ! -e "$ZSH/custom/themes/spaceship-prompt" ]]; then
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/custom/themes/spaceship-prompt"
    ln -s "$ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/custom/themes/spaceship.zsh-theme"
fi

# Install custom oh-my-zsh plugins
mkdir -p "$ZSH/custom/plugins"
if [[ ! -e "$ZSH/custom/plugins/fzf-z" ]]; then
    git clone git@github.com:andrewferrier/fzf-z.git "$ZSH/custom/plugins/fzf-z"
fi

source ~/.zshrc
