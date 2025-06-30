#!/usr/bin/env bash

#
# Install asdf and plugins
#

# Exit on error
set -e

# Source the helper functions
source "$(dirname "$0")/lib/helpers.sh"

# ------------------------------------------------------------------------------
# Main Logic
# ------------------------------------------------------------------------------

info "Checking asdf and plugins..."

if ! command -v asdf &> /dev/null; then
  info "asdf not found. Please install asdf first."
  exit 1
fi

# Function to install a plugin and its latest version
install_plugin() {
  local name="$1"
  local url="${2:-}"

  if ! asdf plugin list | grep -q "^$name$"; then
    info "Adding asdf plugin '$name'..."
    execute "asdf" "plugin" "add" "$name" "$url"
  else
    info "asdf plugin '$name' is already added."
  fi

  info "Installing latest version of '$name'..."
  execute "asdf" "install" "$name" "latest"
  execute "asdf" "global" "$name" "latest"
}

# ------------------------------------------------------------------------------

install_plugin "golang" "https://github.com/asdf-community/asdf-golang.git"
install_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"
install_plugin "yarn"
install_plugin "python"
execute "asdf" "reshim" "python"
install_plugin "pipx"
install_plugin "poetry" "https://github.com/asdf-community/asdf-poetry.git"
install_plugin "protoc" "https://github.com/paxosglobal/asdf-protoc.git"
install_plugin "rust" "https://github.com/code-lever/asdf-rust.git"
execute "echo" "ripgrep" ">" "$HOME/.default-cargo-crates"
install_plugin "erlang" "https://github.com/asdf-vm/asdf-erlang.git"
install_plugin "elixir" "https://github.com/asdf-vm/asdf-elixir.git"
install_plugin "elm" "https://github.com/asdf-community/asdf-elm.git"
install_plugin "flutter"
install_plugin "yt-dlp"
install_plugin "firebase"
install_plugin "gcloud" "https://github.com/jthegedus/asdf-gcloud"
install_plugin "neovim"

# Special case for ffmpeg
export CFLAGS="$CFLAGS -I$(brew --prefix)/include"
export LDFLAGS="$LDFLAGS -L$(brew --prefix)/lib"
export ASDF_FFMPEG_ENABLE="graph2dot libaom fontconfig frei0r libass libvorbis libvpx sdl2 libx264 libfdk-aac libopus libmp3lame libass gpl nonfree"
install_plugin "ffmpeg"

success "asdf plugins checked successfully."
