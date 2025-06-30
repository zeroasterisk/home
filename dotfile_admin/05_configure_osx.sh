#!/usr/bin/env bash

#
# Configure OSX settings and install applications
#

# Exit on error
set -e

# Source the helper functions
source "$(dirname "$0")/lib/helpers.sh"

# ------------------------------------------------------------------------------
# Main Logic
# ------------------------------------------------------------------------------

if [[ "$(uname -s)" != "Darwin" ]]; then
  info "Skipping OSX configuration because this is not macOS."
  exit 0
fi

info "Configuring OSX..."

# Clipy clipboard history and snippets
info "Please install Clipy manually from the downloaded DMG."
execute "wget" "-O" "/tmp/Clipy.dmg" "https://github.com/Clipy/Clipy/releases/download/1.2.1/Clipy_1.2.1.dmg"
execute "open" "/tmp/Clipy.dmg"

# Amphetamine to stop going to sleep for a while
info "Please install Amphetamine from the App Store."
execute "open" "https://apps.apple.com/us/app/amphetamine/id937984704?mt=12"

# BetterSnapTool for window positioning
info "Please install BetterSnapTool from the App Store."
execute "open" "https://apps.apple.com/us/app/bettersnaptool/id417375580?mt=12"

# ------------------------------------------------------------------------------
# Configure PATH for GUI applications
# ------------------------------------------------------------------------------

info "Configuring PATH for GUI applications..."

append_path () {
  input="$1"
  value="$2"
  if ! echo $input | /usr/bin/egrep -q "(^|:)$value($|:)" ; then
     if [ "$3" = "after" ] ; then
        echo $input:$value
     else
        echo $value:$input
     fi
  else
    echo $input
  fi
}

append_plist_var() {
  local name="$1"
  local append_value="$2"
  local default_value="$3"
  local current_value=""
  if [ -z "$DRY_RUN" ]; then
    current_value="$(defaults read "$HOME/.MacOSX/environment" "${name}" 2>/dev/null)"
  fi
  [ -z "$current_value" ] && current_value="$default_value"
  local new_value
  new_value="$(append_path "$current_value" "$append_value" after)"
  execute "defaults" "write" "$HOME/.MacOSX/environment" "$name" "$new_value"
  if [ "$current_value" == "$new_value" ]; then
    info "No change to $name in ~/.MacOSX/environment.plist"
  else
    info "Variable $name in ~/.MacOSX/environment.plist would be changed from '$current_value' to '$new_value'"
    info "You will need to log out of your Mac OS X user account and log back in for changes to take effect."
  fi
}

append_plist_var PATH "/usr/local/git/bin" "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/local/bin"

success "OSX configuration complete."