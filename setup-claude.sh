#!/usr/bin/env bash
# Blue Coding Dev Kit — Claude Code global setup
# Run once after cloning to configure Claude Code on your machine.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_GLOBAL="$HOME/.claude"

print_step() { printf '\n\033[1;34m→\033[0m %s\n' "$1"; }
print_ok()   { printf '  \033[1;32m✓\033[0m %s\n' "$1"; }
print_warn() { printf '  \033[1;33m!\033[0m %s\n' "$1"; }

# ── 1. Install the design system skill globally ────────────────────────────
print_step "Installing blue-coding-design-system skill globally..."

mkdir -p "$CLAUDE_GLOBAL/skills"
rsync -a --delete \
  "$REPO_DIR/.claude/skills/blue-coding-design-system/" \
  "$CLAUDE_GLOBAL/skills/blue-coding-design-system/"

print_ok "~/.claude/skills/blue-coding-design-system/ installed"

# ── 2. Write settings.local.json with correct hook paths ──────────────────
print_step "Configuring project hooks in .claude/settings.local.json..."

SETTINGS_FILE="$REPO_DIR/.claude/settings.local.json"

# Preserve existing permissions if the file already exists
EXISTING_PERMISSIONS="null"
if [ -f "$SETTINGS_FILE" ]; then
  EXISTING_PERMISSIONS="$(jq '.permissions // null' "$SETTINGS_FILE")"
fi

jq -n \
  --arg push_hook  "bash $REPO_DIR/.claude/hooks/bc-push-auth.sh" \
  --arg env_hook   "bash $REPO_DIR/.claude/hooks/bc-env-guard.sh" \
  --argjson perms  "$EXISTING_PERMISSIONS" \
'{
  permissions: (if $perms != null then $perms else {} end),
  hooks: {
    PreToolUse: [
      {
        matcher: "Bash",
        hooks: [
          { type: "command", command: $push_hook, statusMessage: "Checking push authorization..." },
          { type: "command", command: $env_hook,  statusMessage: "Checking file access..." }
        ]
      },
      {
        matcher: "Read",
        hooks: [
          { type: "command", command: $env_hook, statusMessage: "Checking file access..." }
        ]
      }
    ]
  }
}' > "$SETTINGS_FILE"

print_ok ".claude/settings.local.json written with paths for $REPO_DIR"

# ── Done ──────────────────────────────────────────────────────────────────
printf '\n\033[1;32mClaude Code configured for Blue Coding dev kit.\033[0m\n'
printf 'Restart Claude Code if it was already running.\n\n'
