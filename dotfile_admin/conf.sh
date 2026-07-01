#!/usr/bin/env bash

# dotfiles configuration

export DOTFILES_SYMLINKS=(
  "asdf:$HOME/.asdf"
  "oh-my-zsh:$HOME/.oh-my-zsh"
  "gem/gemrc:$HOME/.gemrc"
  "git:$HOME/.git"
  "git/gitconfig:$HOME/.gitconfig"
  "git/gitk:$HOME/.gitk"
  "tmux/.tmux.conf:$HOME/.tmux.conf"
  "tmux.conf.local:$HOME/.tmux.conf.local"
  "terminfo:$HOME/.terminfo"
  "bin:$HOME/bin"
  "vim:$HOME/.vim"
  "vim/vimrc:$HOME/.vimrc"
  "config/cloudcode/AGENTS.md:$HOME/.config/cloudcode/AGENTS.md"
  "config/cloudcode/cloudcode.json:$HOME/.config/cloudcode/cloudcode.json"
  "config/cloudcode/tui.json:$HOME/.config/cloudcode/tui.json"
  "config/gh/config.yml:$HOME/.config/gh/config.yml"
  "config/gcloud/configurations/config_default:$HOME/.config/gcloud/configurations/config_default"
  "config/nvim/init.vim:$HOME/.config/nvim/init.vim"
  "zsh:$HOME/.zsh"
  "zsh/zshrc:$HOME/.zshrc"
  "zsh/p10k.zsh:$HOME/.p10k.zsh"
  "tool-versions:$HOME/.tool-versions"
)

export BREW_FORMULAS=(
  tmux git tig htop tree nmap zsh gnu-tar gnupg
  openssl readline sqlite3 xz zlib tcl-tk
  autoconf wxwidgets libxslt fop
  automake
  asdf
  wget curl jq
  ripgrep fd fzf ag
  uv bun
  fdk-aac lame libass libtool libvorbis libvpx
  opus sdl2 shtool texi2html theora x264 x265 xvid nasm zimg
  frei0r
)

export BREW_CASKS=(
  font-fira-code-nerd-font
  font-hack-nerd-font
  font-meslo-lg-nerd-font
)

export APT_PACKAGES=(
  build-essential libssl-dev git zsh tmux htop ruby python3 perl golang
  mtr nmap curl wget jq ripgrep fd-find silversearcher-ag
  python3-pip python3-dev python3-venv
)

export NPM_GLOBALS=(
  aws-cli gulp-cli grunt-cli watchr jasmine-node jasmine-reporters
  eslint eslint-plugin-meteor eslint-plugin-angular eslint-plugin-react
  eslint-plugin-lodash jshint pm2
)

export ASDF_PLUGINS=(
  "golang:https://github.com/asdf-community/asdf-golang.git"
  "nodejs:https://github.com/asdf-vm/asdf-nodejs.git"
  "yarn"
  "python"
  "pipx"
  "protoc:https://github.com/paxosglobal/asdf-protoc.git"
  "rust:https://github.com/code-lever/asdf-rust.git"
  "erlang:https://github.com/asdf-vm/asdf-erlang.git"
  "elixir:https://github.com/asdf-vm/asdf-elixir.git"
  "elm:https://github.com/asdf-community/asdf-elm.git"
  "flutter"
  "yt-dlp"
  "firebase"
  "gcloud:https://github.com/jthegedus/asdf-gcloud"
  "neovim"
)