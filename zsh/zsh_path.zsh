
path=(
  $HOME/bin
  /usr/bin/local
  /usr/local/bin
  /usr/local/pgsql/bin
  /usr/local/php5/bin
  /opt/local/bin
  /opt/local/sbin
  /usr/local/mysql/bin
  /Applications/Xcode.app/Contents/Developer/usr/bin
  /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
  $HOME/opt/vert.x-2.1.1/bin
  /opt/local/lib/percona/bin
  $HOME/.composer/vendor/bin
  $HOME/google-cloud-sdk/bin
  /usr/local/git/bin
  $HOME/.asdf/bin
  $HOME/.asdf/shims
  $HOME/.npm-global/bin
  $ANDROID_HOME/tools/bin
  /usr/local/opt/gnu-sed/libexec/gnubin
  ${HOME}/Code/flutter/bin
  $HOME/.gem/bin
  $HOME/.gem/ruby/2.6.0/bin
  $path
)

# PATH CLEAUP
# There's something funky as hell in the PATH before it gets to .zshenv (etc)
# /bin:/sbin:Vim�UnDo�:/usr/local/git/bin:
# so this will remove it
path=(${path:#Vim*UnDo*})

# Export the PATH
export PATH=$path

MANPATH="/opt/local/share/man:$MANPATH"
export MANPATH=$MANPATH
