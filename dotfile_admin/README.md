# Dotfiles Administration

This directory contains all the scripts for installing, updating, and managing these dotfiles.

## TL;DR

To get started, run the main installation script from the root of the repository:

```bash
./dotfile_admin/install.sh --install
```

## Usage

The main script is `./install.sh`. It is safe by default and will display a help message if run without any arguments.

```bash
# Display the help message
./install.sh --help

# See what changes would be made without actually doing anything
./install.sh --dry-run

# Install everything
./install.sh --install

# Update all packages
./install.sh --upgrade

# Remove all created symlinks
./install.sh --uninstall
```

### Source

This repository is cloned from `git@github.com:zeroasterisk/home.git`.
