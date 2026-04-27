# Blue Coding Dev Kit

Official visual tooling to adapt your development environment to the **Blue Coding** brand. Includes a complete VS Code theme and a terminal customization script for bash and zsh.

```text
  ██████╗  ██╗       ██╗   ██╗███████╗   CODING
  ██╔══██╗ ██║       ██║   ██║██╔════╝   ──────────────────────────────
  ██████╔╝ ██║       ██║   ██║█████╗     Nearshore Software Development
  ██╔══██╗ ██║       ██║   ██║██╔══╝     bluecoding.com
  ██████╔╝ ███████╗  ╚██████╔╝███████╗
  ╚═════╝  ╚══════╝   ╚═════╝ ╚══════╝
```

---

## Contents

```text
blue-coding-dev-kit/
├── CLAUDE.md                               # Project context for Claude Code
├── README.md
├── install-all.sh                          # Interactive unified installer
│
├── design-system/                          # Brand Identity Manual 2026
│   ├── README.md                           # Full brand guidelines
│   ├── colors_and_type.css                 # Official CSS tokens (source of truth)
│   ├── assets/
│   │   ├── logos/                          # Logo-Colour, Logo-White, Symbol, Logotype (SVG)
│   │   ├── icons/                          # 54 Phosphor duotone icons (SVG)
│   │   └── imagery/                        # 10 brand photography assets
│   └── fonts/
│       └── MavenPro-VariableFont_wght.ttf
│
├── vscode-theme/
│   ├── install.sh                          # Theme installer
│   └── blue-coding-dark/
│       ├── package.json                    # VS Code extension manifest
│       └── themes/
│           └── Blue-Coding-Dark-color-theme.json   # Full theme (1005 tokens)
│
└── terminal/
    ├── bc-terminal.sh                      # Terminal theme main script
    └── profiles/
        ├── windows-terminal.json           # Windows Terminal profile
        └── iterm2-profile.json             # iTerm2 profile (macOS)
```

---

## Quick install

```bash
# Install both tools interactively
bash ~/blue-coding-dev-kit/install-all.sh
```

Or install each tool separately:

```bash
# VS Code theme only
bash ~/blue-coding-dev-kit/vscode-theme/install.sh

# Terminal theme only
bash ~/blue-coding-dev-kit/terminal/bc-terminal.sh
```

---

## 1. VS Code Theme — Blue Coding Dark

A complete dark theme built from the official Blue Coding palette. Covers syntax for 10+ languages, the full editor UI, integrated terminal, Git, debugger, and panels.

### Installation

#### Option A — Automatic script (recommended)

```bash
bash ~/blue-coding-dev-kit/vscode-theme/install.sh
```

The script detects the VS Code CLI and copies the extension to the user extensions directory. If the CLI is not found, it prints manual installation instructions.

#### Option B — Manual

1. Open VS Code
2. `Ctrl+Shift+P` → `Developer: Install Extension from Location`
3. Select the folder `vscode-theme/blue-coding-dark/`
4. Restart VS Code

#### Activate the theme

```text
Ctrl+K  Ctrl+T   →   Blue Coding Dark
```

Or from the menu: `File → Preferences → Color Theme → Blue Coding Dark`

### Color palette

| UI Element | Color | Hex |
| --- | --- | --- |
| Editor background | Prussian Navy | `#0C1828` |
| Sidebar background | Deep Navy | `#091220` |
| Activity bar background | Deepest Navy | `#060D18` |
| Status bar | Baltic Blue | `#01638E` |
| Cursor | Ocean Blue | `#0091CE` |
| Selection | Blue Bell 20% | `#1F96DB30` |

| Syntax token | Color | Hex |
| --- | --- | --- |
| Keywords — `if` / `for` / `return` | Ocean Blue | `#0091CE` |
| Storage — `const` / `class` / `function` | Blue Bell | `#1F96DB` |
| Function / method names | Light Blue | `#7AB8E8` |
| Types / interfaces / classes | Blue Bell | `#1F96DB` |
| Strings | Success Green | `#2BA77A` |
| Numbers / booleans / null | Warning Yellow | `#E0A93B` |
| Comments | Muted Blue | `#3E5C76` italic |
| Variables and parameters | Ice Blue | `#C8DEFF` / `#A8C8F0` |
| Object properties | Soft Blue | `#7AB8E8` |
| Decorators / annotations | Sapphire Light | `#7BA7ED` |
| Errors / invalid | Error Red | `#D94A4A` |
| `this` / `self` / `super` | Ocean Blue italic | `#0091CE` |

