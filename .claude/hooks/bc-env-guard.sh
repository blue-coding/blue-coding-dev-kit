#!/usr/bin/env bash
# Blue Coding — block Claude from reading .env files

INPUT="$(cat)"
TOOL="$(printf '%s' "$INPUT" | jq -r '.tool_name // ""')"

deny() {
  jq -n \
    '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "deny", permissionDecisionReason: "Access to .env files is blocked to protect secrets and API keys. Do not read .env files."}}'
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
    deny
    exit 0
  fi
fi

if [ "$TOOL" = "Bash" ]; then
  CMD="$(printf '%s' "$INPUT" | jq -r '.tool_input.command // ""')"
  # Detect .env file references in shell commands (e.g. cat .env, head /path/.env.local)
  if printf '%s' "$CMD" | grep -qE '(^|[[:space:]/])([^[:space:]]*)\.env([[:space:]]|$|\.)'; then
    deny
    exit 0
  fi
fi

exit 0
