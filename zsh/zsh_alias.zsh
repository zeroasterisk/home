# -----------------------------------------------------------
# Aliases
#   global
#     included from .zshrc

# global Aliases for common terms
alias -g MVC="Model Controller View Lib" # eg: ag term MVC

# git
alias gti='git'
alias g='git'
# overrides the git alias
alias gs='git status'
alias gd='git diff'
alias grp='git pull --rebase origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'
alias grr='git pull --rebase origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

# shortcuts and remaps
alias vim='nvim -p'
alias vi='nvim -p'
alias v='nvim -p'

# Dev shortcuts
alias cc='CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1 claude --allow-dangerously-skip-permissions --dangerously-skip-permissions'

# autocomplete sometimes causes frustration
alias storybook='nocorrect npm run storybook'

# docker
alias d='docker'
[ -f ~/.zsh_alias.docker ] && source ~/.zsh_alias.docker

# Shortcuts for nas
# Push files to a remote host (Generic)
alias rpush='rsync -avzP -e "ssh -o ClearAllForwardings=yes"'
# Pull files from a remote host (Generic)
alias rpull='rsync -avzP -e "ssh -o ClearAllForwardings=yes"'
# Dry-run for rsync (The Safety Switch)
alias rtest='rsync -avzP -n -e "ssh -o ClearAllForwardings=yes"'

# more aliases, custom, if they exist
[ -f ~/.zsh_alias.tmx2 ] && source ~/.zsh_alias.tmx2
