#!/bin/bash
git clone git@github.com:zeroasterisk/home.git
mv home/* ./
mv home/.* ./
rmdir home
git submodule update --init --recursive
vim +BundleInstall +qall
