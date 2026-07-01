# Agent Operating Guidelines — Alan Blount

> Global baseline for CloudCode. Project-specific rules go in a companion
> `AGENTS.<project>.md` alongside the project's code.

## About me

- **Name**: Alan Blount
- **LDAP**: alanblount
- **GitHub**: zeroasterisk
- **GCP Project**: alanblount-sandbox
- **Region**: us-east5
- **Role**: AI/ML Engineering — agents, LLMs, ADK, Vertex AI, Google Cloud

## 0. Operating stance & guardrails

<default_to_action> Make a defensible decision and proceed rather than asking
permission. State assumptions so the user can correct them next turn. Most
"questions" are risk-aversion in disguise — when you genuinely must ask, ask one
question at end-of-turn, prefixed `**Need input:**`, then stop.
</default_to_action>

<do_not_act_before_instructions> Never mail a CL, bypass presubmit/LGTM, or
submit without explicit per-CL human authorization. A standing "send when ready"
is NOT pre-authorization for new CLs. </do_not_act_before_instructions>

## 1. Environment & tools

- **Shell**: zsh + Oh-My-Zsh + Powerlevel10k. Dotfiles at `~/dotfiles`.
- **Editor**: neovim (`nvim`), aliased as `vim`, `vi`, `v`.
- **Multiplexer**: tmux.
- **VCS**: git with rebase workflow (`pull.rebase = true`). SSH for GitHub
  (`zeroasterisk`). For Google-internal work, `jj` / Piper.
- **Runtimes (ASDF-managed)**:
  - Go 1.25, Node 25, Python 3.12, Rust 1.89, Elixir 1.18 / Erlang 28
  - Flutter 3.35, Elm 0.19, Firebase 14, protoc 32
- **Package manager**: Homebrew (macOS), apt (Linux). Python via `uv`.
- **GCP defaults**:
  - `GOOGLE_CLOUD_PROJECT=alanblount-sandbox`
  - `GOOGLE_CLOUD_LOCATION=us-east5`
  - `CLOUDSDK_COMPUTE_REGION=us-east5`
  - Vertex AI via `CLAUDE_CODE_USE_VERTEX=1`, `CLOUD_ML_REGION=us-east5`

## 2. Skills

Bundles enabled in `cloudcode.json`:

```json
{ "skills": { "bundles": ["google-corp", "google3"] } }
```

For Google-internal work these cover: `vcs`, `blaze`, `critique`, `tricorder`,
`build_cleaner`, `buganizer_cli`, and others. Add project-specific skills by
name or symlink into `~/.config/cloudcode/skills/`.

## 3. Coding & style

- **No hand-formatting** — use the language's standard formatter (`gofmt`,
  `black`/`ruff`, `prettier`, `mix format`, etc.). For google3: `jj fix`.
- **No emojis** in code, comments, or commit messages unless explicitly asked.
- **No unnecessary files** — never create READMEs, docs, or boilerplate unless
  explicitly requested.
- **Comments**: explain **why**, not **what**. No commented-out code left
  behind.
- **Concise output** — short, direct responses. Use markdown only when it adds
  clarity.
- Prefer editing existing files over creating new ones.

## 4. Git workflow

- Rebase-first: `git pull --rebase`, `git rebase` over merge commits.
- Commit messages: concise, imperative mood, focus on the "why".
- Never amend a commit that has been pushed to remote.
- Never force-push to `main`/`master`.
- Branch off `main`; PRs via `gh pr create`.

### Workspace layout & git identity

```
~/Workspaces/
  google-git/   # Git-on-Borg / depot repos → alanblount@google.com
  open-source/  # GitHub OSS repos           → alan@zeroasterisk.com
  scratchpad/   # No-remote experiments       → alan@zeroasterisk.com
```

Identity is applied automatically via `includeIf` in `~/dotfiles/git/gitconfig`:
- `gitdir:/google/**` and `gitdir:~/Workspaces/google-git/**` → `~/.config/git/work.gitconfig`
- Everything else inherits the personal default.

When cloning a new repo, place it in the right directory — identity follows location,
no per-repo config needed. If unsure: GitHub → `open-source/` or `scratchpad/`;
Borg/depot → `google-git/`.

## 5. Google Cloud / Vertex AI

- Default project is `alanblount-sandbox` — safe to experiment, not production.
- Prefer Vertex AI endpoints over direct Anthropic/OpenAI APIs.
- ADK agents: use `agents-cli` tooling; skills at `~/.agents/skills/`.
- Application credentials: `~/alanblount-sandbox-b4787d905b28.json` (local
  only, never committed).

## 6. Verification discipline

<verification_discipline> Before a verification step, state the positive success
signal you expect, then point at it in the output before declaring success.
Absence of errors is not success. Don't retry a failing command unchanged —
re-read the error, form a new hypothesis, change the approach.
</verification_discipline>

## 7. Debugging

- Walk the failing request layer by layer; build the fastest repro possible.
- Never mutate shared infrastructure to debug — work in isolated dirs or local
  instances.

## 8. Web & internal pages

- Internal URLs (`go/`, `b/`, `cl/`, `*.corp`, `*.googleplex`): use `WebFetch`
  directly.
- Open-ended research: use `websearch`, then verify with `webfetch` on cited
  sources before acting on them.
- Report CloudCode bugs: `cloudcode bug "<title>"`.

## 9. Dotfiles reference

Repo at `~/dotfiles` (GitHub: `zeroasterisk/home`). Key files:

| File | Purpose |
|---|---|
| `zsh/zsh_path.zsh` | PATH construction |
| `zsh/zsh_env.zsh` | Committed env defaults (GCP, uv) |
| `zsh/zsh_env.zsh.local` | Local secrets — gitignored, never commit |
| `zsh/zsh_alias.zsh` | Shell aliases (`cc=cloudcode`, `g=git`, etc.) |
| `dotfile_admin/conf.sh` | Symlink map + package lists |
| `config/cloudcode/cloudcode.json` | CloudCode settings |
| `config/gh/config.yml` | GitHub CLI preferences |
| `config/gcloud/configurations/config_default` | gcloud active config |
