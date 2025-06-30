#!/usr/bin/env bash

#
# Upgrade all packages
#

# Exit on error
set -e

# Source the helper functions
source "$(dirname "$0")/lib/helpers.sh"

# ------------------------------------------------------------------------------
# Main Logic
# ------------------------------------------------------------------------------

info "Upgrading Homebrew..."
brew update
brew upgrade

info "Upgrading asdf plugins..."
asdf plugin-update --all

info "Upgrading global npm packages..."
npm update -g

success "All packages upgraded successfully."
