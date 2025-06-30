
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
  $HOME/dotfiles/asdf/installs/golang/1.23.1/bin
  $HOME/dotfiles/asdf/installs/python/3.11.3/bin
  $HOME/.npm-global/bin
  /usr/local/opt/gnu-sed/libexec/gnubin
  ${HOME}/Code/flutter/bin
  $HOME/.gem/bin
  $HOME/.gem/ruby/2.6.0/bin
  $HOME/.asdf/bin
  $HOME/.asdf/shims
  $PATH
)

# PATH CLEAUP
# There's something funky as hell in the PATH before it gets to .zshenv (etc)
# /bin:/sbin:Vim�UnDo�:/usr/local/git/bin:
# so this will remove it
PATH=`echo $PATH | LANG=C sed -e 's/Vim[^\x00-\x7F]UnDo[^\x00-\x7F]://'`

# Export the PATH
export PATH=$PATH

MANPATH="/opt/local/share/man:$MANPATH"
