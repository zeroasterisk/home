#!/bin/bash

apt-get update
apt-get install -y build-essential libssl-dev \
    git zsh tmux htop \
    silversearcher-ag \ # not available in some distros: https://github.com/ggreer/the_silver_searcher
    npm ruby python perl golang \
    mtr nmap

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# elixir
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang
sudo apt-get install elixir

# pip python packages
pip install -U pip setuptools
pip install wheel
