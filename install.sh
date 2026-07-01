#!/usr/bin/env bash
# install.sh — bootstrap dotfiles on a new machine
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/zeroasterisk/home/reboot/install.sh | bash
#   # or, after cloning:
#   ./install.sh [--dry-run] [--apply]
#
# What it does:
#   1. Installs chezmoi (if not present)
#   2. Installs starship (if not present)
#   3. Initialises chezmoi pointing at this repo
#   4. Applies dotfiles (unless --dry-run)
#
# Graceful degradation: missing packages are noted but don't abort.

set -euo pipefail

REPO="https://github.com/zeroasterisk/home.git"
CHEZMOI_SOURCE="${HOME}/.local/share/chezmoi"
DRY_RUN=false
APPLY=false

# ── Parse flags ───────────────────────────────────────────────────────────────
for arg in "$@"; do
  case "${arg}" in
    --dry-run) DRY_RUN=true ;;
    --apply)   APPLY=true ;;
  esac
done

# ── Helpers ───────────────────────────────────────────────────────────────────
log()  { printf '\033[1;34m==> %s\033[0m\n' "$*"; }
ok()   { printf '\033[1;32m  ✓ %s\033[0m\n' "$*"; }
warn() { printf '\033[1;33m  ! %s\033[0m\n' "$*"; }

# ── Detect OS ─────────────────────────────────────────────────────────────────
OS="$(uname -s)"
case "${OS}" in
  Darwin) PLATFORM="macos" ;;
  Linux)  PLATFORM="linux" ;;
  *)      warn "Unknown OS: ${OS}. Proceeding anyway."; PLATFORM="unknown" ;;
esac
log "Platform: ${PLATFORM}"

# ── Install chezmoi ───────────────────────────────────────────────────────────
if ! command -v chezmoi &>/dev/null; then
  log "Installing chezmoi..."
  if [[ "${PLATFORM}" == "macos" ]] && command -v brew &>/dev/null; then
    brew install chezmoi
  else
    # Universal install script — works on Linux and macOS
    sh -c "$(curl -fsSL https://get.chezmoi.io)" -- -b "${HOME}/.local/bin"
  fi
  ok "chezmoi installed: $(chezmoi --version)"
else
  ok "chezmoi already installed: $(chezmoi --version)"
fi

# ── Install starship ──────────────────────────────────────────────────────────
if ! command -v starship &>/dev/null; then
  log "Installing starship..."
  if [[ "${PLATFORM}" == "macos" ]] && command -v brew &>/dev/null; then
    brew install starship
  elif [[ "${PLATFORM}" == "linux" ]]; then
    # Try apt first (Debian 13+ / Ubuntu 25.04+), fall back to install script
    if command -v apt-get &>/dev/null && apt-cache show starship &>/dev/null 2>&1; then
      sudo apt-get install -y starship || \
        sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
    else
      sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
    fi
  else
    warn "Cannot auto-install starship on ${PLATFORM}. Install manually: https://starship.rs"
  fi
  command -v starship &>/dev/null && ok "starship installed: $(starship --version)" \
    || warn "starship install failed — prompt will fall back to simple PS1"
else
  ok "starship already installed: $(starship --version)"
fi

# ── Install zsh plugins (optional, graceful) ──────────────────────────────────
log "Checking zsh plugins..."
if [[ "${PLATFORM}" == "linux" ]] && command -v apt-get &>/dev/null; then
  for pkg in zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search; do
    if ! dpkg -l "${pkg}" &>/dev/null 2>&1; then
      sudo apt-get install -y "${pkg}" 2>/dev/null \
        && ok "${pkg} installed" \
        || warn "${pkg} not available in apt — completions.zsh will skip it"
    else
      ok "${pkg} already installed"
    fi
  done
elif [[ "${PLATFORM}" == "macos" ]] && command -v brew &>/dev/null; then
  for formula in zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search; do
    brew list "${formula}" &>/dev/null 2>&1 \
      || brew install "${formula}" \
      && ok "${formula} installed"
  done
fi

# ── Initialise chezmoi ────────────────────────────────────────────────────────
if [[ -d "${CHEZMOI_SOURCE}" ]]; then
  log "chezmoi source already exists at ${CHEZMOI_SOURCE} — pulling latest..."
  chezmoi git pull
else
  log "Initialising chezmoi from ${REPO}..."
  chezmoi init "${REPO}"
fi

# ── Apply ─────────────────────────────────────────────────────────────────────
if ${DRY_RUN}; then
  log "Dry run — showing diff:"
  chezmoi diff
elif ${APPLY}; then
  log "Applying dotfiles..."
  chezmoi apply --verbose
else
  log "Preview diff (run with --apply to write files):"
  chezmoi diff
  echo ""
  echo "Run './install.sh --apply' to apply, or 'chezmoi apply' directly."
fi

ok "Done."
