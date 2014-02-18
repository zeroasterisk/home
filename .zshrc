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
# Aliases

alias s='sudo'
alias d='dirs -v'

# global Aliases for common terms
alias -g MVC="models controllers views libs" # eg: ack term MVC

# ackc = ack with a standardized set of folders to look in
ackc() { ack "$*" models views controllers libs config;  } # cake1x
ackC() { ack "$*" Model View Controller Lib Config;  } # cake2x

# git: should switch to zpresto aliases: https://github.com/sorin-ionescu/prezto/tree/master/modules/git
alias gti='git'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gp='git push'
alias gm='git merge'
alias grp='git pull --rebase origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'
alias grr='git pull --rebase origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

alias deploy='ssh cakedeployer@app0 ahm-deploy' # branch/tag  env  site/all  y
alias deploy_fix='ssh cakedeployer@app0 "rmdir ~/.ahm.deploy.lock"'

# shortcuts and remaps
alias vim='vim -p'
alias vi='vim -p'
alias v='vim -p'

# OSX Aliases

# mysql
alias mysql='/opt/local/bin/mysql5'
alias start_mysql_alt='echo "Sudo"; sudo /opt/local/bin/mysqld_safe5 &'
alias stop_mysql_alt='echo "MySQL Root Password"; /opt/local/bin/mysqladmin5 -u root -p shutdown'
alias start_mysql='echo "Sudo"; sudo -u _mysql /opt/local/libexec/mysqld &; sudo ln -s /opt/local/var/run/mysql5/mysqld.sock  /tmp/mysql.sock'
alias stop_mysql='echo "MySQL Root Password"; /opt/local/bin/mysqladmin5 -u root -p shutdown'

alias percona='/opt/local/bin/mysql5'
alias start_percona='echo "Sudo"; sudo launchctl load -w /Library/LaunchDaemons/org.macports.percona-server.plist'
alias stop_percona='echo "Sudo"; sudo launchctl unload -w /Library/LaunchDaemons/org.macports.percona-server.plist'
alias restart_percona='echo "Sudo"; sudo launchctl unload -w /Library/LaunchDaemons/org.macports.percona-server.plist; sudo launchctl load -w /Library/LaunchDaemons/org.macports.percona-server.plist'

# redis


# elasticsearch
alias start_elasticsearch='cd /opt/custom/elasticsearch && ./bin/elasticsearch -p /opt/custom/elasticsearch/es.pid'
alias stop_elasticsearch='kill -TERM $(cat /opt/custom/elasticsearch/es.pid)'

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

alias start_redis='echo "Sudo"; sudo launchctl load -w /Library/LaunchDaemons/org.macports.redis.plist'
alias stop_redis='echo "Sudo"; sudo launchctl unload -w /Library/LaunchDaemons/org.macports.redis.plist'
alias restart_redis='echo "Sudo"; sudo launchctl unload -w /Library/LaunchDaemons/org.macports.redis.plist; sudo launchctl load -w /Library/LaunchDaemons/org.macports.redis.plist'

# cakephp
alias cake13="/Development/AO/cake/console/cake"
alias cake_ao="/Development/AO/cake/console/cake"
alias cake="/Development/AO/cake/console/cake"
alias cake2="/Development/Metrics/lib/Cake/Console/cake"

# other OSXy
alias audio_restart="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' |awk '{print $1}'`"

# -----------------------------------------------------------
# PATH
PATH=~/bin:/usr/bin/local:/usr/local/bin:/usr/local/pgsql/bin:/usr/local/php5/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH
MANPATH="/opt/local/share/man:$MANPATH"
EDITOR=vim
#VISUAL="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
VISUAL="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"
GRADLE_HOME="/opt/local/share/java/gradle"
#"/Development/Mobile/android-sdk-macosx"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# -----------------------------------------------------------
# Private
source ~/.zshrc_private


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
