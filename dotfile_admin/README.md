# Dotfiles Administration

This directory contains the automation engine for installing, updating, and managing this dotfiles repository. The scripts are modular, idempotent, and designed to delegate work to native package managers whenever possible.

## 🚀 Core Workflows

### 1. Install on a Fresh System
Bootstraps a new machine by symlinking configs, installing Homebrew/Apt, configuring ASDF runtimes, and fetching all Vim/Tmux plugins.

```bash
./install.sh --install
```

### 2. Update an Existing System (Syncing)
Safely pull changes from GitHub and re-run the installer. It will update symlinks and ensure any new packages or plugins are downloaded.

```bash
git pull && ./install.sh --install
```

### 3. Upgrading Versions & Committing
The "Environment Maintenance" command. It upgrades your OS packages, ASDF runtimes (bumping `.tool-versions` automatically), and all Vim/Tmux plugins. It then creates a git commit to save the new state.

```bash
./install.sh --upgrade && git push
```

### 4. Minimal Install (Limited Systems)
Exclusively creates symlinks for core configs (Zsh, Vim, Tmux). Useful for NAS or constrained environments where package managers are not available.

```bash
./install.sh --minimal
```

---

## 📂 Script Breakdown

- `01_setup_symlinks.sh`: Creates symlinks to `$HOME`. Safely backups existing files.
- `02_install_packages.sh`: Installs system-level packages via Homebrew (macOS) or Apt (Linux).
- `03_install_asdf.sh`: Sets up ASDF plugins and installs runtimes pinned in `tool-versions`.
- `04_install_npm.sh`: Installs global npm packages.
- `05_configure_osx.sh`: Apples sane macOS defaults (system preferences).
- `06_misc.sh`: Bootstraps plugin managers (TPM for Tmux, vim-plug for NeoVim).
- `upgrade.sh`: Orchestrates the full-system upgrade and git-commit workflow.

## Full Usage

```bash
./install.sh --help      # Display help
./install.sh --dry-run   # Preview changes
./install.sh --install   # Full installation
./install.sh --minimal   # Only symlinks
./install.sh --upgrade   # Full system upgrade
./install.sh --uninstall # Remove all symlinks
```
