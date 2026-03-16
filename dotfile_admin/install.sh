#!/usr/bin/env bash

#
# Dotfiles Management Script
#
# This script installs, updates, and manages the dotfiles configuration.
#

# Exit on error
set -e

# ------------------------------------------------------------------------------
# Helper Functions
# ------------------------------------------------------------------------------

# The root directory of the dotfiles repository
DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ADMIN_DIR="$DOTFILES_DIR/dotfile_admin"

# Source the helper functions
source "$ADMIN_DIR/lib/helpers.sh"

# Display the help message
display_help() {
  echo "Dotfiles Management Script"
  echo ""
  echo "Usage: ./install.sh [command]"
  echo ""
  echo "Commands:"
  echo "  --help         Display this help message."
  echo "  --dry-run      Show what the --install command would do without making changes."
  echo "  --install      Install all dotfiles, packages, and applications."
  echo "  --minimal      Install ONLY symlinks for limited systems (e.g., NAS)."
  echo "  --upgrade      Update all installed packages and tools."
  echo "  --uninstall    Remove all created dotfiles symlinks."
  echo ""
}

# Run the installation scripts
run_install() {
  local is_minimal="${1:-false}"
  info "Starting dotfiles installation..."

  local scripts_to_run=()
  if [[ "$is_minimal" == "true" ]]; then
    info "Running in MINIMAL mode. Only symlinks will be created."
    scripts_to_run=("$ADMIN_DIR/01_setup_symlinks.sh")
  else
    for script in "$ADMIN_DIR"/0?_*.sh; do
      scripts_to_run+=("$script")
    done
  fi

  for script in "${scripts_to_run[@]}"; do
    if [ -f "$script" ] && [ -x "$script" ]; then
      info "Running $(basename "$script")..."
      "$script"
    else
      warn "Skipping non-executable or missing script: $(basename "$script")"
    fi
  done
  success "Dotfiles installation complete!"
}

# ------------------------------------------------------------------------------
# Main Dispatcher
# ------------------------------------------------------------------------------

case "$1" in
  --install)
    export DRY_RUN=""
    run_install "false"
    ;;
  --minimal)
    export DRY_RUN=""
    run_install "true"
    ;;
  --dry-run)
    export DRY_RUN=1
    run_install "false"
    ;;
  --upgrade)
    info "Upgrading packages..."
    bash "$ADMIN_DIR/upgrade.sh"
    success "Upgrade complete!"
    ;;
  --uninstall)
    info "Uninstalling dotfiles..."
    bash "$ADMIN_DIR/uninstall.sh"
    success "Uninstallation complete!"
    ;;
  --help|*)
    display_help
    exit 0
    ;;
esac
