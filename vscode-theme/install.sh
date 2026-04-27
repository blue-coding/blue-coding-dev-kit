#!/usr/bin/env bash
# Installs the Blue Coding Dark VSCode theme

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="${SCRIPT_DIR}/blue-coding-dark"

# True-color output helpers
O='\033[38;2;0;145;206m'
B='\033[38;2;1;99;142m'
G='\033[38;2;43;167;122m'
Y='\033[38;2;224;169;59m'
R='\033[38;2;217;74;74m'
W='\033[38;2;200;222;255m'
M='\033[38;2;74;108;132m'
BOLD='\033[1m'
RST='\033[0m'

banner() {
  printf "\n"
  printf "  ${B}${BOLD}██████╗ ${O}██╗      ██╗   ██╗███████╗${RST}  ${W}${BOLD}CODING${RST}\n"
  printf "  ${B}${BOLD}██╔══██╗${O}██║      ██║   ██║██╔════╝${RST}  ${M}VSCode Theme Installer${RST}\n"
  printf "  ${B}${BOLD}██████╔╝${O}██║      ██║   ██║█████╗  ${RST}\n"
  printf "  ${B}${BOLD}██╔══██╗${O}██║      ██║   ██║██╔══╝  ${RST}\n"
  printf "  ${B}${BOLD}██████╔╝${O}███████╗ ╚██████╔╝███████╗${RST}\n"
  printf "  ${B}${BOLD}╚═════╝ ${O}╚══════╝  ╚═════╝ ╚══════╝${RST}\n"
  printf "\n"
}

banner

# ─── Detect code CLI ──────────────────────────────────────────────────────────
CODE_CMD=""
for cmd in code code-insiders codium; do
  if command -v "${cmd}" &>/dev/null; then
    CODE_CMD="${cmd}"
    break
  fi
done

if [[ -z "${CODE_CMD}" ]]; then
  printf "${Y}VS Code CLI not found in PATH.${RST}\n\n"
  printf "${W}Manual installation:${RST}\n"
  printf "  1. Open VS Code\n"
  printf "  2. ${M}Extensions${RST} → ${O}···${RST} → ${O}Install from VSIX…${RST}\n"
  printf "     or: ${M}Ctrl+Shift+P${RST} → ${O}Developer: Install Extension from Location${RST}\n"
  printf "  3. Point to: ${O}${THEME_DIR}${RST}\n\n"
  exit 1
fi

printf "${W}Detected:${RST} ${O}${CODE_CMD}${RST}\n\n"

# ─── Check for vsce (optional packager) ──────────────────────────────────────
if command -v vsce &>/dev/null; then
  printf "${W}Packaging extension with vsce...${RST}\n"
  cd "${THEME_DIR}"
  vsce package --out "${SCRIPT_DIR}/blue-coding-dark.vsix" 2>/dev/null && \
    "${CODE_CMD}" --install-extension "${SCRIPT_DIR}/blue-coding-dark.vsix" && \
    printf "\n${G}Theme installed via VSIX!${RST}\n" && exit 0
fi

# ─── Direct folder install (development install) ─────────────────────────────
EXT_DIR=""
if [[ "$(uname)" == "Darwin" ]]; then
  EXT_DIR="${HOME}/.vscode/extensions"
elif [[ "$(uname)" == "Linux" ]]; then
  EXT_DIR="${HOME}/.vscode/extensions"
else
  # Windows / WSL
  WIN_APPDATA="${APPDATA:-/mnt/c/Users/$(whoami)/AppData/Roaming}"
  EXT_DIR="${WIN_APPDATA}/Code/User/extensions"
  [[ ! -d "${EXT_DIR}" ]] && EXT_DIR="${HOME}/.vscode/extensions"
fi

DEST="${EXT_DIR}/blue-coding.blue-coding-dark-1.0.0"

printf "${W}Installing to:${RST} ${O}${DEST}${RST}\n\n"
mkdir -p "${DEST}"
cp -r "${THEME_DIR}/." "${DEST}/"

printf "${G}${BOLD}Done!${RST}\n\n"
printf "${W}Activate the theme:${RST}\n"
printf "  ${M}Ctrl+K Ctrl+T${RST}  →  search  ${O}Blue Coding Dark${RST}\n"
printf "  ${M}or:${RST} ${O}File → Preferences → Color Theme → Blue Coding Dark${RST}\n\n"
printf "${M}Restart VS Code if the theme does not appear immediately.${RST}\n\n"
