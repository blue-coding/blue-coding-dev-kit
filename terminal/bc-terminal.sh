#!/usr/bin/env bash
# Blue Coding Terminal Theme
# Run once:   bash bc-terminal.sh
# Auto-load:  source ~/blue-coding-dev-kit/terminal/bc-terminal.sh  (add to .bashrc / .zshrc)

# ─── True-color detection ────────────────────────────────────────────────────
BC_TRUECOLOR=0
if [[ "${COLORTERM}" == "truecolor" || "${COLORTERM}" == "24bit" ]]; then
  BC_TRUECOLOR=1
elif [[ "${TERM_PROGRAM}" == "iTerm.app" || "${TERM_PROGRAM}" == "vscode" ]]; then
  BC_TRUECOLOR=1
elif [[ -n "${WT_SESSION}" ]]; then        # Windows Terminal
  BC_TRUECOLOR=1
fi

# ─── Color definitions (true-color ANSI) ─────────────────────────────────────
if [[ ${BC_TRUECOLOR} -eq 1 ]]; then
  BC_PRUSSIAN='\e[38;2;16;28;50m'        # #101C32 — dark navy
  BC_BALTIC='\e[38;2;1;99;142m'          # #01638E — Baltic Blue
  BC_OCEAN='\e[38;2;0;145;206m'          # #0091CE — Ocean Blue
  BC_BLUEBELL='\e[38;2;31;150;219m'      # #1F96DB — Blue Bell
  BC_SAPPHIRE='\e[38;2;91;143;232m'      # #5B8FE8 — Sapphire (lighter for readability)
  BC_CYAN='\e[38;2;90;191;237m'          # #5ABFED — light cyan
  BC_GREEN='\e[38;2;43;167;122m'         # #2BA77A — success green
  BC_YELLOW='\e[38;2;224;169;59m'        # #E0A93B — warning yellow
  BC_RED='\e[38;2;217;74;74m'            # #D94A4A — error red
  BC_WHITE='\e[38;2;245;250;255m'        # #F5FAFF — Alice Blue
  BC_MUTED='\e[38;2;74;108;132m'         # #4A6C84 — muted blue
  BC_DIM='\e[38;2;45;74;101m'            # #2D4A65 — very muted

  BC_BG_DARK='\e[48;2;9;18;32m'          # #091220 — sidebar dark
  BC_BG_EDITOR='\e[48;2;12;24;40m'       # #0C1828 — editor bg
  BC_BG_BALTIC='\e[48;2;1;99;142m'       # #01638E — Baltic Blue bg
  BC_BG_OCEAN='\e[48;2;0;145;206m'       # #0091CE — Ocean Blue bg
else
  # 256-color fallback (nearest ANSI approximations)
  BC_PRUSSIAN='\e[38;5;17m'
  BC_BALTIC='\e[38;5;31m'
  BC_OCEAN='\e[38;5;38m'
  BC_BLUEBELL='\e[38;5;39m'
  BC_SAPPHIRE='\e[38;5;75m'
  BC_CYAN='\e[38;5;81m'
  BC_GREEN='\e[38;5;35m'
  BC_YELLOW='\e[38;5;179m'
  BC_RED='\e[38;5;167m'
  BC_WHITE='\e[38;5;195m'
  BC_MUTED='\e[38;5;60m'
  BC_DIM='\e[38;5;24m'
  BC_BG_DARK='\e[48;5;17m'
  BC_BG_EDITOR='\e[48;5;17m'
  BC_BG_BALTIC='\e[48;5;31m'
  BC_BG_OCEAN='\e[48;5;38m'
fi

BC_BOLD='\e[1m'
BC_ITALIC='\e[3m'
BC_RESET='\e[0m'
BC_DIM_STYLE='\e[2m'

export BC_TRUECOLOR BC_PRUSSIAN BC_BALTIC BC_OCEAN BC_BLUEBELL BC_SAPPHIRE
export BC_CYAN BC_GREEN BC_YELLOW BC_RED BC_WHITE BC_MUTED BC_DIM
export BC_BG_DARK BC_BG_EDITOR BC_BG_BALTIC BC_BG_OCEAN
export BC_BOLD BC_ITALIC BC_RESET BC_DIM_STYLE

