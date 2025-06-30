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
    tmux git tig nmap htop tree nmap
    openssl readline sqlite3 xz zlib tcl-tk
    autoconf wxwidgets libxslt fop
    automake git
    wget curl
    jq
    ripgrep exa fd fzf ag
    zsh oh-my-zsh
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

  execute "brew" "tap" "homebrew/cask-fonts"

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
      "ruby" "python" "perl" "golang" \
      "mtr" "nmap"

  # Node.js
  execute "curl" "-sL" "https://deb.nodesource.com/setup_4.x" "|" "sudo" "-E" "bash" "-"
  execute "sudo" "apt-get" "install" "-y" "nodejs"

  # Docker
  execute "rm" "-rf" "/etc/apt/sources.list.d/docker.list"
  execute "sudo" "apt-key" "adv" "--keyserver" "hkp://p80.pool.sks-keyservers.net:80" "--recv-keys" "58118E89F3A912897C070ADBF76221572C52609D"
  V=`lsb_release -rs`
  if [[ $V == "14.04" ]]; then
  	execute "echo" "\"deb https://apt.dockerproject.org/repo ubuntu-trusty main\"" ">>" "/etc/apt/sources.list.d/docker.list"
  elif [[ $V == "15.05" ]]; then
  	execute "echo" "\"deb https://apt.dockerproject.org/repo ubuntu-vivid main\"" ">>" "/etc/apt/sources.list.d/docker.list"
  elif [[ $V == "15.10" ]]; then
  	execute "echo" "\"deb https://apt.dockerproject.org/repo ubuntu-wily main\"" ">>" "/etc/apt/sources.list.d/docker.list"
  fi
  execute "apt-get" "update"
  execute "apt-get" "purge" "lxc-docker"
  execute "apt-cache" "policy" "docker-engine"
  execute "apt-get" "install" "-y" "linux-image-extra-$(uname -r)"

  # Elixir
  execute "wget" "https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb" "&&" "sudo" "dpkg" "-i" "erlang-solutions_1.0_all.deb"
  execute "sudo" "apt-get" "update"
  execute "sudo" "apt-get" "install" "-y" "esl-erlang" "elixir"

  # Pip
  execute "sudo" "apt-get" "install" "-y" "python-pip" "python-dev" "build-essential"
  execute "sudo" "pip" "install" "--upgrade" "pip"
  execute "sudo" "pip" "install" "-U" "pip" "setuptools"
  execute "sudo" "pip" "install" "wheel"
  execute "sudo" "pip" "install" "ansible"

  # Silversearcher-ag
  if [[ $V -gt 12 ]]; then
      execute "apt-get" "install" "-y" "silversearcher-ag"
  fi

  # Cleanup
  execute "apt-get" "autoremove"

  success "apt packages installed successfully."
else
  error "Unsupported OS: $OSTYPE"
  exit 1
fi
