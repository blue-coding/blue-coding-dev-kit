#!/usr/bin/env bash
# Blue Coding — Claude Code git authorization hook
# Forces explicit user confirmation before any git push or git commit

INPUT="$(cat)"
CMD="$(printf '%s' "$INPUT" | jq -r '.tool_input.command // ""')"

ask() {
  local action="$1"
  jq -n \
    --arg cmd "$CMD" \
    --arg action "$action" \
    '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "ask", permissionDecisionReason: ("Claude wants to " + $action + ".\n\nCommand: " + $cmd + "\n\nApprove only if you explicitly requested this.")}}'
}

# Intercept git push
if printf '%s' "$CMD" | grep -qE '(^|[;&|[:space:]])git(\s+-C\s+\S+)?\s+push'; then
  ask "push to the remote repository"
  exit 0
fi

# Intercept git commit
if printf '%s' "$CMD" | grep -qE '(^|[;&|[:space:]])git(\s+-C\s+\S+)?\s+commit'; then
  ask "create a git commit"
  exit 0
fi

exit 0
