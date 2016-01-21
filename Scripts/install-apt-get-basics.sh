#!/bin/bash
V=`lsb_release -rs`

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

apt-get update
apt-get install -y build-essential libssl-dev \
    git zsh tmux htop \
    npm ruby python perl golang \
    mtr nmap

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# elixir
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir

# pip python packages
pip install -U pip setuptools
pip install wheel

if [[ $V -gt 12 ]]
then
    # not available in some distros: https://github.com/ggreer/the_silver_searcher
    apt-get install -y silversearcher-ag
fi

# cleanup trash
apt-get autoremove


