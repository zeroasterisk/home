# dotfiles

Personal dotfiles for Alan Blount. Managed by [chezmoi](https://chezmoi.io).
Zsh + starship. No Oh-My-Zsh.

## Bootstrap a new machine

### macOS

```sh
# 1. Install Xcode command line tools (required for git, compilers)
xcode-select --install

# 2. Clone the repo
git clone https://github.com/zeroasterisk/home.git ~/dotfiles
cd ~/dotfiles && git checkout reboot

# 3. Run install (installs Homebrew if missing, then everything else)
./install.sh --apply
```

### Linux (Debian / Ubuntu / gLinux)

```sh
# 1. Clone the repo
git clone https://github.com/zeroasterisk/home.git ~/dotfiles
cd ~/dotfiles && git checkout reboot

# 2. Run install
./install.sh --apply
```

### One-liner (fresh machine, no git yet)

```sh
curl -fsSL https://raw.githubusercontent.com/zeroasterisk/home/reboot/install.sh | bash -s -- --apply
```

`install.sh --apply` is idempotent — safe to re-run.

**What `install.sh` does:**
1. macOS: installs Homebrew if missing
2. Installs chezmoi + starship + zsh plugins
3. Clones the repo if not already local
4. Writes `~/.config/chezmoi/chezmoi.toml` with `sourceDir`
5. Runs `chezmoi apply --init` (prompts for name/email/work on first run)
   - This triggers `run_onchange_install-packages.sh` which installs system packages + asdf runtimes
6. Sets zsh as the default shell

After it completes: `exec zsh` or open a new terminal.

## Day-to-day usage

```sh
# After editing a file in home/
chezmoi apply

# Preview what would change before applying
chezmoi diff

# Edit a managed file in its source location
chezmoi edit ~/.zshrc

# Pull latest from git and apply
cd ~/dotfiles && git pull && chezmoi apply
```

## Structure

```
~/dotfiles/
  install.sh                        # bootstrap script
  .chezmoi.toml.tmpl                # per-machine config (prompted once on init)
  .chezmoiroot                      # source root = home/
  .chezmoiignore                    # patterns chezmoi skips
  home/
    dot_zshrc.tmpl                  → ~/.zshrc
    dot_zsh/
      path.zsh.tmpl                 → ~/.zsh/path.zsh
      env.zsh.tmpl                  → ~/.zsh/env.zsh
      aliases.zsh                   → ~/.zsh/aliases.zsh
      completions.zsh               → ~/.zsh/completions.zsh
    dot_config/
      starship/config.toml          → ~/.config/starship/config.toml
      git/config.tmpl               → ~/.config/git/config
      git/git_template/hooks/       → ~/.config/git/git_template/hooks/
      nvim/                         → ~/.config/nvim/
      cloudcode/                    → ~/.config/cloudcode/
      gh/config.yml                 → ~/.config/gh/config.yml
    dot_tmux.conf                   → ~/.tmux.conf
    dot_tmux.conf.local             → ~/.tmux.conf.local (unused — legacy)
    dot_tool-versions               → ~/.tool-versions
    dot_ctags                       → ~/.ctags
    .chezmoiscripts/
      run_onchange_install-packages.sh.tmpl   # runs on chezmoi apply when changed
```

## Adding a package

Open `home/.chezmoiscripts/run_onchange_install-packages.sh.tmpl`.
Add to **both** the apt and brew lists (name differences noted inline).
Run `chezmoi apply` — the script re-runs because the file changed.

## Adding an asdf runtime

Uncomment (or add) a `_plugin` + `_runtime` pair in the extras section of the
same script. Run `chezmoi apply`.

## Machine-specific config

chezmoi prompts for `name`, `email`, `github`, and `work` once on first run
and stores answers in `~/.config/chezmoi/chezmoi.toml`. Edit that file to
change them. Templates branch on `.work` (bool) and `.chezmoi.os` (`linux`/`darwin`).

## Local secrets / overrides

Never committed. Put them in:

- `~/.zsh/local.zsh` — env vars, tokens, machine-specific aliases
- `~/.zshrc.local` — anything else

Both are sourced automatically at the end of `.zshrc` if they exist.

## nvim

Plugins managed by [vim-plug](https://github.com/junegunn/vim-plug), which
bootstraps itself automatically on first launch. No manual step needed.

To add a plugin: edit `home/dot_config/nvim/plugins.vim`, run `chezmoi apply`,
then open nvim and run `:PlugInstall`.

## tmux

Standalone config at `~/.tmux.conf`. No external framework required.
`Prefix + r` reloads the config live.

## Prompt

[Starship](https://starship.rs). Config at `~/.config/starship/config.toml`.
Falls back to a plain `PS1` if starship is not installed.

## No Oh-My-Zsh

OMZ is gone. Replaced by:

| Was | Now |
|---|---|
| OMZ theme / Powerlevel10k | starship |
| OMZ history settings | `setopt` in `.zshrc` |
| OMZ completion system | `compinit` called directly |
| OMZ vi mode | `bindkey -v` |
| OMZ git aliases | `~/.zsh/aliases.zsh` |
| OMZ plugins (autosuggestions etc.) | apt/brew packages sourced directly |
| OMZ sudo plugin | Esc+Esc keybinding in `.zshrc` |
| OMZ dotenv plugin | `_dotenv_load` chpwd hook in `.zshrc` |
| OMZ ssh-agent plugin | ssh-agent startup guard in `.zshrc` |
