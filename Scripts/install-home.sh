#!/bin/bash
cd $HOME
git clone https://github.com/zeroasterisk/home.git dotfiles
cd dotfiles 
git submodule update --init --recursive

./bin/dotfiles

vim +BundleInstall +qall
#zsh
#chsh -s /bin/zsh