### Supported languages

JavaScript · TypeScript · JSX · TSX · Python · Go · Rust · HTML · CSS / SCSS · JSON · YAML · TOML · Markdown · Shell · Regex

### Integrated terminal colors

The theme also configures the 16-color ANSI palette of the VS Code integrated terminal:

| ANSI | BC Name | Hex |
| --- | --- | --- |
| Black | Prussian Blue | `#101C32` |
| Blue | Baltic Blue | `#01638E` |
| Cyan | Ocean Blue | `#0091CE` |
| Green | Success | `#2BA77A` |
| Yellow | Warning | `#E0A93B` |
| Red | Error | `#D94A4A` |
| Magenta | Sapphire Sky | `#3771D6` |
| White | Muted Blue-White | `#A8C4D8` |
| Bright Blue | Blue Bell | `#1F96DB` |
| Bright Cyan | Light Cyan | `#5ABFED` |
| Bright White | Alice Blue | `#F5FAFF` |

---

## 2. Terminal — Blue Coding Theme

A script for bash and zsh that applies the Blue Coding visual identity to the console: color palette, two-line branded prompt, `ls` and `grep` colors, and Git shortcuts.

### Activate in the current session

```bash
source ~/blue-coding-dev-kit/terminal/bc-terminal.sh
```

### Install permanently (add to `.bashrc` / `.zshrc`)

```bash
bash ~/blue-coding-dev-kit/terminal/bc-terminal.sh
```

The script detects the active shell, shows the Blue Coding banner, and offers to append the `source` line to the corresponding config file.

### What it includes

#### ANSI palette (16 system colors)

Replaces the terminal's standard colors using OSC4 sequences. Compatible with most modern emulators (Windows Terminal, iTerm2, GNOME Terminal, Kitty, Alacritty).

| ANSI slot | BC color | Hex |
| --- | --- | --- |
| Black | Prussian Blue | `#101C32` |
| Blue | Baltic Blue | `#01638E` |
| Cyan | Ocean Blue | `#0091CE` |
| Bright Blue | Blue Bell | `#1F96DB` |
| Bright Cyan | Light Cyan | `#5ABFED` |
| Green | Success | `#2BA77A` |
| Yellow | Warning | `#E0A93B` |
| Red | Error | `#D94A4A` |
| Background | Deep Navy | `#091220` |
| Cursor | Ocean Blue | `#0091CE` |

#### Prompt

```text
╭─[BC] user@host  ~/current/path  main*
╰─❯ _
```

| Segment | Color |
| --- | --- |
| `[BC]` | Baltic Blue |
| user | Ocean Blue |
| `@host` | Light Cyan |
| path | Alice Blue |
| git branch | Blue Bell (with `*` if dirty) |
| `╰─❯` | Ocean Blue |

The prompt updates dynamically on every command. In zsh, the current time is also shown on the right side.

#### LS_COLORS

Differentiated colors by file type:

| Type | Color |
| --- | --- |
| Directories | Blue Bell bold |
| Symlinks | Light Cyan |
| Executables | Success Green |
| `.ts` / `.py` / `.go` files | Blue Bell / Light Cyan |
| `.json` / `.yaml` files | Warning Yellow |
| `.html` / `.css` files | Soft Blue |
| Compressed archives | Error Red |
| `.md` / `.txt` files | Ice Blue |
| Logs / locks | Muted |

#### GREP_COLORS

Matches highlighted in Ocean Blue bold over the terminal background.

#### Git aliases

| Alias | Command |
| --- | --- |
| `gs` | `git status -sb` |
| `gd` | `git diff` |
| `gl` | `git log --oneline --graph --color` |
| `gb` | `git branch -a` |

