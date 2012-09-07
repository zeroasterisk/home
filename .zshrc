# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="alanpeabody"
#ZSH_THEME="dieter"
#ZSH_THEME="eastwood"
#ZSH_THEME="gallois"
ZSH_THEME="fishy"
#ZSH_THEME="miloshadzic"
#ZSH_THEME="mrtazz"
#ZSH_THEME="terminalparty"
#ZSH_THEME="muse"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow sublime macports mysql-macports)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# -----------------------------------------------------------
# Aliases
alias GR='git pull --rebase origin $(current_branch)'
compdef GR=git
alias GU='git pull origin $(current_branch)'
compdef GU=git
alias GP='git push origin $(current_branch)'
compdef GP=git
alias GS='git pull origin $(current_branch) && git push origin $(current_branch)'
compdef GS=git
alias GSR='git pull --rebase origin $(current_branch) && git push origin $(current_branch)'
compdef GSR=git

alias gti='git'


# shortcuts and remaps
alias vim='vim -p'
alias vi='vim -p'

# OSX Aliases

# mysql
alias mysql='/opt/local/bin/mysql5'
alias start_mysql_alt='echo "Sudo"; sudo /opt/local/bin/mysqld_safe5 &'
alias stop_mysql_alt='echo "MySQL Root Password"; /opt/local/bin/mysqladmin5 -u root -p shutdown'
alias start_mysql='echo "Sudo"; sudo -u _mysql /opt/local/libexec/mysqld &; sudo ln -s /opt/local/var/run/mysql5/mysqld.sock  /tmp/mysql.sock'
alias stop_mysql='echo "MySQL Root Password"; 666666666666666666666666666666666666/opt/local/bin/mysqladmin5 -u root -p shutdown'

# nginx
alias start_nginx='echo "Sudo"; sudo launchctl load -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias stop_nginx='echo "Sudo"; sudo launchctl unload -w /Library/LaunchDaemons/org.macports.nginx.plist'
alias restart_nginx='echo "Sudo"; sudo launchctl unload -w /Library/LaunchDaemons/org.macports.nginx.plist; sudo launchctl load -w /Library/LaunchDaemons/org.macports.nginx.plist'

# php
alias start_php='php-cgi -q -b 127.0.0.1:9000 &'
alias stop_php='killall php-cgi'
alias restart_php='killall php-cgi; php-cgi -q -b 127.0.0.1:9000 &'

# cakephp
alias cake13="/Development/AO/cake/console/cake"
alias cake_ao="/Development/AO/cake/console/cake"
alias cake="/Development/AO/cake/console/cake"

# -----------------------------------------------------------
# AUTOCOMPLETE TWEAKS
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt no_list_beep
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*' add-space true
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list
zstyle ':completion:*' menu select=1
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ${(s.:.)ZLS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=** r:|=**'
zstyle ':completion:*' menu select
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*' group 1
zstyle ':completion:*' format '%B---- %d%b'
zstyle ':completion:*:corrections' format '%B---- %d (errors %e)%b'
zstyle ':completion:*:descriptions' format "%B---- %d%b"
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
zstyle ':completion:*:warnings' format "%B$fg[red]%}---- no match for: $fg[white]%d%b"
zstyle ':completion:*' group-name ''

# -----------------------------------------------------------
# screen / tmux
# tmux doesn't like the autotitle atm :(
export DISABLE_AUTO_TITLE="true"
# screen custom autotitle function HOST|#
function title {
  [ "$DISABLE_AUTO_TITLE" != "true" ] || return
  if [[ "$TERM" == screen* ]]; then
    print -Pn "\ek$HOST|$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a" #set window name
    print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
  fi
}

# -----------------------------------------------------------
# PATH
PATH=~/bin:/usr/bin/local:/usr/local/bin:/usr/local/pgsql/bin:/usr/local/php5/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH
MANPATH="/opt/local/share/man:$MANPATH"
EDITOR="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
