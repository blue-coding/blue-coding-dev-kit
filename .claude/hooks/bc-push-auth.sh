#!/usr/bin/env bash
# Blue Coding — Claude Code pre-push authorization hook
# Blocks git push unless BC_PUSH_AUTHORIZED=true or ~/.bc-push-token exists

INPUT="$(cat)"
CMD="$(printf '%s' "$INPUT" | jq -r '.tool_input.command // ""')"

# Only intercept commands that contain a git push
if ! printf '%s' "$CMD" | grep -qE '(^|[;&|[:space:]])git\s+(push|-C\s+\S+\s+push)'; then
  exit 0
fi

# ── Authorization checks ──────────────────────────────────────────────────────

# 1. Environment variable override
if [[ "${BC_PUSH_AUTHORIZED}" == "true" ]]; then
  exit 0
fi

# 2. Token file
if [[ -f "${HOME}/.bc-push-token" ]]; then
  exit 0
fi

# ── Not authorized — block and explain ───────────────────────────────────────
printf '%s' '{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "Push blocked by Blue Coding authorization hook.\n\nTo allow Claude to push, choose one option:\n  1. export BC_PUSH_AUTHORIZED=true   (current session only)\n  2. touch ~/.bc-push-token            (persistent)\n\nTo push manually, run: git push"
  }
}'
