#!/usr/bin/env zsh

DOTFILES="${HOME}/.dotfiles"
BACKUP_SUFFIX=backup

# Homebrew packages
if [ ! -x /usr/local/bin/brew ]; then
    echo
fi

# brew install zsh

# Link
mv "${HOME}/.zshrc" "${HOME}/.zshrc.${BACKUP_SUFFIX}"
ln -s "${DOTFILES}/zsh/zshrc" "${HOME}/.zshrc"

mv "${HOME}/.zlogout" "${HOME}/.zlogout.${BACKUP_SUFFIX}"
ln -s "${DOTFILES}/zsh/zlogout" "${HOME}/.zlogout"
