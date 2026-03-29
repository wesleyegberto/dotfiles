#!/usr/bin/env bash
# claude-notify.sh — Notification hook for Claude Code (Stop event)
#
# Configuration in ~/.claude/settings.json:
#   "hooks": {
#     "Stop": [{
#       "matcher": "",
#       "hooks": [{
#         "type": "command",
#         "command": "$DOTFILES/zsh/tools/claude-notify.sh"
#       }]
#     }]
#   }

set -euo pipefail

JQ_BIN="${JQ_BIN:-/opt/homebrew/bin/jq}"

# ─── read context from stdin ──────────────────────────────────────────────────

PAYLOAD=""
if [ -t 0 ]; then
    # stdin is not a pipe — no context data
    :
else
    PAYLOAD=$(cat)
fi

# Extract JSON fields (with fallback if jq is not available or payload is empty)
SESSION_ID=""
if [[ -n "$PAYLOAD" ]] && command -v "$JQ_BIN" &>/dev/null; then
    SESSION_ID=$(echo "$PAYLOAD" | "$JQ_BIN" -r '.session_id // empty' 2>/dev/null || true)
fi

# ─── detect Tmux session and pane ─────────────────────────────────────────────

TMUX_SESSION=""
TMUX_PANE_ID=""

if [[ -n "${TMUX_PANE:-}" ]]; then
    TMUX_PANE_ID="$TMUX_PANE"
    TMUX_SESSION=$(tmux display-message -t "$TMUX_PANE" -p '#S' 2>/dev/null || true)
fi

# Notification title
if [[ -n "$TMUX_SESSION" ]]; then
    TITLE="Claude Code — ${TMUX_SESSION}"
else
    TITLE="Claude Code"
fi

MESSAGE="Session ${SESSION_ID:-unknown} has stopped. Check the terminal for details."

# ─── macOS notification ───────────────────────────────────────────────────────

osascript - <<APPLESCRIPT 2>/dev/null || true
display notification "$MESSAGE" with title "$TITLE" sound name "Glass"
APPLESCRIPT

# ─── terminal notification via tmux ───────────────────────────────────────────

if [[ -n "$TMUX_PANE_ID" ]]; then
    # Display message in the session status bar
    tmux display-message -t "$TMUX_PANE_ID" "⚡ Claude: interaction requested" 2>/dev/null || true

    # Send bell to the pane to alert terminals monitoring activity
    printf '\a' | tmux load-buffer - 2>/dev/null || true
    tmux send-keys -t "$TMUX_PANE_ID" "" 2>/dev/null || true
fi

exit 0
