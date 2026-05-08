# zsh path configuration

# Add custom paths to the front of the PATH
# typeset -U ensures that the path is unique
typeset -U path
path=(
  $GOBIN
  $HOME/.antigravity/antigravity/bin
  $HOME/.asdf/bin
  $HOME/.asdf/installs/rust/1.89.0/bin
  $HOME/.asdf/shims
  $HOME/.bun/bin
  $HOME/.composer/vendor/bin
  $HOME/.jetski/jetski/bin
  $HOME/.local/bin
  $HOME/.local/share/pnpm
  $HOME/.npm-global/bin
  $HOME/Code/flutter/bin
  $HOME/bin
  $HOME/dotfiles/asdf/installs/golang/1.25.0/bin
  $HOME/dotfiles/bin
  $HOME/gbin
  $HOME/go/bin
  /Applications/Xcode.app/Contents/Developer/usr/bin
  /opt/local/bin
  /opt/local/sbin
  /opt/podman/bin
  /usr/bin/local
  /usr/local/bin
  /usr/local/git/bin
  /usr/local/mysql/bin
  /usr/local/opt/gnu-sed/libexec/gnubin
  /usr/local/pgsql/bin
  /usr/local/php5/bin
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
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
