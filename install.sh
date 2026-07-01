#!/usr/bin/env bash
# install.sh — bootstrap dotfiles on a new machine
#
# Usage (two modes):
#   # From an already-cloned repo:
#   cd ~/dotfiles && ./install.sh [--apply] [--dry-run]
#
#   # Fresh machine one-liner (clones then applies):
#   curl -fsSL https://raw.githubusercontent.com/zeroasterisk/home/reboot/install.sh | bash
#
# What it does:
#   1. Installs chezmoi (if not present)
#   2. Installs starship (if not present)
#   3. Installs zsh plugins (if not present)
#   4. Points chezmoi at this repo (or clones it if not local)
#   5. Applies dotfiles (which triggers run_onchange package + asdf install)
#
# Graceful degradation: continues past individual failures.

set -uo pipefail

REPO="https://github.com/zeroasterisk/home.git"
REPO_BRANCH="reboot"
REPO_LOCAL="${HOME}/dotfiles"
CHEZMOI_CONFIG="${HOME}/.config/chezmoi/chezmoi.toml"
DRY_RUN=false
APPLY=false

for arg in "$@"; do
  case "${arg}" in
    --dry-run) DRY_RUN=true ;;
    --apply)   APPLY=true ;;
  esac
done

log()  { printf '\033[1;34m==> %s\033[0m\n' "$*"; }
ok()   { printf '\033[1;32m  ✓ %s\033[0m\n' "$*"; }
skip() { printf '\033[1;33m  - %s\033[0m\n' "$*"; }
warn() { printf '\033[1;31m  ! %s\033[0m\n' "$*"; }

OS="$(uname -s)"
case "${OS}" in
  Darwin) PLATFORM="macos" ;;
  Linux)  PLATFORM="linux" ;;
  *)      warn "Unknown OS: ${OS}"; PLATFORM="unknown" ;;
esac
log "Platform: ${PLATFORM}"

# ── chezmoi ───────────────────────────────────────────────────────────────────
if ! command -v chezmoi &>/dev/null; then
  log "Installing chezmoi..."
  if [[ "${PLATFORM}" == "macos" ]] && command -v brew &>/dev/null; then
    brew install chezmoi
  else
    sh -c "$(curl -fsSL https://get.chezmoi.io)" -- -b "${HOME}/.local/bin"
  fi
  ok "chezmoi $(chezmoi --version)"
else
  skip "chezmoi $(chezmoi --version)"
fi

# ── starship ──────────────────────────────────────────────────────────────────
if ! command -v starship &>/dev/null; then
  log "Installing starship..."
  if [[ "${PLATFORM}" == "macos" ]] && command -v brew &>/dev/null; then
    brew install starship
  else
    # --bin-dir avoids needing sudo; ~/.local/bin is on PATH via path.zsh
    sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes --bin-dir "${HOME}/.local/bin"
  fi
  command -v starship &>/dev/null \
    && ok "starship $(starship --version)" \
    || warn "starship install failed — shell will fall back to plain PS1"
else
  skip "starship $(starship --version)"
fi

# ── zsh plugins ───────────────────────────────────────────────────────────────
log "zsh plugins..."
if [[ "${PLATFORM}" == "linux" ]] && command -v apt-get &>/dev/null; then
  for pkg in zsh-autosuggestions zsh-syntax-highlighting; do
    dpkg -l "${pkg}" &>/dev/null 2>&1 \
      && skip "${pkg}" \
      || { sudo apt-get install -y "${pkg}" 2>/dev/null && ok "${pkg}" || warn "${pkg} failed"; }
  done
  # zsh-history-substring-search is not in apt — install manually
  HSS="${HOME}/.zsh/plugins/zsh-history-substring-search.zsh"
  if [[ ! -f "${HSS}" ]]; then
    mkdir -p "${HOME}/.zsh/plugins"
    curl -fsSL https://raw.githubusercontent.com/zsh-users/zsh-history-substring-search/master/zsh-history-substring-search.zsh \
      -o "${HSS}" && ok "zsh-history-substring-search" || warn "zsh-history-substring-search failed"
  else
    skip "zsh-history-substring-search"
  fi
elif [[ "${PLATFORM}" == "macos" ]] && command -v brew &>/dev/null; then
  for formula in zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search; do
    brew list "${formula}" &>/dev/null 2>&1 \
      && skip "${formula}" \
      || { brew install "${formula}" && ok "${formula}" || warn "${formula} failed"; }
  done
fi

# ── repo ──────────────────────────────────────────────────────────────────────
# Determine source dir: use local clone if we're running from it, else clone.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
if [[ -f "${SCRIPT_DIR}/.chezmoiroot" ]]; then
  SOURCE_DIR="${SCRIPT_DIR}"
  log "Using local repo at ${SOURCE_DIR}"
elif [[ -d "${REPO_LOCAL}/.git" ]]; then
  SOURCE_DIR="${REPO_LOCAL}"
  log "Using existing repo at ${SOURCE_DIR}"
  git -C "${SOURCE_DIR}" checkout "${REPO_BRANCH}" 2>/dev/null || true
  git -C "${SOURCE_DIR}" pull --rebase 2>/dev/null || true
else
  log "Cloning repo..."
  git clone --branch "${REPO_BRANCH}" "${REPO}" "${REPO_LOCAL}"
  SOURCE_DIR="${REPO_LOCAL}"
  ok "Cloned to ${SOURCE_DIR}"
fi

# ── chezmoi config ────────────────────────────────────────────────────────────
# Write machine config if it doesn't exist yet.
# chezmoi will prompt for name/email/work interactively on first apply.
if [[ ! -f "${CHEZMOI_CONFIG}" ]]; then
  mkdir -p "$(dirname "${CHEZMOI_CONFIG}")"
  cat > "${CHEZMOI_CONFIG}" <<EOF
sourceDir = "${SOURCE_DIR}"
EOF
  ok "chezmoi config written → ${CHEZMOI_CONFIG}"
else
  # Ensure sourceDir is correct even if config already exists
  if ! grep -q "sourceDir" "${CHEZMOI_CONFIG}"; then
    echo "sourceDir = \"${SOURCE_DIR}\"" >> "${CHEZMOI_CONFIG}"
    ok "sourceDir added to existing chezmoi config"
  else
    skip "chezmoi config already exists"
  fi
fi

# ── apply ─────────────────────────────────────────────────────────────────────
if ${DRY_RUN}; then
  log "Dry run — diff only:"
  chezmoi diff
elif ${APPLY}; then
  log "Applying dotfiles..."
  chezmoi apply
else
  log "Preview (run with --apply to write files):"
  chezmoi diff
  echo ""
  echo "  Run: ./install.sh --apply"
  echo "  Or:  chezmoi apply"
fi

ok "Done."
