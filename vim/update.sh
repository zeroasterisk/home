#!/usr/bin/env bash
#
# Update all vim plugins managed by vim-plug.

set -e

nvim +PlugUpdate +qall