# Alan's Dotfiles

This repository contains my personal dotfiles and configurations, managed entirely via automated scripts. The environment uses [Homebrew](https://brew.sh/) for OS packages, [ASDF](https://asdf-vm.com/) for language runtimes, [vim-plug](https://github.com/junegunn/vim-plug) for NeoVim, and [TPM](https://github.com/tmux-plugins/tpm) for Tmux.

## 🚀 Core Workflows

All operations are designed to be **idempotent**, meaning you can run them safely as many times as you like.

### 1. Install on a Fresh System
To setup a brand new machine, clone the repository to your home directory and run the installer:

```bash
cd ~
git clone git@github.com:zeroasterisk/home.git dotfiles
cd dotfiles
./dotfile_admin/install.sh --install
```

### 2. Update an Existing System (Syncing)
If you made changes to your dotfiles on another machine and want to pull them down, simply fetch the latest code and re-run the installer. It will safely update symlinks and download any missing packages or plugins:

```bash
cd ~/dotfiles
git pull
./dotfile_admin/install.sh --install
```

### 3. Upgrading Versions & Committing
When you want to bump your system to the latest versions of everything (Brew, ASDF languages, Vim/Tmux plugins) and save that state back to this repository, run the upgrade command. It will automatically update your `.tool-versions` file and commit the changes:

```bash
cd ~/dotfiles
./dotfile_admin/install.sh --upgrade
git push
```

## More Details
For more detailed instructions and other management commands (like `--dry-run` or `--uninstall`), please see the [Dotfiles Administration README](./dotfile_admin/README.md).
