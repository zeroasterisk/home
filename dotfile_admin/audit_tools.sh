#!/usr/bin/env bash

#
# Audit Tools
#
# This script checks for potential tool collisions (e.g. tool installed via Brew and ASDF).
# It identifies which version is active and warns about shadowing.
#

ADMIN_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$ADMIN_DIR/lib/helpers.sh"

info "--- Starting Tool Audit ---"

# List of tools to check (Common ones that might collide)
tools=(
  "node" "npm" "yarn" "python" "pip" "go" "rustc" "elixir" "erl" "nvim" "gcloud" "firebase" "uv" "bun" "git" "tmux" "zsh"
)

audit_tool() {
  local tool="$1"
  info "Auditing: $tool"
  
  # Find all occurrences in PATH
  local paths=($(which -a "$tool" 2>/dev/null))
  
  if [ ${#paths[@]} -eq 0 ]; then
    warn "  [NOT FOUND] $tool is not in your PATH."
    return
  fi

  local active="${paths[0]}"
  info "  [ACTIVE] $active"

  # Check Brew
  local is_brew=false
  if command -v brew &>/dev/null; then
    if brew list --formula | grep -q "^$tool$"; then
      is_brew=true
      info "  [BREW]   Installed via Homebrew."
    fi
  fi

  # Check ASDF
  local is_asdf=false
  if command -v asdf &>/dev/null; then
    if asdf list "$tool" &>/dev/null; then
      is_asdf=true
      info "  [ASDF]   Managed by ASDF."
    fi
  fi

  # Identify Collisions
  if [ "$is_brew" = true ] && [ "$is_asdf" = true ]; then
    warn "  [COLLISION] Found in both Brew and ASDF."
    if [[ "$active" == *".asdf"* ]]; then
      info "    ASDF version is currently taking precedence."
    elif [[ "$active" == *"/opt/homebrew"* ]] || [[ "$active" == *"/usr/local/bin"* ]]; then
      warn "    Homebrew/System version is shadowing the ASDF version!"
    fi
  fi

  # Identify "Unknown" sources
  for p in "${paths[@]}"; do
    if [[ "$p" != *".asdf"* ]] && [[ "$p" != *"/opt/homebrew"* ]] && [[ "$p" != *"/usr/local/bin"* ]] && [[ "$p" != *"$HOME/bin"* ]]; then
      warn "  [OTHER] Found unexpected source: $p"
    fi
  done
  
  echo ""
}

for tool in "${tools[@]}"; do
  audit_tool "$tool"
done

info "--- Audit Complete ---"
info "Recommendations:"
info "1. If a tool is in ASDF, consider 'brew uninstall' the Homebrew version to avoid confusion."
info "2. If 'OTHER' sources are found, you may want to manually remove them or move them to ~/bin."
info "3. Ensure your PATH in zsh_path.zsh prefers the tools you want (ASDF shims usually come first)."
