# zsh path configuration

# Add custom paths to the front of the PATH
# typeset -U ensures that the path is unique
typeset -U path

path=(
  $HOME/bin
  $HOME/gbin
  $HOME/.local/bin
  $HOME/go/bin
  $HOME/.npm-global/bin
  $HOME/Code/flutter/bin
  /usr/local/opt/gnu-sed/libexec/gnubin
  /usr/bin/local
  /usr/local/bin
  /usr/local/pgsql/bin
  /usr/local/php5/bin
  /opt/local/bin
  /opt/local/sbin
  /usr/local/mysql/bin
  /Applications/Xcode.app/Contents/Developer/usr/bin
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  $HOME/.composer/vendor/bin
  $HOME/.asdf/bin
  $HOME/.asdf/shims
  $HOME/.jetski/jetski/bin
  $HOME/.antigravity/antigravity/bin
  $HOME/dotfiles/bin
  $HOME/dotfiles/asdf/installs/golang/1.25.0/bin
  $GOBIN
  /opt/podman/bin
  /usr/local/git/bin
  $path
)

if [[ "$OSTYPE" == darwin* ]]; then
  path=(
    $HOME/homebrew/bin
    $HOME/Library/Android/sdk/tools/bin
    $HOME/Library/Android/sdk/platform-tools
    $path
  )
fi

# asdf
if [ -f $HOME/.asdf/plugins/golang/set-env.zsh ] ; then
  . $HOME/.asdf/plugins/golang/set-env.zsh
fi
if [ -f $HOME/.asdf/asdf.sh ] ; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi

# ruby and gems and cocoapods
export GEM_HOME=$HOME/.gem
path=(
  $GEM_HOME/bin
  $GEM_HOME/ruby/2.6.0/bin
  $path
)

export MANPATH="/opt/local/share/man:$MANPATH"
