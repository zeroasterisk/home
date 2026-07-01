# ~/.zsh/aliases.zsh — managed by chezmoi
# One canonical set of aliases. No duplicates, no conflicts.

# ── Editor ────────────────────────────────────────────────────────────────────
alias vim='nvim -p'
alias vi='nvim -p'
alias v='nvim -p'

# ── CloudCode ─────────────────────────────────────────────────────────────────
alias cc='cloudcode'

# ── Git — short forms ─────────────────────────────────────────────────────────
alias g='git'
alias gti='git'           # typo guard
alias gs='git status'
alias gd='git diff'       # NB: old prezto had gd=git ls-files; use gdc/gdx below for that

# index / staging
alias gia='git add'
alias giA='git add --patch'
alias giu='git add --update'
alias gid='git diff --no-ext-diff --cached'
alias gir='git reset'
alias giR='git reset --patch'
alias gix='git rm -r --cached'

# conflicts
alias gCl='git --no-pager diff --name-only --diff-filter=U'
alias gCo='git checkout --ours --'
alias gCt='git checkout --theirs --'

# data (ls-files)
alias gdc='git ls-files --cached'
alias gdx='git ls-files --deleted'
alias gdm='git ls-files --modified'
alias gdu='git ls-files --other --exclude-standard'

# branch
alias gb='git branch'
alias gba='git branch --all --verbose'
alias gbc='git checkout -b'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'

# commit
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gcm='git commit --message'
alias gcam='git commit --all --message'
alias gcf='git commit --amend --reuse-message HEAD'
alias gcF='git commit --verbose --amend'

# checkout / switch
alias gco='git checkout'
alias gcO='git checkout --patch'
alias gcp='git cherry-pick --ff'

# fetch / pull / push
alias gf='git fetch'
alias gfa='git fetch --all'
alias gfm='git pull'
alias gfr='git pull --rebase'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpa='git push --all'
alias gpc='git push --set-upstream origin "$(git branch --show-current)"'
alias grp='git pull --rebase origin "$(git branch --show-current)" && git push origin "$(git branch --show-current)"'

# rebase
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'

# stash  (gs = git status above, so stash uses explicit gst prefix)
alias gst='git stash'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gstd='git stash show --patch --stat'
alias gstx='git stash drop'

# log
alias glo='git log --oneline --decorate --graph'
alias gl='git log --topo-order --pretty=format:"%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B"'
alias glg='git log --oneline --all --graph'
alias glc='git shortlog --summary --numbered'

# merge
alias gm='git merge'
alias gmF='git merge --no-ff'
alias gma='git merge --abort'

# remote
alias gR='git remote'
alias gRl='git remote --verbose'
alias gRa='git remote add'

# submodule
alias gS='git submodule'
alias gSI='git submodule update --init --recursive'

# working copy
alias gws='git status --short'
alias gwS='git status'
alias gwd='git diff --no-ext-diff'
alias gwD='git diff --no-ext-diff --word-diff'
alias gwR='git reset --hard'
alias gwr='git reset --soft'
alias gwc='git clean -n'
alias gwC='git clean -f'

# ── Docker ────────────────────────────────────────────────────────────────────
alias d='docker'
[[ -f ~/.zsh_alias.docker ]] && source ~/.zsh_alias.docker

# ── rsync helpers ─────────────────────────────────────────────────────────────
alias rpush='rsync -avzP -e "ssh -o ClearAllForwardings=yes"'
alias rpull='rsync -avzP -e "ssh -o ClearAllForwardings=yes"'
alias rtest='rsync -avzP -n -e "ssh -o ClearAllForwardings=yes"'

# ── Global aliases ────────────────────────────────────────────────────────────
alias -g MVC="Model Controller View Lib"   # e.g.: rg term MVC

# ── Misc ──────────────────────────────────────────────────────────────────────
alias storybook='nocorrect npm run storybook'
