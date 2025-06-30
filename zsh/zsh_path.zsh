CUSTOMPATH=(
  $HOME/bin,
  $HOME/gbin,
  $HOME/.local/bin,
  $HOME/go/bin,
  $HOME/.npm-global/bin,
  $HOME/Code/flutter/bin,
  /usr/local/opt/gnu-sed/libexec/gnubin,
  /usr/bin/local,
  /usr/local/bin,
  /usr/local/pgsql/bin,
  /usr/local/php5/bin,
  /opt/local/bin,
  /opt/local/sbin,
  /usr/local/mysql/bin,
  /Applications/Xcode.app/Contents/Developer/usr/bin,
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin",
  $HOME/opt/vert.x-2.1.1/bin,
  $HOME/.composer/vendor/bin,
  $HOME/google-cloud-sdk/bin,
  /opt/local/lib/percona/bin,
  /usr/local/git/bin,
)

if [[ "$OSTYPE" == darwin* ]]; then
  CUSTOMPATH+=(
    $HOME/homebrew/bin,
    $HOME/Library/Android/sdk/tools/bin,
    $HOME/Library/Android/sdk/platform-tools,
    "/Users/alan/miniconda3/bin"
  )
fi

# asdf
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
if [ -f $HOME/.asdf ] ; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi
if [ -f $HOME/.asdf/plugins/golang/set-env.zsh ] ; then
  . $HOME/.asdf/plugins/golang/set-env.zsh
fi

# ruby and gems and cocoapods
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export PATH=$GEM_HOME/ruby/2.6.0/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then
  . "${HOME}/google-cloud-sdk/path.zsh.inc";
fi

# Export the PATH
export PATH="$CUSTOMPATH:$PATH"

export MANPATH="/opt/local/share/man:$MANPATH"

###-tns-completion-start-###
if [ -f /Users/alan/.tnsrc ]; then
    source /Users/alan/.tnsrc
fi
###-tns-completion-end-###