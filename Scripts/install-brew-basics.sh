#!/bin/bash

if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install tig tmux

#!/bin/bash

# Core Utilities
brew install tmux git tig nmap htop tree nmap

# Core for installing python
xcode-select --install
brew install openssl readline sqlite3 xz zlib tcl-tk
brew install autoconf wxwidgets libxslt fop
brew install automake git

# Network & Data Transfer
brew install wget curl

# Data Processing
brew install jq

# Search & File Management
brew install ripgrep exa fd fzf ag

# Shell & Configuration
brew install zsh oh-my-zsh

# For ffmpeg
brew install fdk-aac lame libass libtool libvorbis libvpx
brew install opus sdl2 shtool texi2html theora wget x264 x265 xvid nasm zimg
brew install frei0r


# Text Processing & Viewing
# (asdf) brew install bat neovim

# Vim plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
vim +PluginInstall +qall

# Nerdy fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
brew install --cask font-hack-nerd-font
brew install --cask font-meslo-lg-nerd-font


