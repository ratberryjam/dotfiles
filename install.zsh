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
cp "${DOTFILES}/zsh/zshrc.example" "${HOME}/.zshrc"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)""

git clone https://github.com/jessarcher/zsh-artisan.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/artisan

source ~/.zshrc

if [ $(command -v duti) ]; then
    duti "${DOTFILES}/duti.config"
fi
