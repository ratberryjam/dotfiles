#!/usr/bin/env zsh

DOTFILES="${0:a:h}"
BACKUP_SUFFIX=backup

# Link
mv "${HOME}/.zshrc" "${HOME}/.zshrc.${BACKUP_SUFFIX}"
ln -s "${DOTFILES}/.zshrc" "${HOME}/.zshrc"
