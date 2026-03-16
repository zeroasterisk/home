#!/usr/bin/env bash
# dotfile_admin/upgrade.sh

set -e
source "$(dirname "$0")/lib/helpers.sh"
DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

info "1. Upgrading OS Packages (Homebrew)..."
brew update
brew upgrade

info "2. Upgrading ASDF Plugins & Tools..."
asdf plugin-update --all
# This reads your current .tool-versions, finds the latest version for each plugin, 
# installs it, and updates the .tool-versions file!
while read -r plugin version; do
    if [ -n "$plugin" ] && [ "$version" != "system" ]; then
        info "Bumping $plugin to latest..."
        asdf install "$plugin" latest
        asdf local "$plugin" latest
    fi
done < "$DOTFILES_DIR/tool-versions"
# Save the newly bumped local versions back to the global file
if [ -f .tool-versions ]; then
  cp .tool-versions "$DOTFILES_DIR/tool-versions"
  rm .tool-versions
fi

info "3. Upgrading NeoVim Plugins..."
nvim --headless +PlugUpdate +qall

info "4. Upgrading Tmux Plugins..."
if [[ -x "$HOME/.tmux/plugins/tpm/bin/update_plugins" ]]; then
  "$HOME/.tmux/plugins/tpm/bin/update_plugins" all
else
  warn "TPM not found, skipping Tmux plugin upgrade."
fi

info "5. Upgrading global npm packages..."
npm update -g

info "6. Committing updates to dotfiles repository..."
cd "$DOTFILES_DIR"
if [[ -n $(git status -s) ]]; then
    git add tool-versions
    git commit -m "chore: automated environment upgrade (asdf, brew, plugins)"
    success "Changes committed! Don't forget to 'git push'."
else
    success "Everything was already up to date. No git commit needed."
fi
