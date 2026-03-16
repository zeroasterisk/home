#!/usr/bin/env bash

#
# Install packages for the appropriate OS
#

# Exit on error
set -e

# Source the helper functions
source "$(dirname "$0")/lib/helpers.sh"

# ------------------------------------------------------------------------------
# Main Logic
# ------------------------------------------------------------------------------

if [[ "$(uname -s)" == "Darwin" ]]; then
  # macOS
  info "Installing Homebrew and packages..."

  if ! command -v brew &> /dev/null; then
    info "Homebrew not found. Installing..."
    execute "/bin/bash" "-c" "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    info "Homebrew already installed."
  fi

  info "Updating Homebrew..."
  execute "brew" "update"

  info "Installing Homebrew packages..."

  formulas=(
    tmux git tig htop tree nmap zsh gnu-tar gnupg
    openssl readline sqlite3 xz zlib tcl-tk
    autoconf wxwidgets libxslt fop
    automake git
    asdf
    wget curl jq
    ripgrep fd fzf ag
    fdk-aac lame libass libtool libvorbis libvpx
    opus sdl2 shtool texi2html theora wget x264 x265 xvid nasm zimg
    frei0r
  )

  for formula in "${formulas[@]}"; do
    if brew list --formula | grep -q "^$formula$"; then
      info "Formula '$formula' is already installed."
    else
      info "Installing formula '$formula'..."
      execute "brew" "install" "$formula"
    fi
  done

  casks=(
    font-fira-code-nerd-font
    font-hack-nerd-font
    font-meslo-lg-nerd-font
  )

  for cask in "${casks[@]}"; do
    if brew list --cask | grep -q "^$cask$"; then
      info "Cask '$cask' is already installed."
    else
      info "Installing cask '$cask'..."
      execute "brew" "install" "--cask" "$cask"
    fi
  done

  # Special case for xcode-select
  if ! xcode-select -p &>/dev/null; then
      info "Installing Xcode Command Line Tools..."
      execute "xcode-select" "--install"
  else
      info "Xcode Command Line Tools already installed."
  fi

  success "Homebrew packages checked successfully."

elif [[ "$(uname -s)" == "Linux" ]]; then
  # Linux (Debian-based)
  info "Installing apt packages..."

  if [[ $EUID -ne 0 ]]; then
     error "This script must be run as root on Linux"
     exit 1
  fi

  execute "apt-get" "update"
  execute "apt-get" "install" "-y" "build-essential" "libssl-dev" \
      "git" "zsh" "tmux" "htop" \
      "ruby" "python3" "perl" "golang" \
      "mtr" "nmap" "curl" "wget" "jq" \
      "ripgrep" "fd-find"

  # Silversearcher-ag
  if apt-cache show silversearcher-ag &>/dev/null; then
      execute "apt-get" "install" "-y" "silversearcher-ag"
  fi

  # Python & Build Tools
  execute "apt-get" "install" "-y" "python3-pip" "python3-dev" "python3-venv" "build-essential"
  
  # Note: Global pip installs are discouraged on modern Debian/Ubuntu systems 
  # (PEP 668). We rely on ASDF and pipx (configured in 03_install_asdf.sh) 
  # for Python tools like Ansible.

  # Cleanup
  execute "apt-get" "autoremove" "-y"

  success "apt packages installed successfully."
else
  error "Unsupported OS: $OSTYPE"
  exit 1
fi
