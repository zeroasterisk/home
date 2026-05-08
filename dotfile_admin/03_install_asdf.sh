#!/usr/bin/env bash

#
# Install asdf and plugins
#

# Exit on error
set -e

# Source the helper functions
source "$(dirname "$0")/lib/helpers.sh"

# TODO fix problem, if this is running as sudo, then asdf isn't running as the local user

# ------------------------------------------------------------------------------
# Main Logic
# ------------------------------------------------------------------------------

info "Checking asdf and plugins..."

if ! command -v asdf &> /dev/null; then
  info "asdf not found. Please install asdf first."
  exit 1
fi

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TOOL_VERSIONS_FILE="$DOTFILES_DIR/tool-versions"

if [ ! -f "$TOOL_VERSIONS_FILE" ]; then
  error "Could not find tool-versions file at $TOOL_VERSIONS_FILE"
  exit 1
fi

# Function to install a plugin
install_plugin() {
  local name="$1"
  local url="${2:-}"

  if ! asdf plugin list | grep -q "^$name$"; then
    info "Adding asdf plugin '$name'..."
    if [ -n "$url" ]; then
      execute "asdf" "plugin" "add" "$name" "$url"
    else
      execute "asdf" "plugin" "add" "$name"
    fi
  else
    info "asdf plugin '$name' is already added."
  fi
}

# ------------------------------------------------------------------------------
# Add plugins (with custom URLs where necessary)
# ------------------------------------------------------------------------------

install_plugin "golang" "https://github.com/asdf-community/asdf-golang.git"
install_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"
install_plugin "yarn"
install_plugin "python"
install_plugin "pipx"
install_plugin "protoc" "https://github.com/paxosglobal/asdf-protoc.git"
install_plugin "rust" "https://github.com/code-lever/asdf-rust.git"
install_plugin "erlang" "https://github.com/asdf-vm/asdf-erlang.git"
install_plugin "elixir" "https://github.com/asdf-vm/asdf-elixir.git"
install_plugin "elm" "https://github.com/asdf-community/asdf-elm.git"
install_plugin "flutter"
install_plugin "yt-dlp"
install_plugin "firebase"
install_plugin "gcloud" "https://github.com/jthegedus/asdf-gcloud"
install_plugin "neovim"

# ------------------------------------------------------------------------------
# Install all tools from .tool-versions
# ------------------------------------------------------------------------------

info "Installing tools from .tool-versions..."
execute "asdf" "install"

# Reshim tools just to be safe
execute "asdf" "reshim"

success "asdf plugins and tools checked successfully."