# ─── Set terminal ANSI color palette ─────────────────────────────────────────
# Uses OSC 4 escape sequences (supported by most modern terminals)
_bc_set_palette() {
  printf '\e]4;0;#101C32\a'   # Black    → Prussian Blue
  printf '\e]4;1;#D94A4A\a'   # Red      → Error
  printf '\e]4;2;#2BA77A\a'   # Green    → Success
  printf '\e]4;3;#E0A93B\a'   # Yellow   → Warning
  printf '\e]4;4;#01638E\a'   # Blue     → Baltic Blue
  printf '\e]4;5;#3771D6\a'   # Magenta  → Sapphire Sky
  printf '\e]4;6;#0091CE\a'   # Cyan     → Ocean Blue
  printf '\e]4;7;#A8C4D8\a'   # White    → muted blue-white
  printf '\e]4;8;#243B55\a'   # BrBla    → dark blue-grey
  printf '\e]4;9;#E06B6B\a'   # BrRed    → bright error
  printf '\e]4;10;#4DC49A\a'  # BrGreen  → bright success
  printf '\e]4;11;#F0C060\a'  # BrYellow → bright warning
  printf '\e]4;12;#1F96DB\a'  # BrBlue   → Blue Bell
  printf '\e]4;13;#7BA7ED\a'  # BrMag    → lighter sapphire
  printf '\e]4;14;#5ABFED\a'  # BrCyan   → light cyan
  printf '\e]4;15;#F5FAFF\a'  # BrWhite  → Alice Blue

  # Terminal background / foreground / cursor
  printf '\e]10;#C8DEFF\a'    # default foreground
  printf '\e]11;#091220\a'    # default background
  printf '\e]12;#0091CE\a'    # cursor color
}

# ─── ASCII banner ─────────────────────────────────────────────────────────────
_bc_banner() {
  local G1="${BC_BALTIC}${BC_BOLD}"
  local G2="${BC_OCEAN}${BC_BOLD}"
  local G3="${BC_BLUEBELL}${BC_BOLD}"
  local G4="${BC_SAPPHIRE}${BC_BOLD}"
  local G5="${BC_CYAN}${BC_BOLD}"
  local G6="${BC_WHITE}${BC_BOLD}"
  local C="${BC_CYAN}"
  local M="${BC_MUTED}"
  local R="${BC_RESET}"

  local _user _host _ip _date
  _user="$(id -un)"
  _host="$(hostname -s 2>/dev/null || echo '?')"
  _ip="$(hostname -I 2>/dev/null | awk '{print $1}')"
  [[ -z "$_ip" ]] && _ip="$(ipconfig getifaddr en0 2>/dev/null || echo '?.?.?.?')"
  _date="$(LC_TIME=en_US.UTF-8 date '+%A, %B %d, %Y' 2>/dev/null || LANG=C date '+%A, %B %d, %Y')"

  printf "\n"
  printf "  ${G1}████  ${G2}█     ${G3}█   █ █████  ${G4} ████  ███  ${G5}████  ███ ${G6}█   █  ███ ${R}\n"
  printf "  ${G1}█   █ ${G2}█     ${G3}█   █ █      ${G4}█     █   █ ${G5}█   █  █  ${G6}██  █ █    ${R}\n"
  printf "  ${G1}████  ${G2}█     ${G3}█   █ ████   ${G4}█     █   █ ${G5}█   █  █  ${G6}█ █ █ █  ██${R}\n"
  printf "  ${G1}█   █ ${G2}█     ${G3}█   █ █      ${G4}█     █   █ ${G5}█   █  █  ${G6}█  ██ █   █${R}\n"
  printf "  ${G1}████  ${G2}█████ ${G3} ███  █████  ${G4} ████  ███  ${G5}████  ███ ${G6}█   █  ████${R}\n"
  printf "\n"
  printf "  ${C}Nearshore Software Development${R}  ${M}·  ${G2}${_user}${M}@${C}${_host}${R}  ${M}·  ${_ip}${R}\n"
  printf "  ${M}${_date}  ·  bluecoding.com  ·  %s${R}\n" \
    "$( [[ ${BC_TRUECOLOR} -eq 1 ]] && printf "true-color" || printf "256-color" )"
  printf "\n"
}

