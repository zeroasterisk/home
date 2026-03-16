# Dotfiles Administration

This directory contains all the scripts for installing, updating, and managing these dotfiles.

## 🚀 Core Workflows

Our administration scripts are idempotent. The `install.sh` script is the primary entry point for managing the lifecycle of your dotfiles across different machines.

### 1. Install on a Fresh System
To bootstrap a new machine, clone the repository and run the install command. This will symlink your configs, install Homebrew, ASDF, Vim plugins, and Tmux plugins automatically.

```bash
cd ~
git clone git@github.com:zeroasterisk/home.git dotfiles
cd dotfiles
./dotfile_admin/install.sh --install
```

### 2. Update an Existing System (Syncing)
To sync changes made on another machine (e.g. you added a new ASDF language to `.tool-versions` or a new plugin to `plugins.vim`), just pull the repository and run the install command again. It safely skips what is already installed.

```bash
cd ~/dotfiles
git pull
./dotfile_admin/install.sh --install
```

### 3. Upgrading Versions & Committing
To bump all packages on your local machine to their latest available versions (Homebrew, npm globals, ASDF plugins, Vim/Tmux plugins), run the upgrade command. **This script will automatically update your `.tool-versions` file and create a git commit.**

```bash
cd ~/dotfiles
./dotfile_admin/install.sh --upgrade
git push
```

## Full Usage

The main script is `./install.sh`. It is safe by default and will display a help message if run without any arguments.

```bash
# Display the help message
./install.sh --help

# See what changes would be made without actually doing anything
./install.sh --dry-run

# Install everything (safe to run multiple times)
./install.sh --install

# Upgrade all packages to latest, update .tool-versions, and git commit
./install.sh --upgrade

# Remove all created symlinks
./install.sh --uninstall
```
