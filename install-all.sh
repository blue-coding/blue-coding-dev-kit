#!/usr/bin/env bash
# Blue Coding Dev Kit — full installer

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

O='\033[38;2;0;145;206m'
B='\033[38;2;1;99;142m'
G='\033[38;2;43;167;122m'
W='\033[38;2;200;222;255m'
M='\033[38;2;74;108;132m'
BOLD='\033[1m'
RST='\033[0m'

printf "\n"
printf "  ${B}${BOLD}██████╗ ${O}██╗      ██╗   ██╗███████╗${RST}  ${W}${BOLD}CODING${RST}\n"
printf "  ${B}${BOLD}██╔══██╗${O}██║      ██║   ██║██╔════╝${RST}  ${M}Dev Kit Installer${RST}\n"
printf "  ${B}${BOLD}██████╔╝${O}██║      ██║   ██║█████╗  ${RST}\n"
printf "  ${B}${BOLD}██╔══██╗${O}██║      ██║   ██║██╔══╝  ${RST}\n"
printf "  ${B}${BOLD}██████╔╝${O}███████╗ ╚██████╔╝███████╗${RST}\n"
printf "  ${B}${BOLD}╚═════╝ ${O}╚══════╝  ╚═════╝ ╚══════╝${RST}\n"
printf "\n"
printf "  ${M}What would you like to install?${RST}\n\n"
printf "  ${O}1${RST}  VS Code theme\n"
printf "  ${O}2${RST}  Terminal theme (bash/zsh prompt + colors)\n"
printf "  ${O}3${RST}  Both\n\n"
printf "  ${W}Choice [1/2/3]:${RST} "
read -r choice

case "${choice}" in
  1)
    bash "${SCRIPT_DIR}/vscode-theme/install.sh"
    ;;
  2)
    bash "${SCRIPT_DIR}/terminal/bc-terminal.sh"
    ;;
  3|"")
    bash "${SCRIPT_DIR}/vscode-theme/install.sh"
    bash "${SCRIPT_DIR}/terminal/bc-terminal.sh"
    ;;
  *)
    printf "\n${M}No changes made.${RST}\n\n"
    ;;
esac
