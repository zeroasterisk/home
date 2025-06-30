#!/usr/bin/env bash

#
# Install global npm packages
#

# Exit on error
set -e

# Source the helper functions
source "$(dirname "$0")/lib/helpers.sh"

# ------------------------------------------------------------------------------
# Main Logic
# ------------------------------------------------------------------------------

info "Checking global npm packages..."

if ! command -v npm &> /dev/null; then
  info "npm not found. Please install Node.js first."
  exit 1
fi

packages=(
  aws-cli
  gulp-cli
  grunt-cli
  watchr
  jasmine-node
  jasmine-reporters
  eslint
  eslint-plugin-meteor
  eslint-plugin-angular
  eslint-plugin-react
  eslint-plugin-lodash
  jshint
  pm2
)

for package in "${packages[@]}"; do
  if npm list -g --depth=0 | grep -q "$package@"; then
    info "npm package '$package' is already installed."
  else
    info "Installing npm package '$package'..."
    execute "npm" "install" "-g" "$package"
  fi
done

success "Global npm packages checked successfully."
