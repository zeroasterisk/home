# dotfiles

Personal dotfiles for Alan Blount. Managed by [chezmoi](https://chezmoi.io).
Zsh + starship. No Oh-My-Zsh.

## Bootstrap a new machine

```sh
# 1. Clone and enter the repo
git clone https://github.com/zeroasterisk/home.git ~/dotfiles
cd ~/dotfiles
git checkout reboot

# 2. Install chezmoi + starship + system packages + asdf runtimes
./install.sh

# 3. Apply dotfiles
chezmoi apply
```

`install.sh` is idempotent — safe to re-run.

## Day-to-day usage

```sh
# After editing a file in home/
chezmoi apply

# Preview what would change before applying
chezmoi diff

# Edit a managed file (opens source, applies on save)
chezmoi edit ~/.zshrc

# Pull latest from git and apply
cd ~/dotfiles && git pull && chezmoi apply
```

## Structure

```
~/dotfiles/
  install.sh                  # bootstrap: chezmoi + starship + packages + asdf
  .chezmoi.toml.tmpl          # per-machine config (prompted once on init)
  .chezmoiroot                # tells chezmoi: source root = home/
  .chezmoiignore              # files chezmoi ignores
  home/
    dot_zshrc.tmpl            → ~/.zshrc
    dot_zsh/
      path.zsh.tmpl           → ~/.zsh/path.zsh
      env.zsh.tmpl            → ~/.zsh/env.zsh
      aliases.zsh             → ~/.zsh/aliases.zsh
      completions.zsh         → ~/.zsh/completions.zsh
    dot_config/
      starship/config.toml    → ~/.config/starship/config.toml
      git/config.tmpl         → ~/.config/git/config
      git/git_template/hooks/ → ~/.config/git/git_template/hooks/
      nvim/                   → ~/.config/nvim/
      cloudcode/              → ~/.config/cloudcode/
      gh/config.yml           → ~/.config/gh/config.yml
    dot_tmux.conf.local       → ~/.tmux.conf.local
    dot_tool-versions         → ~/.tool-versions
    .chezmoiscripts/
      run_onchange_install-packages.sh.tmpl   # runs on chezmoi apply when changed
```

## Adding a package

Open `.chezmoiscripts/run_onchange_install-packages.sh.tmpl`.
Add to **both** the apt and brew lists (name differences noted inline).
Run `chezmoi apply` — the script re-runs because the file changed.

## Adding an asdf runtime

Uncomment (or add) a `_plugin` + `_runtime` pair in the extras section of the
same script. Run `chezmoi apply`.

## Machine-specific config

chezmoi prompts for `name`, `email`, `github`, and `work` once on first init
and stores answers in `~/.config/chezmoi/chezmoi.toml`. Edit that file to
change them. Templates branch on `.work` and `.chezmoi.os` (`linux`/`darwin`).

## Local secrets / overrides

Never committed. Put them in:

- `~/.zsh/local.zsh` — env vars, tokens, machine-specific aliases
- `~/.zshrc.local` — anything else

Both are sourced automatically at the end of `.zshrc` if they exist.

## nvim

Plugins managed by [vim-plug](https://github.com/junegunn/vim-plug).
On first launch after a fresh install, vim-plug bootstraps itself and runs
`:PlugInstall` automatically. No manual step needed.

To add a plugin: edit `home/dot_config/nvim/plugins.vim`, run `chezmoi apply`,
then `:PlugInstall` inside nvim.

## Prompt

[Starship](https://starship.rs). Config at `~/.config/starship/config.toml`.
Falls back to a plain `PS1` if starship isn't installed yet.

## No Oh-My-Zsh

OMZ is gone. What replaced it:

| Was | Now |
|---|---|
| OMZ theme / Powerlevel10k | starship |
| OMZ history settings | `setopt` in `.zshrc` |
| OMZ completion system | `compinit` called directly |
| OMZ vi mode | `bindkey -v` |
| OMZ git aliases | `~/.zsh/aliases.zsh` |
| OMZ plugins (autosuggestions etc.) | apt/brew packages sourced directly |
