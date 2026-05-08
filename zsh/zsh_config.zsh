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

export ASDF_DATA_DIR="${HOME}/.asdf"

# elixir/erlang iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# Java
export GRADLE_HOME="/opt/local/share/java/gradle"

if [[ "$OSTYPE" == darwin* ]]; then

	# docker-machine env default
	# export DOCKER_TLS_VERIFY="1"
	# export DOCKER_HOST="tcp://192.168.99.100:2376"
	# export DOCKER_CERT_PATH="/Users/alan/.docker/machine/machines/default"
	# export DOCKER_MACHINE_NAME="default"

	export VISUAL="/Applications/SublimeText.app/Contents/SharedSupport/bin/subl"

  if [[ -f /Users/alan/.zsh_config.osx ]]; then
    export HOME=/Users/alan
  fi

  export ANDROID_HOME=/Users/alan/Library/Android/sdk
  if /usr/libexec/java_home >/dev/null 2>&1; then
    export JAVA_HOME=$(/usr/libexec/java_home)
  fi

  # VirtualBox default settings for docker-machine
  #   4 CPU, 6 G RAM, 80 G HDD
  VIRTUALBOX_CPU_COUNT=4
  VIRTUALBOX_MEMORY_SIZE=6144
  VIRTUALBOX_DISK_SIZE=80000

  test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
fi
