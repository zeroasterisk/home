# Alan's Dotfiles

This repository contains my personal dotfiles and configurations.

## 🚀 Install

To install, run the following command from the root of this repository:

```bash
cd ~
git clone git@github.com:zeroasterisk/home.git dotfiles
cd dotfiles
./dotfile_admin/install.sh --install
```

For more detailed instructions and other management commands (like `--upgrade` or `--uninstall`), please see the [Dotfiles Administration README](./dotfile_admin/README.md).

## Vim

The vim configuration is managed by `vim-plug`. After installation, you can update plugins by running `:PlugUpdate` from within Neovim.
