#!/bin/bash
git clone https://github.com/zeroasterisk/home.git
mv home/* ./ && mv home/.[a-z]* ./ && rmdir home
git remote add write git@github.com:zeroasterisk/home.git
git submodule update --init --recursive
vim +BundleInstall +qall
zsh
chsh -s /bin/zsh
