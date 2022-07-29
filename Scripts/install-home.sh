#!/bin/bash
cd $HOME
git clone https://github.com/zeroasterisk/home.git dotfiles
cd dotfiles
git submodule update --init --recursive

# other clones which are not submodules
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git oh-my-zsh/custom/themes/powerlevel10k

# run script to setup dirs and symlinks
./bin/dotfiles

# setup vim
vim +BundleInstall +qall
#zsh
#chsh -s /bin/zsh
