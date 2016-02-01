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
    ruby python perl golang \
    mtr nmap

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# docker
rm -rf /etc/apt/sources.list.d/docker.list
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
if [[ $V == "14.04" ]]
then
	echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
fi
if [[ $V == "15.05" ]]
then
	echo "deb https://apt.dockerproject.org/repo ubuntu-vivid main" >> /etc/apt/sources.list.d/docker.list
fi
if [[ $V == "15.10" ]]
then
	echo "deb https://apt.dockerproject.org/repo ubuntu-wily main" >> /etc/apt/sources.list.d/docker.list
fi
apt-get update
apt-get purge lxc-docker
apt-cache policy docker-engine
apt-get install -y linux-image-extra-$(uname -r)

# reboot
# sudo apt-get install docker-engine

# elixir
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install -y esl-erlang elixir

# pip python packages
sudo apt-get install -y python-pip python-dev build-essential 
sudo pip install --upgrade pip 
sudo pip install -U pip setuptools 
sudo pip install wheel

if [[ $V -gt 12 ]]
then
    # not available in some distros: https://github.com/ggreer/the_silver_searcher
    apt-get install -y silversearcher-ag
fi

# cleanup trash
apt-get autoremove


