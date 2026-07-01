# ~/.zsh/completions.zsh — managed by chezmoi
# Extra completion sources loaded after compinit runs in .zshrc.

# asdf completions are added to fpath in .zshrc before compinit.

# gh (GitHub CLI)
if command -v gh &>/dev/null; then
  eval "$(gh completion -s zsh)"
fi

# gcloud completions are sourced directly in .zshrc after SDK path detection.

# History substring search (pure-zsh, no plugin manager needed)
# Bind after compinit so widgets exist
for _hss in \
  /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh \
  /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh \
  "${HOME}/.zsh/plugins/zsh-history-substring-search.zsh"; do
  if [[ -f "${_hss}" ]]; then
    source "${_hss}"
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    break
  fi
done
unset _hss

# zsh-autosuggestions (Debian/Ubuntu package or Homebrew)
for _autosuggest in \
  /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
  /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh; do
  if [[ -f "${_autosuggest}" ]]; then
    source "${_autosuggest}"
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    break
  fi
done
unset _autosuggest

# zsh-syntax-highlighting (load last — must be after all widgets)
for _syntaxhl in \
  /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; do
  if [[ -f "${_syntaxhl}" ]]; then
    source "${_syntaxhl}"
    break
  fi
done
unset _syntaxhl
