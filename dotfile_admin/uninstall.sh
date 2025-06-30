#!/usr/bin/env bash

#
# Uninstall Dotfiles
#
# This script removes all the symlinks created by the installation process.
#

# Exit on error
set -e

# Source the helper functions
source "$(dirname "$0")/lib/helpers.sh"

# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

remove_symlink() {
  local target_file="$1"

  if [ -L "$target_file" ]; then
    info "Removing symlink: $target_file"
    rm "$target_file"
  else
    warn "Skipping non-symlink: $target_file"
  fi
}

# ------------------------------------------------------------------------------
# Main Logic
# ------------------------------------------------------------------------------

info "Removing dotfiles symlinks..."

# List of files and directories that were symlinked
symlinks=(
  "$HOME/.gemrc"
  "$HOME/.git"
  "$HOME/.gitconfig"
  "$HOME/.gitk"
  "$HOME/.tmux.conf"
  "$HOME/.terminfo"
  "$HOME/.asdf"
  "$HOME/bin"
  "$HOME/.vim"
  "$HOME/.vimrc"
  "$HOME/.config/nvim/init.vim"
  "$HOME/.zsh"
  "$HOME/.zshrc"
  "$HOME/.p10k.zsh"
)

for symlink in "${symlinks[@]}"; do
  remove_symlink "$symlink"
done

success "Dotfiles uninstalled successfully."
