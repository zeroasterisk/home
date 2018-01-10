# -----------------------------------------------------------
# Config
#   ALL OS
#     included from .zshrc
#     look for .zsh_config.osx and .zsh_config.ubuntu

# -----------------------------------------------------------
# vim movement on zsh lines
# http://www.techrepublic.com/blog/linux-and-open-source/using-vi-key-bindings-in-bash-and-zsh/193/
# press [ESC] (as you would in vim) and use vi key commands to navigate the
# command line, such as $ to go the end of the line or 0 to go to the beginning
# of the line.
bindkey -v


# https://github.com/junegunn/fzf
# Setting ag as the default source for fzf
# export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!.meteor/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# elixir/erlang iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# Java
export GRADLE_HOME="/opt/local/share/java/gradle"

# Javascript
#node paths disabled in favor of using `nvm`
#export NPM_PACKAGES="$HOME/.npm-packages"
#export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
#export PATH="$NPM_PACKAGES/bin:$PATH"



###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
