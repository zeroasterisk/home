# Alan's Dotfiles

This repository contains my personal dotfiles and configurations, managed entirely via automated scripts. The environment is optimized for development on macOS and Linux, leveraging native package managers to keep the core repository clean and portable.

## 🛠 Built With

- **Shell:** [Zsh](https://www.zsh.org/) + [Oh My Zsh](https://ohmyz.sh/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- **Editor:** [NeoVim](https://neovim.io/) (managed via [vim-plug](https://github.com/junegunn/vim-plug))
- **Terminal Multiplexer:** [Tmux](https://github.com/tmux/tmux) (managed via [TPM](https://github.com/tmux-plugins/tpm))
- **Runtimes:** [ASDF](https://asdf-vm.com/) (versions pinned in `tool-versions`)
- **OS Packages:** [Homebrew](https://brew.sh/) (macOS) or `apt` (Linux)

---

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

### 4. Minimal Install (Limited Systems)
For environments like a NAS or a minimal container, you can bypass all package managers and plugins, and exclusively symlink your core dotfiles:

```bash
cd ~/dotfiles
./dotfile_admin/install.sh --minimal
```

---

## 📂 Repository Structure

- `zsh/`: Modular Zsh configuration (aliases, path, env, completions).
- `vim/`: NeoVim configuration split into `plugins.vim`, `mappings.vim`, and `options.vim`.
- `dotfile_admin/`: The automation engine that powers installation and upgrades.
- `bin/`: Custom scripts and utilities added to your `$PATH`.
- `tmux.conf.local`: Personalized Tmux configuration (based on gpakosz/.tmux).
- `tool-versions`: Global ASDF runtime version pins.

## More Details
For more detailed instructions and other management commands (like `--dry-run` or `--uninstall`), please see the [Dotfiles Administration README](./dotfile_admin/README.md).
