#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# ===============================
[ -f ~/.zsh_config ] && source ~/.zsh_config
[ -f ~/.zsh_config.osx ] && source ~/.zsh_config.osx
[ -f ~/.zsh_config.ubuntu ] && source ~/.zsh_config.ubuntu

# -----------------------------------------------------------
# PATH
[ -f ~/.zsh_path ] && source ~/.zsh_path
[ -f ~/.zsh_path.osx ] && source ~/.zsh_path.osx
[ -f ~/.zsh_path.ubuntu ] && source ~/.zsh_path.ubuntu


# -----------------------------------------------------------
# Aliases
[ -f ~/.zsh_alias ] && source ~/.zsh_alias
[ -f ~/.zsh_alias.osx ] && source ~/.zsh_alias.osx
[ -f ~/.zsh_alias.ubuntu ] && source ~/.zsh_alias.ubuntu

# -----------------------------------------------------------
# Private
[ -f ~/.zshrc_private ] && source ~/.zshrc_private

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh




export NVM_DIR="/Users/alan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
