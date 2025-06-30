#!/usr/bin/env bash

#
# Setup Symlinks
#
# This script creates symlinks from the dotfiles directory to the home directory.
# It also creates a backup of any existing dotfiles.
#

# Exit on error
set -e

# Source the helper functions
source "$(dirname "$0")/lib/helpers.sh"

# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d%H%M%S)"

# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

create_symlink() {
  local source_file="$1"
  local target_file="$2"

  if [ -e "$target_file" ] || [ -L "$target_file" ]; then
    if [ -L "$target_file" ]; then
      # It's a symlink, so just remove it
      info "Removing existing symlink at $target_file"
      execute "rm" "$target_file"
    else
      # It's a real file or directory, so back it up
      info "Backing up $target_file to $BACKUP_DIR"
      execute "mkdir" "-p" "$BACKUP_DIR"
      execute "mv" "$target_file" "$BACKUP_DIR/"
    fi
  fi

  info "Creating symlink: $target_file -> $source_file"
  execute "ln" "-s" "$source_file" "$target_file"
}

# ------------------------------------------------------------------------------
# Main Logic
# ------------------------------------------------------------------------------

info "Setting up symlinks..."

# Create necessary directories
execute "mkdir" "-p" "$HOME/.config/nvim"
execute "mkdir" "-p" "$HOME/tmp"

# List of files and directories to symlink
symlinks=(
  "$DOTFILES_DIR/gem/gemrc:$HOME/.gemrc"
  "$DOTFILES_DIR/git:$HOME/.git"
  "$DOTFILES_DIR/git/gitconfig:$HOME/.gitconfig"
  "$DOTFILES_DIR/git/gitk:$HOME/.gitk"
  "$DOTFILES_DIR/tmux/.tmux.conf:$HOME/.tmux.conf"
  "$DOTFILES_DIR/terminfo:$HOME/.terminfo"
  "$DOTFILES_DIR/asdf:$HOME/.asdf"
  "$DOTFILES_DIR/bin:$HOME/bin"
  "$DOTFILES_DIR/vim:$HOME/.vim"
  "$DOTFILES_DIR/vim/vimrc:$HOME/.vimrc"
  "$DOTFILES_DIR/config/nvim/init.vim:$HOME/.config/nvim/init.vim"
  "$DOTFILES_DIR/zsh:$HOME/.zsh"
  "$DOTFILES_DIR/zsh/zshrc:$HOME/.zshrc"
  "$DOTFILES_DIR/zsh/p10k.zsh:$HOME/.p10k.zsh"
)

for symlink in "${symlinks[@]}"; do
  # Split the line into source and target
  IFS=':' read -r source_path target_path <<< "$symlink"
  create_symlink "$source_path" "$target_path"
done

success "Symlinks created successfully."
