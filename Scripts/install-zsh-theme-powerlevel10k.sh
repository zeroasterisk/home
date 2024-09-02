#!/bin/bash

cd $HOME/dotfiles

git submodule add https://github.com/romkatv/powerlevel10k.git powerlevel10k
git submodule init
git submodule update

ln -s $HOME/dotfiles/powerlevel10k $HOME/dotfiles/oh-my-zsh/custom/themes/powerlevel10k

ln -s $HOME/.p10k.zsh $HOME/dotfiles/zsh/p10k.zsh

cd powerlevel10k
git checkout master
git pull origin master
cd ..

