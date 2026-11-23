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

## 1. Engineering core (every code change)

Before the first file edit, write one line: `Tier: <trivial|small|medium|large>
(<reason>)`. Pick by blast radius and clarity, not line count. An open question
in the ask ("not sure how X should work") makes it at least medium. When the
spec-gate plugin is installed, it blocks edits in a git repo until `.agent/tier`
(the tier word) is written this session; medium or large also need the spec
file below.

- **Trivial/small**: one place, clear ask, easy to revert. Apply the rules below.
  No spec, no skill.
- **Medium**: several files, new behavior, unclear ask, or a bug whose cause
  you still have to find. Load `engineering-discipline`. Before the first edit,
  write its short spec to `specs/<name>/spec.md` or `.agent/spec.md` (goal,
  assumptions, acceptance criteria that each end in `Verify: <check>`). Then
  continue; do not wait for approval.
- **Large**: new project or service, several PRs, risky migration, or a data,
  auth, or public-API change that is hard to revert. Load `spec-kit-adlc`.
- Specialized skills (UI, Elixir, security, writing) add to this core. They
  never replace it. Load a heavy process skill (ADLC gates, council,
  codebase-gardening) only when the tier or my request calls for it.

1. Evidence before claims. Name the success signal, run the check after the
   last edit, and point at the signal in the output. Absence of errors is not
   success. If you cannot run it, say `UNVERIFIED: <why>` and give the steps.
2. Verify through the real surface (CLI, HTTP, browser) as well as tests and
   lint.
3. Fix the root cause. Reproduce first; test one hypothesis at a time. After
   two failed fixes on one premise, test the premise. Never retry a failing
   command unchanged. Never mutate shared infrastructure to debug.
4. Stay in scope. Make the smallest diff. Report nearby problems; do not fix
   them unasked.
5. Never lower the bar: no suppressions (`eslint-disable`, `@ts-ignore`,
   `# type: ignore`, `noqa`, `nolint`), no skipped, deleted, or weakened tests.
   Fix it or report BLOCKED.
6. Structure before prose. When a correction repeats, encode it as a type,
   lint, or test, not a note. A lint message names what is banned, why, and
   the fix.
7. Ask only what the code, docs, or a quick experiment cannot answer.
8. If I skip a spec or verification the tier needs, say so once, then do what
   I ask.
9. No ceremony: do not restate these rules or paste checklists. Report the
   outcome, the evidence, and open risks.

## 2. Environment & tools

- **Shell**: zsh + starship. Dotfiles at `~/dotfiles` (`reboot` branch), managed by chezmoi.
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

## 3. Skills

Built-in skill bundles, plus my skills repo
`~/Workspaces/open-source/skills`. Its `./sync.py` wires the skill paths into
`cloudcode.json`; edit skills in the repo, not under `~/.config`.

## 4. Coding & style

- **No hand-formatting** — use the language's standard formatter (`gofmt`,
  `black`/`ruff`, `prettier`, `mix format`, etc.). For google3: `jj fix`.
- **No emojis** in code, comments, or commit messages unless explicitly asked.
- **No unnecessary files** — never create READMEs, docs, or boilerplate unless
  explicitly requested.
- **Comments**: rare. Keep one only for a fact the code cannot express (an
  external contract, a spec or bug link). Never write a comment that justifies
  a workaround: fix the root cause. No commented-out code.

- **Concise output** — short, direct responses. Use markdown only when it adds
  clarity.
- Prefer editing existing files over creating new ones.

### Writing style: ~80% ASD-STE100

- Write prose in about 80% ASD-STE100 (Simplified Technical English): short
  sentences (about 20 words or fewer), one idea per sentence, active voice,
  simple tenses, common words, and lists for steps or parallel points. Keep
  exact technical names. Allow a longer sentence where strict STE reads stiffly.
- Apply it to responses and to text written for others: PR/CL descriptions,
  issue comments, docs, and messages.
- When asked for Alan's personal voice (`alan-writing-style` skill), that voice
  wins.

## 5. Git workflow

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

## 6. Google Cloud / Vertex AI

- Default project is `alanblount-sandbox` — safe to experiment, not production.
- Prefer Vertex AI endpoints over direct Anthropic/OpenAI APIs.
- ADK agents: use `agents-cli` tooling; skills at `~/.agents/skills/`.
- Application credentials: `~/alanblount-sandbox-*.json` (local
  only, never committed).

## 7. Web & internal pages

- Internal URLs (`go/`, `b/`, `cl/`, `*.corp`, `*.googleplex`): use `WebFetch`
  directly.
- Open-ended research: use `websearch`, then verify with `webfetch` on cited
  sources before acting on them.
- Report CloudCode bugs: `cloudcode bug "<title>"`.

## 8. Dotfiles reference

Repo at `~/dotfiles` (GitHub: `zeroasterisk/home`, branch `reboot`).
Managed by **chezmoi** — source tree is `home/` in the repo.
Bootstrap: `./install.sh --apply` or `chezmoi apply`.

| File (source) | Target | Purpose |
|---|---|---|
| `home/dot_zshrc.tmpl` | `~/.zshrc` | Shell entry point, starship init |
| `home/dot_zsh/path.zsh.tmpl` | `~/.zsh/path.zsh` | PATH construction |
| `home/dot_zsh/env.zsh.tmpl` | `~/.zsh/env.zsh` | Committed env defaults (GCP, uv) |
| `home/dot_zsh/aliases.zsh` | `~/.zsh/aliases.zsh` | Shell aliases |
| `home/dot_zsh/completions.zsh` | `~/.zsh/completions.zsh` | zsh completions + plugins |
| `home/dot_config/starship/config.toml` | `~/.config/starship/config.toml` | Starship prompt |
| `home/dot_config/git/config.tmpl` | `~/.config/git/config` | Git identity + settings |
| `home/dot_config/cloudcode/cloudcode.json` | `~/.config/cloudcode/cloudcode.json` | CloudCode settings |
| `home/dot_config/gh/config.yml` | `~/.config/gh/config.yml` | GitHub CLI preferences |
| `~/.zsh/local.zsh` | (local only) | Secrets — gitignored, never commit |
