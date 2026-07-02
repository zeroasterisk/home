#!/usr/bin/env bash
# install.sh — bootstrap dotfiles on a new machine
#
# Usage (two modes):
#   # From an already-cloned repo:
#   cd ~/dotfiles && ./install.sh [--apply] [--dry-run]
#
#   # Fresh machine one-liner (clones then applies):
#   curl -fsSL https://raw.githubusercontent.com/zeroasterisk/home/reboot/install.sh | bash -s -- --apply
#
# What it does:
#   1. macOS: installs Homebrew if missing
#   2. Installs chezmoi + starship + zsh plugins
#   3. Points chezmoi at this repo (or clones it)
#   4. Runs chezmoi apply --init (prompts for name/email/work, then applies)
#      which triggers run_onchange_install-packages.sh → system packages + asdf runtimes
#   5. Sets zsh as default shell if not already
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

# Ensure ~/.local/bin is on PATH immediately (chezmoi/starship install there)
export PATH="${HOME}/.local/bin:${PATH}"

OS="$(uname -s)"
case "${OS}" in
  Darwin) PLATFORM="macos" ;;
  Linux)  PLATFORM="linux" ;;
  *)      warn "Unknown OS: ${OS}"; PLATFORM="unknown" ;;
esac
log "Platform: ${PLATFORM}"

# ── macOS: Homebrew ───────────────────────────────────────────────────────────
if [[ "${PLATFORM}" == "macos" ]]; then
  if ! command -v brew &>/dev/null; then
    log "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to PATH for the rest of this script
    if [[ -f /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f /usr/local/bin/brew ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
    ok "Homebrew installed"
  else
    skip "Homebrew $(brew --version | head -1)"
  fi
fi

# ── Linux: apt-get update ─────────────────────────────────────────────────────
if [[ "${PLATFORM}" == "linux" ]] && command -v apt-get &>/dev/null; then
  log "Updating apt cache..."
  sudo apt-get update -qq
fi

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
  # zsh-history-substring-search is not in apt
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
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || echo "${REPO_LOCAL}")"
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
if [[ ! -f "${CHEZMOI_CONFIG}" ]]; then
  mkdir -p "$(dirname "${CHEZMOI_CONFIG}")"
  cat > "${CHEZMOI_CONFIG}" <<EOF
sourceDir = "${SOURCE_DIR}"
EOF
  ok "chezmoi config written → ${CHEZMOI_CONFIG}"
else
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
  log "Applying dotfiles (will prompt for name/email/work if first run)..."
  # --init processes .chezmoi.toml.tmpl to populate template data
  chezmoi apply --init
else
  log "Preview (run with --apply to write files):"
  chezmoi diff
  echo ""
  echo "  Run: ./install.sh --apply"
  echo "  Or:  chezmoi apply --init"
fi

# ── set zsh as default shell ──────────────────────────────────────────────────
ZSH_PATH="$(command -v zsh 2>/dev/null || echo '')"
if [[ -n "${ZSH_PATH}" && "${SHELL}" != "${ZSH_PATH}" ]]; then
  log "Setting zsh as default shell..."
  if [[ "${PLATFORM}" == "linux" ]]; then
    # Add to /etc/shells if not already there
    grep -qF "${ZSH_PATH}" /etc/shells || echo "${ZSH_PATH}" | sudo tee -a /etc/shells
  fi
  chsh -s "${ZSH_PATH}" && ok "Default shell set to ${ZSH_PATH}" || warn "chsh failed — set manually: chsh -s ${ZSH_PATH}"
else
  skip "Shell already zsh"
fi

ok "Done. Open a new shell or run: exec zsh"
