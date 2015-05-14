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

# -----------------------------------------------------------
# vim movement on zsh lines
# http://www.techrepublic.com/blog/linux-and-open-source/using-vi-key-bindings-in-bash-and-zsh/193/
# press [ESC] (as you would in vim) and use vi key commands to navigate the
# command line, such as $ to go the end of the line or 0 to go to the beginning
# of the line.
bindkey -v

# -----------------------------------------------------------
# PATH
[ -f ~/.zsh_path ] && source ~/.zsh_path
[ -f ~/.zsh_path.osx ] && source ~/.zsh_path.osx
[ -f ~/.zsh_path.ubuntu ] && source ~/.zsh_path.ubuntu

PATH=~/bin:/usr/bin/local:/usr/local/bin:/usr/local/pgsql/bin:/usr/local/php5/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH
PATH=$PATH:$HOME/opt/vert.x-2.1.1/bin
PATH=$PATH:$HOME/opt/local/heroku/bin
PATH=$PATH:$HOME/.rvm/bin
PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH=$PATH

MANPATH="/opt/local/share/man:$MANPATH"
#VISUAL="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"

# -----------------------------------------------------------
# Aliases
[ -f ~/.zsh_alias ] && source ~/.zsh_alias
[ -f ~/.zsh_alias.osx ] && source ~/.zsh_alias.osx
[ -f ~/.zsh_alias.ubuntu ] && source ~/.zsh_alias.ubuntu

# -----------------------------------------------------------
# Private
[ -f ~/.zshrc_private ] && source ~/.zshrc_private


[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by travis gem
[ -f /Users/admin/.travis/travis.sh ] && source /Users/admin/.travis/travis.sh
