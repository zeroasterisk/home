#!/bin/bash

if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install tig tmux

#!/bin/bash

# Core Utilities
brew install tmux git tig nmap

# Core for installing python
xcode-select --install
brew install openssl readline sqlite3 xz zlib tcl-tk
brew install autoconf wxwidgets libxslt fop
brew install automake fdk-aac git lame libass libtool libvorbis libvpx \
  opus sdl2 shtool texi2html theora wget x264 x265 xvid nasm zimg

# System Monitoring & Navigation
brew install htop tree

# Network & Data Transfer
brew install wget curl

# Data Processing
brew install jq

# Search & File Management
brew install ripgrep exa fd fzf ag

# Shell & Configuration
brew install zsh oh-my-zsh

# Text Processing & Viewing
brew install bat neovim

# Vim plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

# Nerdy fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
brew install --cask font-hack-nerd-font
brew install --cask font-meslo-lg-nerd-font


