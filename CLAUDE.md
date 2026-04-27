# Blue Coding Dev Kit — Project Context

## What this project is

Visual tooling to adapt developer environments to the Blue Coding brand:

1. **VSCode theme** (`vscode-theme/blue-coding-dark/`) — dark color theme extension
2. **Terminal script** (`terminal/bc-terminal.sh`) — bash/zsh prompt, ANSI palette, LS_COLORS, aliases
3. **Terminal profiles** (`terminal/profiles/`) — Windows Terminal and iTerm2 ready-to-import configs

## Design System

The official Blue Coding Brand Identity Manual 2026 guidelines are embedded in this project at `design-system/`. Always use these when creating or modifying any visual output:

- **Colors & typography tokens**: `design-system/colors_and_type.css`
- **Full brand guidelines**: `design-system/README.md`
- **Logos**: `design-system/assets/logos/`
- **Icons** (54 Phosphor duotone SVGs): `design-system/assets/icons/`
- **Fonts**: `design-system/fonts/MavenPro-VariableFont_wght.ttf`

## Core brand colors

| Token | Hex | Use |
| --- | --- | --- |
| Baltic Blue | `#01638E` | Primary brand, status bars, H1/H3 |
| Ocean Blue | `#0091CE` | Accents, links, cursor, keywords |
| Blue Bell | `#1F96DB` | Gradient start, types, classes |
| Sapphire Sky | `#3771D6` | Gradient end, decorators |
| Prussian Blue | `#101C32` | Dark backgrounds, primary text |
| Alice Blue | `#F5FAFF` | Light backgrounds, text on dark |
| Success | `#2BA77A` | Strings, positive states |
| Warning | `#E0A93B` | Numbers, caution states |
| Error | `#D94A4A` | Errors, invalid code |

## Typography

- **Headings / Display**: Poppins (Bold, 700/600)
- **Body / UI**: Maven Pro (variable font, 400–900)

## Rules for any new visual work

- Always match the token names from `design-system/colors_and_type.css` exactly
- Never invent colors outside the brand palette
- Use sentence case for all labels and headings
- Logos: use `Symbol-Colour.svg` on light backgrounds, `Symbol-White.svg` on dark
- Icons: always Phosphor duotone style at 20px minimum
- All user-facing text must be in English
