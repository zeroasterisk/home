#!/bin/bash
# -----------------------
# installing vim from source on OSX
# -----------------------
# http://brilliantcorners.org/2011/02/building-vim-on-osx-snow-leopard/
# -----------------------
# fetch the source into a vim directory
hg clone https://vim.googlecode.com/hg/ vim
cd vim
# make sure you're up to date
hg pull
hg update
# configure and build
./configure --enable-perlinterp=yes --enable-pythoninterp=yes --enable-rubyinterp=yes --disable-netbeans --with-features=huge
make
make install

# In order to make sure that this Vim is used when typing vim at the command line, make sure that /usr/local/bin comes first in your path.
# This way our full-featured Vim at /usr/local/bin/vim will be called instead of the OSX built-in version at /usr/bin/vim.
# For reference, this is how I set path in my ~/.bashrc:
# export PATH="/usr/local/bin:/usr/local/pgsql/bin:/usr/local/php5/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
