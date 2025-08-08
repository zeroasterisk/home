#!/bin/bash
# Misc post install cleanup scripts as needed

cd $HOME

# Oh My Zsh Themes

if [[ ! -f ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]]:
  echo "Install powerlevel10k theme"

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

fi

# Vim

if [[ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]]:
  echo "Install NeoVim vim-plug"

  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

fi
