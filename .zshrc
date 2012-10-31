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
# -----------------------------------------------------------
# Aliases
alias GR='git pull --rebase origin "$(git-branch-current 2> /dev/null)"'
alias GU='git pull origin "$(git-branch-current 2> /dev/null)"'
alias GP='git push origin "$(git-branch-current 2> /dev/null)"'
alias GS='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'
alias GSR='git pull --rebase origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'
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
alias stop_mysql='echo "MySQL Root Password"; /opt/local/bin/mysqladmin5 -u root -p shutdown'

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
alias cake2="/Development/Metrics/lib/Cake/Console/cake"



# -----------------------------------------------------------
# PATH
PATH=~/bin:/usr/bin/local:/usr/local/bin:/usr/local/pgsql/bin:/usr/local/php5/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH
MANPATH="/opt/local/share/man:$MANPATH"
EDITOR="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"

# -----------------------------------------------------------
# Private
source .zshrc_private

