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

# place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
#   if [[ -f .nvmrc && -r .nvmrc ]]; then
#     nvm use
#   elif [[ $(nvm version) != $(nvm version default)  ]]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc


[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*




# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh




export NVM_DIR="/Users/alan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

###-tns-completion-start-###
if [ -f /Users/alan/.tnsrc ]; then
    source /Users/alan/.tnsrc
fi
###-tns-completion-end-###

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Python virtual env setup
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

