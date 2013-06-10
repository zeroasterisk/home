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


# global Aliases for common terms
alias -g MVC="models controllers views libs" # eg: ack term MVC

# ackc = ack with a standardized set of folders to look in
ackc() { ack "$*" models views controllers libs;  } # cake1x
ackC() { ack "$*" Models Views Controllers Libs;  } # cake2x

# git: should switch to zpresto aliases: https://github.com/sorin-ionescu/prezto/tree/master/modules/git
alias gti='git'
alias gs='git status'
alias gd='git diff'
alias grp='git pull --rebase origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

alias deploy='ssh cakedeployer@app0 ahm-deploy' # branch/tag  env  site/all  y
alias deploy_fix='ssh cakedeployer@app0 rmdir ~/.ahm.deploy.lock'

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
alias start_php='echo "Sudo"; sudo launchctl load -w /Library/LaunchDaemons/org.macports.php54-fpm.plist'
alias stop_php='echo "Sudo"; sudo launchctl unload -w /Library/LaunchDaemons/org.macports.php54-fpm.plist'
alias restart_php='echo "Sudo"; sudo launchctl unload -w /Library/LaunchDaemons/org.macports.php54-fpm.plist; sudo launchctl load -w /Library/LaunchDaemons/org.macports.php54-fpm.plist'
alias start_phpcgi='php-cgi -q -b 127.0.0.1:9000 &'
alias stop_phpcgi='killall php-cgi'
alias restart_phpcgi='killall php-cgi; php-cgi -q -b 127.0.0.1:9000 &'

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
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# -----------------------------------------------------------
# Private
source ~/.zshrc_private