# ─── Git branch helper ───────────────────────────────────────────────────────
_bc_git_info() {
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  local branch dirty
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  [[ -z "$(git status --porcelain 2>/dev/null)" ]] && dirty="" || dirty="*"
  printf " ${BC_BLUEBELL} ${branch}${dirty}${BC_RESET}"
}

# ─── Prompt (bash) ────────────────────────────────────────────────────────────
_bc_set_bash_prompt() {
  local user host dir git_info
  local B="\\[${BC_BALTIC}\\]"
  local O="\\[${BC_OCEAN}\\]"
  local C="\\[${BC_CYAN}\\]"
  local W="\\[${BC_WHITE}\\]"
  local M="\\[${BC_MUTED}\\]"
  local G="\\[${BC_GREEN}\\]"
  local R="\\[${BC_RESET}\\]"
  local BOLD="\\[${BC_BOLD}\\]"

  PS1="${M}╭─${R}${B}${BOLD}[BC]${R} ${O}\\u${R}${M}@${R}${C}\\h${R}  ${W}\\w${R}\$(_bc_git_info)\\n${M}╰─${R}${O}${BOLD}❯${R} "
  PS2="${M}  ·${R} "
  export PS1 PS2
}

# ─── Prompt (zsh) ─────────────────────────────────────────────────────────────
_bc_set_zsh_prompt() {
  autoload -Uz vcs_info 2>/dev/null
  if typeset -f vcs_info &>/dev/null; then
    precmd_functions+=(_bc_vcs_precmd)
    zstyle ':vcs_info:git:*' formats " %%B%F{#1F96DB} %b%f%%b"
    zstyle ':vcs_info:git:*' actionformats " %%B%F{#E0A93B} %b (%a)%f%%b"
    zstyle ':vcs_info:*' enable git
  fi

  _bc_vcs_precmd() { vcs_info; }

  PROMPT='%F{#4A6C84}╭─%f%B%F{#01638E}[BC]%f%b %F{#0091CE}%n%f%F{#4A6C84}@%f%F{#5ABFED}%m%f  %F{#F5FAFF}%~%f${vcs_info_msg_0_}
%F{#4A6C84}╰─%f%B%F{#0091CE}❯%f%b '
  RPROMPT='%F{#4A6C84}%*%f'
  export PROMPT RPROMPT
}

# ─── LS colors ───────────────────────────────────────────────────────────────
_bc_set_ls_colors() {
  # dircolors-style LS_COLORS tuned to BC palette
  export LS_COLORS='rs=0:di=38;2;31;150;219;1:ln=38;2;90;191;237:mh=00:pi=38;2;224;169;59:so=38;2;91;143;232:do=38;2;91;143;232:bd=38;2;224;169;59;1:cd=38;2;224;169;59;1:or=38;2;217;74;74:mi=00:su=38;2;217;74;74;1:sg=38;2;224;169;59;1:ca=00:tw=38;2;43;167;122:ow=38;2;43;167;122;1:st=38;2;1;99;142;1:ex=38;2;43;167;122;1:*.tar=38;2;217;74;74:*.tgz=38;2;217;74;74:*.gz=38;2;217;74;74:*.bz2=38;2;217;74;74:*.zip=38;2;217;74;74:*.rar=38;2;217;74;74:*.7z=38;2;217;74;74:*.jar=38;2;217;74;74:*.war=38;2;217;74;74:*.py=38;2;31;150;219:*.js=38;2;224;169;59:*.ts=38;2;31;150;219:*.jsx=38;2;224;169;59:*.tsx=38;2;31;150;219:*.go=38;2;90;191;237:*.rs=38;2;224;169;59:*.sh=38;2;43;167;122:*.bash=38;2;43;167;122:*.zsh=38;2;43;167;122:*.json=38;2;224;169;59:*.yaml=38;2;224;169;59:*.yml=38;2;224;169;59:*.toml=38;2;224;169;59:*.md=38;2;200;222;255:*.txt=38;2;200;222;255:*.html=38;2;77;174;209:*.css=38;2;91;143;232:*.scss=38;2;91;143;232:*.png=38;2;90;191;237:*.jpg=38;2;90;191;237:*.gif=38;2;90;191;237:*.svg=38;2;90;191;237:*.pdf=38;2;217;74;74:*.lock=38;2;74;108;132:*.log=38;2;74;108;132'
}

# ─── Aliases ─────────────────────────────────────────────────────────────────
_bc_set_aliases() {
  if command -v dircolors &>/dev/null; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
  elif command -v gls &>/dev/null; then
    alias ls='gls --color=auto'
  fi

  alias ll='ls -lh'
  alias la='ls -lha'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  # git shortcuts
  alias gs='git status -sb'
  alias gd='git diff'
  alias gl='git log --oneline --graph --color'
  alias gb='git branch -a'
}

# ─── GREP colors ─────────────────────────────────────────────────────────────
export GREP_COLORS='ms=38;2;0;145;206;1:mc=38;2;0;145;206:sl=:cx=:fn=38;2;31;150;219:ln=38;2;224;169;59:bn=38;2;43;167;122:se=38;2;74;108;132'

# ─── Apply everything ─────────────────────────────────────────────────────────
_bc_apply_theme() {
  _bc_set_palette
  _bc_set_ls_colors
  _bc_set_aliases

  if [[ -n "${ZSH_VERSION}" ]]; then
    _bc_set_zsh_prompt
  elif [[ -n "${BASH_VERSION}" ]]; then
    _bc_set_bash_prompt
    PROMPT_COMMAND='_bc_set_bash_prompt'
  fi
}

# ─── Installer ────────────────────────────────────────────────────────────────
_bc_install() {
  local SCRIPT_PATH
  SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)/$(basename "${BASH_SOURCE[0]:-$0}")"

  local SOURCE_LINE="source \"${SCRIPT_PATH}\""
  local RCFILE

  if [[ -n "${ZSH_VERSION}" || "${SHELL}" == */zsh ]]; then
    RCFILE="${HOME}/.zshrc"
  else
    RCFILE="${HOME}/.bashrc"
  fi

  printf "\n${BC_OCEAN}${BC_BOLD}Blue Coding Terminal Theme — Installer${BC_RESET}\n"
  printf "${BC_MUTED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${BC_RESET}\n\n"

  if grep -qF "${SCRIPT_PATH}" "${RCFILE}" 2>/dev/null; then
    printf "${BC_YELLOW}Already installed in ${RCFILE}${BC_RESET}\n\n"
    return 0
  fi

  printf "${BC_WHITE}This will add the following line to ${BC_CYAN}${RCFILE}${BC_RESET}:\n"
  printf "  ${BC_MUTED}${SOURCE_LINE}${BC_RESET}\n\n"
  printf "${BC_WHITE}Proceed? ${BC_MUTED}[y/N]${BC_RESET} "
  read -r answer

  if [[ "${answer}" =~ ^[Yy] ]]; then
    {
      printf "\n# Blue Coding terminal theme\n"
      printf "%s\n" "${SOURCE_LINE}"
    } >> "${RCFILE}"
    printf "\n${BC_GREEN}Installed!${BC_RESET} Restart your terminal or run:\n"
    printf "  ${BC_OCEAN}source ${RCFILE}${BC_RESET}\n\n"
  else
    printf "${BC_MUTED}Skipped. Run ${BC_OCEAN}source ${SCRIPT_PATH}${BC_MUTED} anytime to activate manually.${BC_RESET}\n\n"
  fi
}

# ─── Entry point ─────────────────────────────────────────────────────────────
# When sourced → apply theme + show banner (every new terminal session)
# When executed directly → apply theme + show banner + offer install
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  _bc_apply_theme
  _bc_banner
  _bc_install
else
  _bc_apply_theme
  _bc_banner
fi