#### Listing aliases

| Alias | Command |
| --- | --- |
| `ls` | `ls --color=auto` |
| `ll` | `ls -lh` |
| `la` | `ls -lha` |

### Color compatibility

The script automatically detects the supported color mode:

| Terminal | Mode | Behavior |
| --- | --- | --- |
| Windows Terminal | True-color (24-bit) | Exact BC palette |
| iTerm2 | True-color (24-bit) | Exact BC palette |
| VS Code terminal | True-color (24-bit) | Exact BC palette |
| GNOME Terminal | True-color (24-bit) | Exact BC palette |
| Terminal.app (macOS) | 256 colors | 256-color approximation |
| TTY / basic SSH | 256 colors | 256-color approximation |

To force a specific mode:

```bash
COLORTERM=truecolor source ~/blue-coding-dev-kit/terminal/bc-terminal.sh  # force 24-bit
COLORTERM=""         source ~/blue-coding-dev-kit/terminal/bc-terminal.sh  # force 256-color
```

---

## 3. Additional terminal profiles

### Windows Terminal

Copy the content of `terminal/profiles/windows-terminal.json` into your Windows Terminal settings:

1. Open Windows Terminal → `Ctrl+,` (Settings)
2. Click **"Open JSON file"** (bottom-left corner)
3. Add the profile object inside the `"profiles.list"` array
4. Save — the **Blue Coding Dark** profile appears in the new tab menu

The profile includes:

- Full 16-color BC palette
- Background `#091220`, cursor `#0091CE`
- Font: Cascadia Code 12px
- Acrylic effect at 90% opacity
- Tab color: Baltic Blue (`#01638E`)

### iTerm2 (macOS)

1. Open iTerm2 → `Preferences` → `Profiles`
2. Click **"Other Actions…"** → **"Import JSON Profiles…"**
3. Select `terminal/profiles/iterm2-profile.json`
4. The **Blue Coding Dark** profile is now available

---

## Color reference

Base colors from the Blue Coding Brand Identity Manual 2026:

| Name | Hex | Primary use |
| --- | --- | --- |
| Baltic Blue | `#01638E` | Left logo mark, status bar, H1/H3 headings |
| Ocean Blue | `#0091CE` | Right logo mark, accents, keywords, cursor |
| Blue Bell | `#1F96DB` | Gradient start, types, classes |
| Sapphire Sky | `#3771D6` | Gradient end, decorators |
| Prussian Blue | `#101C32` | Primary text, dark backgrounds |
| Alice Blue | `#F5FAFF` | Page background, text on dark |
| Lavender | `#D7E4F9` | Soft backgrounds, borders |
| Success | `#2BA77A` | Positive states, strings |
| Warning | `#E0A93B` | Warnings, numbers |
| Error | `#D94A4A` | Errors, invalid code |

---

## Requirements

### VS Code

- VS Code 1.60 or higher (or VS Code Insiders / VSCodium)
- The `code` CLI in PATH for automatic installation

### Terminal

- bash 4.0+ or zsh 5.0+
- Terminal with ANSI color support (virtually any modern terminal)
- True-color optional but recommended: Windows Terminal, iTerm2, Kitty, Alacritty, GNOME Terminal 3.28+

---

## Uninstall

### Uninstall the VS Code theme

```bash
# Remove the installed extension
rm -rf ~/.vscode/extensions/blue-coding.blue-coding-dark-*
```

Or from VS Code: `Extensions` → search **Blue Coding Dark** → Uninstall

### Uninstall the terminal script

Remove the line added to `~/.bashrc` or `~/.zshrc`:

```bash
# Edit the config file
nano ~/.bashrc   # or ~/.zshrc

# Find and delete the line:
# source "/path/to/blue-coding-dev-kit/terminal/bc-terminal.sh"
```

---

## Credits

Built from the **Blue Coding Brand Identity Manual 2026**.

- Company: [Blue Coding](https://bluecoding.com) — Nearshore Software Development
- Founded: 2014
- Services: Staff augmentation · Dedicated AI pods · Forward-deployed engineers
