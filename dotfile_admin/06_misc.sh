#!/bin/bash
# Misc post install cleanup scripts as needed

# Oh My Zsh Themes
p10k_install_path="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

if [[ -d "$p10k_install_path" || -d "powerlevel10k" ]]; then
  echo "powerlevel10k is already installed or present in the current directory. Skipping clone."
else
  echo "Install powerlevel10k theme"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k_install_path"
fi

# Vim
if [[ ! -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]]; then
  echo "Install NeoVim vim-plug"
  curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Installing Vim plugins..."
  nvim --headless +PlugInstall +qall
else
  echo "NeoVim vim-plug is already installed."
  # Optional: Still try to install missing plugins when the script is run
  nvim --headless +PlugInstall +qall
fi