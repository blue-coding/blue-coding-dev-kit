#!/usr/bin/env bash
# Blue Coding — block Claude from reading .env files

INPUT="$(cat)"
TOOL="$(printf '%s' "$INPUT" | jq -r '.tool_name // ""')"

is_gitignored() {
  local file="$1"
  git check-ignore -q "$file" 2>/dev/null
}

deny() {
  local file="$1"
  local reason="Access to .env files is blocked to protect secrets and API keys. Do not read .env files."

  if [ -n "$file" ] && ! is_gitignored "$file"; then
    reason="$reason WARNING: $file is not in .gitignore — it could be accidentally committed. Add it to .gitignore immediately."
  fi

  jq -n \
    --arg reason "$reason" \
    '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "deny", permissionDecisionReason: $reason}}'
}

is_env_path() {
  local base
  base="$(basename "$1")"
  # Matches: .env | .env.local | .env.production | something.env
  printf '%s' "$base" | grep -qE '^\.env$|^\.env\.|\.env$'
}

if [ "$TOOL" = "Read" ]; then
  FILE_PATH="$(printf '%s' "$INPUT" | jq -r '.tool_input.file_path // ""')"
  if [ -n "$FILE_PATH" ] && is_env_path "$FILE_PATH"; then
    deny "$FILE_PATH"
    exit 0
  fi
fi

if [ "$TOOL" = "Bash" ]; then
  CMD="$(printf '%s' "$INPUT" | jq -r '.tool_input.command // ""')"
  # Block file-reading commands that target a .env file.
  # Only matches when a known read-access command precedes the .env path,
  # avoiding false positives in git commit messages, echo, comments, etc.
  ENV_FILE="$(printf '%s' "$CMD" | grep -oE '[^[:space:]]*\.env([[:space:]]|$|\.)' | head -1 | tr -d ' ')"
  if printf '%s' "$CMD" | grep -qE \
    '(^|[;&|[:space:]])(cat|head|tail|less|more|source|\.|cp|mv|nano|vim|vi|code|bat)\s+[^;&|]*\.env([[:space:]]|$|\.)'; then
    deny "$ENV_FILE"
    exit 0
  fi
fi

exit 0
