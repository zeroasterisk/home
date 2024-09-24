#!/bin/bash

# https://github.com/asdf-vm/asdf-plugins?tab=readme-ov-file
#
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang latest
asdf global golang latest


asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

asdf plugin-add yarn
asdf install yarn latest
asdf global yarn latest

asdf plugin-add python
unset ASDF_PYTHON_PATCH_URL
asdf install python latest
asdf global python latest
# If you use pip to install a module like ipython that has binaries.
# You will need to run asdf reshim python for the binary to be in your path.
asdf reshim python

asdf plugin add pipx
asdf install pipx latest
asdf global pipx latest

asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git
asdf install poetry latest
asdf global poetry latest

asdf plugin-add protoc https://github.com/paxosglobal/asdf-protoc.git
asdf install protoc latest
asdf global protoc latest

asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
asdf install rust latest
asdf global rust latest
echo "ripgrep" > $HOME/.default-cargo-crates

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
# export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl@1.1)"
asdf install erlang ref:master
asdf global erlang ref:master

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir latest
asdf global elixir latest

asdf plugin-add elm https://github.com/asdf-community/asdf-elm.git
asdf install elm latest
asdf global elm latest

asdf plugin-add flutter
asdf install flutter latest
asdf global flutter latest

asdf plugin add yt-dlp
asdf install yt-dlp latest
asdf global yt-dlp latest

asdf plugin add firebase
asdf install firebase latest
asdf global firebase latest

asdf plugin add gcloud https://github.com/jthegedus/asdf-gcloud
asdf install gcloud latest
asdf global gcloud latest

asdf plugin add neovim
asdf install neovim stable
asdf global neovim stable

export CFLAGS="$CFLAGS -I$(brew --prefix)/include"
export LDFLAGS="$LDFLAGS -L$(brew --prefix)/lib"

export ASDF_FFMPEG_ENABLE="graph2dot libaom fontconfig frei0r libass libvorbis libvpx sdl2 libx264 libfdk-aac libopus libmp3lame libass gpl nonfree"
asdf install ffmpeg latest
asdf global ffmpeg latest
