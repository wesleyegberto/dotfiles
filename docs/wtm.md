# wtm — Tmux + Git Worktree Manager

A set of shell functions that unifies Tmux session management with Git Worktrees, featuring an fzf picker for navigation and macOS/terminal notifications via Claude Code hooks.

---

## Activation

### 1. Source in `.zshrc`

Add to your `~/.zshrc` (or the functions file that is already sourced):

```zsha
source $DOTFILES/zsh/tools/wtm.sh
```

### 2. Notification hook in Claude Code

Add to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "$DOTFILES/zsh/tools/claude-notify.sh"
          }
        ]
      }
    ]
  }
}
```

### 3. Execution permissions

```bash
chmod +x $DOTFILES/zsh/tools/wtm.sh
chmod +x $DOTFILES/zsh/tools/claude-notify.sh
```

---

## Commands

### `wtm new <branch> [base-branch]`

Creates a new Git worktree and opens a dedicated Tmux session.

```bash
wtm new feature/auth
wtm new fix/login-bug main
```

What happens:
- Creates the worktree in `<repo-root>/../worktrees/<branch-slug>`
- Creates Tmux session `<repo>/<branch-slug>` with 3 windows:
  - `src` — `nvim .`
  - `ai`  — `claude`
  - `run` — free shell
- Opens/attaches to the created session

### `wtm ls`

Lists all repository worktrees with session status.

```
BRANCH                              SESSION                             STATUS     PATH
------                              ------                              ------     ----
refs/heads/feature/auth             api/feature-auth                    attached   /Users/...
refs/heads/fix/login-bug            api/fix-login-bug                   detached   /Users/...
```

Possible statuses: `attached`, `detached`, `none` (session does not exist).

### `wtm sw` (default)

Interactive fzf picker to navigate between worktrees/sessions.

```bash
wtm sw
wtm        # alias for wtm sw
```

Picker keys:
| Key      | Action                                   |
|----------|------------------------------------------|
| `Enter`  | Open/attach to the feature's Tmux session|
| `Ctrl-C` | Open `ai` (Claude) window of that session|
| `Ctrl-D` | Remove worktree + session (with confirmation) |

The preview at the bottom shows: branch, session, active tmux windows, last commit, and the worktree's `git status`.

> **Note:** the preview uses `--preview-window=nohidden` to ensure visibility even if `FZF_DEFAULT_OPTS` defines `:hidden`.

### `wtm claude [session]`

Switches to the `ai` (Claude Code) window of the session.

```bash
wtm claude              # uses current Tmux session
wtm claude api/feat-auth
```

If Claude is not running in the window, it starts automatically with `claude`.

### `wtm done`

Removes the **current** worktree and closes the corresponding Tmux session. Run from within the worktree.

```bash
cd ../worktrees/feature-auth
wtm done
```

Checks before removal:

1. **Is a worktree** — aborts if the directory is the main repository
2. **Uncommitted changes** — aborts with `git status -s` if there are pending files
3. **Unpushed commits** — two levels of verification:
   - If upstream is configured: checks `[ahead N]` in `git status -sb`
   - If no upstream: compares against `origin/main`, `origin/master`, `main`, or `master`
4. **Removes the worktree** with `git worktree remove` (without `--force`)
5. **Runs `git worktree prune`**
6. Moves up one level with `cd ..`
7. **Closes the Tmux session** if the current session name matches the worktree

### `wtm rm [branch-slug]`

Removes worktree and closes Tmux session from any directory.

```bash
wtm rm                  # fzf picker to select
wtm rm feature/auth     # remove directly
```

Before requesting confirmation, checks if the worktree is clean:

- **Uncommitted changes** → aborts with error (commit or stash)
- **Commits not sent to remote** → aborts with error (push; check ignored if no upstream configured)

Requests confirmation before removal. Asks separately whether to delete the local branch.

---

## Tmux session structure

Every session created by `wtm new` follows the pattern:

```
<repo-name>/<branch-slug>
├── 1: src   → nvim .
├── 2: ai    → claude
└── 3: run   → shell
```

Session name examples:
- `api/feature-auth`
- `frontend/fix-login-bug`
- `backend/chore-cleanup`

---

## Notification hook (`claude-notify.sh`)

Automatically triggered by the Claude Code `Stop` event.

What it does:
1. Reads context JSON from stdin
2. Detects Tmux session via `$TMUX_PANE`
3. Sends macOS notification via `osascript` with "Glass" sound
4. Displays message in the tmux status bar (`display-message`)
5. Sends bell to the pane for terminals monitoring activity

---

## Dependencies

| Tool             | Default Path                  | Required    |
|------------------|-------------------------------|-------------|
| fzf              | `/opt/homebrew/bin/fzf`       | Yes         |
| jq               | `/opt/homebrew/bin/jq`        | Recommended |
| tmux             | `$PATH`                       | Yes         |
| osascript        | `/usr/bin/osascript`          | macOS only  |
| nvim             | `$PATH`                       | Yes         |
| claude (CLI)     | `$PATH`                       | Yes         |

To use alternative paths for `fzf` or `jq`, export the variables before sourcing:

```zsh
export FZF_BIN=/usr/local/bin/fzf
export JQ_BIN=/usr/local/bin/jq
source .../wtm.sh
```
