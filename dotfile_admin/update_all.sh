#!/usr/bin/env bash

#
# Update All Tools
#
# This script updates Homebrew, ASDF plugins, and all installed tools.
#

# Source the helper functions
ADMIN_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$ADMIN_DIR/lib/helpers.sh"

info "--- Starting Global Update ---"

# 1. Homebrew
if command -v brew &> /dev/null; then
  info "Updating Homebrew and packages..."
  execute "brew" "update"
  execute "brew" "upgrade"
  execute "brew" "cleanup"
else
  warn "Homebrew not found, skipping."
fi

# 2. ASDF
if command -v asdf &> /dev/null; then
  info "Updating ASDF plugins and tools..."
  # Update asdf itself
  execute "asdf" "update"
  
  # Update all plugins
  execute "asdf" "plugin" "update" "--all"
  
  # Install any missing versions from .tool-versions
  info "Checking for missing tool versions in .tool-versions..."
  execute "asdf" "install"
else
  warn "ASDF not found, skipping."
fi

# 3. Bun
if command -v bun &> /dev/null; then
  info "Updating Bun..."
  execute "bun" "upgrade"
fi

# 4. UV
if command -v uv &> /dev/null; then
  info "Updating UV..."
  execute "uv" "self" "update"
fi

success "--- All tools updated successfully! ---"
