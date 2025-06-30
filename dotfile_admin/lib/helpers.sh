#!/usr/bin/env bash

#
# Helper Functions
#

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

_log_prefix() {
  if [ -n "$DRY_RUN" ]; then
    printf "${YELLOW}[DRY RUN]${NC} "
  fi
}

info() {
  _log_prefix
  printf "${GREEN}INFO:${NC} %s\n" "$1"
}

warn() {
  _log_prefix
  printf "${YELLOW}WARN:${NC} %s\n" "$1"
}

error() {
  _log_prefix
  printf "${RED}ERROR:${NC} %s\n" "$1" >&2
}

success() {
  _log_prefix
  printf "${GREEN}SUCCESS:${NC} %s\n" "$1"
}

# execute
#
# A wrapper around commands that change the filesystem.
# If the DRY_RUN variable is set, it will only print the command.
# Otherwise, it will execute it.
#
# Usage:
#   execute "mv" "file1" "file2"
#   execute "ln" "-s" "source" "target"
#
execute() {
  if [ -n "$DRY_RUN" ]; then
    info "Would execute: $@"
  else
    "$@"
  fi
}