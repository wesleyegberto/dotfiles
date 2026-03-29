#!/usr/bin/env zsh
# wtm — Worktree Tmux manager
# Source this file in .zshrc to enable the functions

FZF_BIN="${FZF_BIN:-/opt/homebrew/bin/fzf}"
JQ_BIN="${JQ_BIN:-/opt/homebrew/bin/jq}"
_WTM_DIR="${${(%):-%x}:h}"

# ─── internal helpers ─────────────────────────────────────────────────────────

_wtm_repo_root() {
    git rev-parse --show-toplevel 2>/dev/null
}

_wtm_repo_name() {
    basename "$(_wtm_repo_root)"
}

_wtm_branch_slug() {
    # Converts branch name to a safe slug for session names and directories
    local slug="${1//\//-}"   # / → -
    slug="${slug// /-}"       # spaces → -
    echo "${slug:l}"          # lowercase (zsh built-in)
}

_wtm_session_name() {
    local repo branch_slug
    repo="$(_wtm_repo_name)"
    branch_slug="$(_wtm_branch_slug "$1")"
    echo "${repo}/${branch_slug}"
}

_wtm_worktrees() {
    # Lists worktrees of the current repo in "path|branch" format
    local root
    root="$(_wtm_repo_root)" || return 1
    git -C "$root" worktree list --porcelain 2>/dev/null \
        | awk '
            /^worktree / { path=$2 }
            /^branch /   { branch=$2; sub(/^refs\/heads\//, "", branch) }
            /^$/         { if (path != "" && branch != "") { print path "|" branch; path=""; branch="" } }
            END          { if (path != "" && branch != "") print path "|" branch }
        '
}

_wtm_session_status() {
    local session="$1"
    if ! tmux has-session -t "$session" 2>/dev/null; then
        echo "none"
    elif tmux list-sessions -F "#{session_name}:#{session_attached}" 2>/dev/null \
            | grep -q "^${session}:1$"; then
        echo "attached"
    else
        echo "detached"
    fi
}

_wtm_attach() {
    local session="$1"
    if [[ -n "$TMUX" ]]; then
        tmux switch-client -t "$session"
    else
        tmux attach-session -t "$session"
    fi
}

_wtm_create_session() {
    local session="$1" worktree_dir="$2"
    tmux new-session -ds "$session" -n "src" -c "$worktree_dir"
    tmux new-window -t "${session}:2" -n "ai"  -c "$worktree_dir"
    tmux new-window -t "${session}:3" -n "run" -c "$worktree_dir"
    tmux send-keys -t "${session}:1" "nvim ." C-m
    tmux send-keys -t "${session}:2" "claude" C-m
    tmux select-window -t "${session}:1"
}

# ─── wtm new ──────────────────────────────────────────────────────────────────

_wtm_new() {
    local branch="$1" base_branch="${2:-}"

    if [[ -z "$branch" ]]; then
        echo "usage: wtm new <branch> [base-branch]" >&2
        return 1
    fi

    local repo_root repo_name branch_slug worktree_dir session
    repo_root="$(_wtm_repo_root)" || { echo "wtm: not a git repository" >&2; return 1; }
    repo_name="$(basename "$repo_root")"
    branch_slug="$(_wtm_branch_slug "$branch")"
    worktree_dir="${repo_root}/../worktrees/${branch_slug}"
    session="${repo_name}/${branch_slug}"

    echo "→ creating worktree at $worktree_dir"
    if [[ -n "$base_branch" ]]; then
        git -C "$repo_root" worktree add "$worktree_dir" -b "$branch" "$base_branch" || return 1
    else
        git -C "$repo_root" worktree add "$worktree_dir" -b "$branch" || return 1
    fi

    echo "→ creating tmux session: $session"
    if tmux has-session -t "$session" 2>/dev/null; then
        echo "session already exists, attaching..."
    else
        _wtm_create_session "$session" "$worktree_dir"
    fi

    _wtm_attach "$session"
}

# ─── wtm ls ───────────────────────────────────────────────────────────────────

_wtm_ls() {
    local repo_root
    repo_root="$(_wtm_repo_root)" || { echo "wtm: not a git repository" >&2; return 1; }

    printf "%-35s %-35s %-10s %s\n" "BRANCH" "SESSION" "STATUS" "PATH"
    printf "%-35s %-35s %-10s %s\n" "------" "-------" "------" "----"

    local repo_name
    repo_name="$(basename "$repo_root")"

    local _line _path _branch _session _sess_status
    while read -r _line; do
        _path="${_line%%|*}"
        _branch="${_line#*|}"
        _session="${repo_name}/$(_wtm_branch_slug "$_branch")"
        _sess_status="$(_wtm_session_status "$_session")"
        [[ "$_sess_status" == "none" ]] && _session=""
        printf "%-35s %-35s %-10s %s\n" "$_branch" "$_session" "$_sess_status" "$_path"
    done < <(_wtm_worktrees)
}

# ─── wtm sw ───────────────────────────────────────────────────────────────────

_wtm_sw() {
    if [[ -n "$TMUX" ]]; then
        tmux choose-tree -s
    else
        if ! tmux list-sessions &>/dev/null; then
            echo "wtm sw: no active tmux sessions" >&2
            return 1
        fi
        tmux attach-session \; choose-tree -s
    fi
}

# ─── wtm claude ───────────────────────────────────────────────────────────────

_wtm_open_claude_window() {
    local session="${1:-}"

    if [[ -z "$session" ]]; then
        if [[ -n "$TMUX" ]]; then
            session=$(tmux display-message -p '#S')
        else
            echo "wtm claude: provide a session name or run inside tmux" >&2
            return 1
        fi
    fi

    if ! tmux has-session -t "$session" 2>/dev/null; then
        echo "wtm: session '$session' not found" >&2
        return 1
    fi

    if tmux list-windows -t "$session" -F '#{window_name}' 2>/dev/null | grep -q '^ai$'; then
        local pane cmd
        pane="${session}:ai"
        cmd=$(tmux display-message -t "$pane" -p '#{pane_current_command}' 2>/dev/null)
        if [[ "$cmd" != "claude" ]]; then
            tmux send-keys -t "$pane" "claude" C-m
        fi
        if [[ -n "$TMUX" ]]; then
            tmux switch-client -t "$pane"
        else
            tmux attach-session -t "$session" \; select-window -t ai
        fi
    else
        echo "wtm: window 'ai' not found in session '$session'" >&2
        return 1
    fi
}

_wtm_claude() {
    _wtm_open_claude_window "$1"
}

# ─── wtm done ─────────────────────────────────────────────────────────────────

_wtm_done() {
    local current_dir repo_root main_path
    current_dir="$(pwd)"
    repo_root="$(_wtm_repo_root)" || { echo "wtm: not a git repository" >&2; return 1; }

    # Must be a worktree, not the main repo
    main_path="$(git worktree list --porcelain | head -n 1 | sed 's/^worktree //')"
    if [[ "$current_dir" == "$main_path" ]]; then
        echo "wtm: current directory is the main repository, not a worktree" >&2
        return 1
    fi
    if ! git worktree list --porcelain | grep -q "^worktree ${current_dir}$"; then
        echo "wtm: current directory is not a recognized worktree" >&2
        return 1
    fi

    # Check uncommitted changes
    if [[ -n "$(git status --porcelain)" ]]; then
        echo "wtm: uncommitted changes — commit or stash before removing" >&2
        git status -s >&2
        return 1
    fi

    # Check pending push — primary: upstream configured and branch is ahead
    if git status -sb | grep -q '\[ahead '; then
        echo "wtm: branch has unpushed commits" >&2
        git status -sb | head -n 1 >&2
        return 1
    fi

    # Check pending push — fallback: no upstream, compare against known base branches
    if ! git rev-parse --abbrev-ref --symbolic-full-name '@{u}' >/dev/null 2>&1; then
        local current_branch ahead_count base
        current_branch="$(git rev-parse --abbrev-ref HEAD)"
        for base in origin/main origin/master main master; do
            if git rev-parse --verify "$base" >/dev/null 2>&1 && [[ "$current_branch" != "$base" ]]; then
                ahead_count="$(git rev-list --count "${base}..HEAD" 2>/dev/null)"
                if [[ -n "$ahead_count" && "$ahead_count" -gt 0 ]]; then
                    echo "wtm: '$current_branch' has no upstream and is ${ahead_count} commit(s) ahead of $base — push before removing" >&2
                    return 1
                fi
                break
            fi
        done
    fi

    # Determine tmux session to kill (must match current session)
    local session_to_kill=""
    if [[ -n "$TMUX" ]]; then
        local current_session expected_session current_branch
        current_branch="$(git rev-parse --abbrev-ref HEAD)"
        current_session="$(tmux display-message -p '#S')"
        expected_session="$(_wtm_session_name "$current_branch")"
        if [[ "$current_session" == "$expected_session" ]]; then
            session_to_kill="$current_session"
        fi
    fi

    echo "→ removing worktree '$current_dir'..."
    if git -C "$repo_root" worktree remove "$current_dir"; then
        git -C "$repo_root" worktree prune
        echo "→ worktree removed"
        cd ..
        if [[ -n "$session_to_kill" ]]; then
            echo "→ killing tmux session '$session_to_kill'..."
            tmux kill-session -t "$session_to_kill"
        fi
    else
        echo "wtm: failed to remove worktree — check for files in use" >&2
        return 1
    fi
}

# ─── wtm rm ───────────────────────────────────────────────────────────────────

_wtm_rm_entry() {
    local branch="$1" session="$2" wt_path="$3"
    local repo_root
    repo_root="$(_wtm_repo_root)" || { echo "wtm: not a git repository" >&2; return 1; }

    # Abort if there are uncommitted changes in the worktree
    local dirty
    dirty=$(git -C "$wt_path" status --porcelain 2>/dev/null)
    if [[ -n "$dirty" ]]; then
        echo "wtm: '$branch' has uncommitted changes — commit or stash before removing" >&2
        return 1
    fi

    # Abort if there are unpushed commits (only when upstream is configured)
    local unpushed
    unpushed=$(git -C "$wt_path" log '@{u}..HEAD' --oneline 2>/dev/null)
    if [[ -n "$unpushed" ]]; then
        echo "wtm: '$branch' has unpushed commits — push before removing:" >&2
        echo "$unpushed" | sed 's/^/  /' >&2
        return 1
    fi

    echo "Remove worktree and session?"
    echo "  Branch:  $branch"
    echo "  Session: $session"
    echo "  Path:    $wt_path"
    echo -n "Confirm? [y/N] "
    read -r confirm
    [[ "$confirm" != [yY] ]] && { echo "cancelled"; return 0; }

    if tmux has-session -t "$session" 2>/dev/null; then
        tmux kill-session -t "$session"
        echo "→ session '$session' killed"
    fi

    git -C "$repo_root" worktree remove --force "$wt_path" \
        && echo "→ worktree removed: $wt_path" \
        || echo "! could not remove worktree: $wt_path"

    echo -n "Delete local branch '$branch'? [y/N] "
    read -r del_branch
    if [[ "$del_branch" == [yY] ]]; then
        git -C "$repo_root" branch -D "$branch" \
            && echo "→ branch '$branch' deleted" \
            || echo "! could not delete branch '$branch'"
    fi
}

_wtm_rm() {
    local repo_root
    repo_root="$(_wtm_repo_root)" || { echo "wtm: not a git repository" >&2; return 1; }

    local branch="${1:-}"

    if [[ -z "$branch" ]]; then
        local entries=() _path _b
        while read -r _line; do
            _path="${_line%%|*}"
            _b="${_line#*|}"
            [[ "$_path" == "$repo_root" ]] && continue
            entries+=("${_b}|$(_wtm_session_name "$_b")|${_path}")
        done < <(_wtm_worktrees)

        if [[ ${#entries[@]} -eq 0 ]]; then
            echo "wtm: no worktrees found" >&2
            return 1
        fi

        local selected
        selected=$(printf '%s\n' "${entries[@]}" \
            | "$FZF_BIN" --delimiter='|' --with-nth='1' \
                --header='Select worktree to remove' \
                --height='40%') || return 0

        local sel_branch sel_session sel_path
        sel_branch="${selected%%|*}"
        sel_session="$(echo "$selected" | cut -d'|' -f2)"
        sel_path="${selected##*|}"
        _wtm_rm_entry "$sel_branch" "$sel_session" "$sel_path"
    else
        local slug session wt_path _p _b
        slug="$(_wtm_branch_slug "$branch")"
        session="$(basename "$repo_root")/${slug}"
        wt_path=""
        while read -r _line; do
            _p="${_line%%|*}"
            _b="${_line#*|}"
            if [[ "$_b" == *"$branch"* ]]; then
                wt_path="$_p"
                break
            fi
        done < <(_wtm_worktrees)

        if [[ -z "$wt_path" ]]; then
            echo "wtm: worktree for '$branch' not found" >&2
            return 1
        fi
        _wtm_rm_entry "$branch" "$session" "$wt_path"
    fi
}

# ─── entrypoint ───────────────────────────────────────────────────────────────

wtm() {
    local cmd="${1:-sw}"
    shift 2>/dev/null || true

    case "$cmd" in
        new)    _wtm_new "$@" ;;
        ls)     _wtm_ls "$@" ;;
        sw)     _wtm_sw "$@" ;;
        claude) _wtm_claude "$@" ;;
        done)   _wtm_done "$@" ;;
        rm)     _wtm_rm "$@" ;;
        help|-h|--help)
            cat <<'EOF'
wtm — Tmux + Git Worktree manager

Usage:
  wtm                        Open tmux session picker (alias for wtm sw)
  wtm new <branch> [base]    Create worktree + tmux session
  wtm ls                     List worktrees with session status
  wtm sw                     Open tmux session picker
  wtm claude [session]       Switch to the Claude window of a session
  wtm done                   Remove current worktree + tmux session (run inside the worktree)
  wtm rm [branch-slug]       Remove worktree and tmux session (fzf picker or by branch)
EOF
            ;;
        *)
            echo "wtm: unknown command '$cmd'. Run 'wtm help'." >&2
            return 1
            ;;
    esac
}
