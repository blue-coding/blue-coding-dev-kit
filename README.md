# Blue Coding Dev Kit

Herramientas visuales oficiales para adaptar tu entorno de desarrollo al brand de **Blue Coding**. Incluye un tema completo para VS Code y un script de personalización de terminal para bash y zsh.

```text
  ██████╗  ██╗       ██╗   ██╗███████╗   CODING
  ██╔══██╗ ██║       ██║   ██║██╔════╝   ──────────────────────────────
  ██████╔╝ ██║       ██║   ██║█████╗     Nearshore Software Development
  ██╔══██╗ ██║       ██║   ██║██╔══╝     bluecoding.com
  ██████╔╝ ███████╗  ╚██████╔╝███████╗
  ╚═════╝  ╚══════╝   ╚═════╝ ╚══════╝
```

---

## Contenido

```text
blue-coding-dev-kit/
├── CLAUDE.md                               # Contexto del proyecto para Claude Code
├── README.md
├── install-all.sh                          # Instalador interactivo unificado
│
├── design-system/                          # Brand Identity Manual 2026
│   ├── README.md                           # Guía completa de brand
│   ├── colors_and_type.css                 # Tokens CSS oficiales (fuente de verdad)
│   ├── assets/
│   │   ├── logos/                          # Logo-Colour, Logo-White, Symbol, Logotype (SVG)
│   │   ├── icons/                          # 54 iconos Phosphor duotone (SVG)
│   │   └── imagery/                        # 10 fotografías de marca
│   └── fonts/
│       └── MavenPro-VariableFont_wght.ttf
│
├── vscode-theme/
│   ├── install.sh                          # Instalador del tema
│   └── blue-coding-dark/
│       ├── package.json                    # Manifiesto de extensión VS Code
│       └── themes/
│           └── Blue-Coding-Dark-color-theme.json   # Tema completo (1005 tokens)
│
└── terminal/
    ├── bc-terminal.sh                      # Script principal de tema terminal
    └── profiles/
        ├── windows-terminal.json           # Perfil para Windows Terminal
        └── iterm2-profile.json             # Perfil para iTerm2 (macOS)
```

---

## Instalación rápida

```bash
# Instala ambas herramientas de forma interactiva
bash ~/blue-coding-dev-kit/install-all.sh
```

O instala cada herramienta por separado:

```bash
# Solo el tema de VS Code
bash ~/blue-coding-dev-kit/vscode-theme/install.sh

# Solo el tema de terminal
bash ~/blue-coding-dev-kit/terminal/bc-terminal.sh
```

---

## 1. Tema VS Code — Blue Coding Dark

Un tema oscuro completo construido desde la paleta oficial de Blue Coding. Cubre sintaxis de más de 10 lenguajes, toda la UI del editor, terminal integrada, Git, debugger y paneles.

### Instalación

#### Opción A — Script automático (recomendado)

```bash
bash ~/blue-coding-dev-kit/vscode-theme/install.sh
```

El script detecta el CLI de VS Code y copia la extensión al directorio de extensiones del usuario. Si no encuentra el CLI, imprime las instrucciones manuales.

#### Opción B — Manual

1. Abrir VS Code
2. `Ctrl+Shift+P` → `Developer: Install Extension from Location`
3. Seleccionar la carpeta `vscode-theme/blue-coding-dark/`
4. Reiniciar VS Code

#### Activar el tema

```text
Ctrl+K  Ctrl+T   →   Blue Coding Dark
```

O desde el menú: `File → Preferences → Color Theme → Blue Coding Dark`

### Paleta de colores

| Elemento UI | Color | Hex |
| --- | --- | --- |
| Background editor | Prussian Navy | `#0C1828` |
| Background sidebar | Deep Navy | `#091220` |
| Background activity bar | Deepest Navy | `#060D18` |
| Status bar | Baltic Blue | `#01638E` |
| Cursor | Ocean Blue | `#0091CE` |
| Selección | Blue Bell 20% | `#1F96DB30` |

| Token de sintaxis | Color | Hex |
| --- | --- | --- |
| Keywords — `if` / `for` / `return` | Ocean Blue | `#0091CE` |
| Storage — `const` / `class` / `function` | Blue Bell | `#1F96DB` |
| Nombres de función / método | Light Blue | `#7AB8E8` |
| Tipos / interfaces / clases | Blue Bell | `#1F96DB` |
| Strings | Success Green | `#2BA77A` |
| Números / booleans / null | Warning Yellow | `#E0A93B` |
| Comentarios | Muted Blue | `#3E5C76` italic |
| Variables y parámetros | Ice Blue | `#C8DEFF` / `#A8C8F0` |
| Propiedades de objeto | Soft Blue | `#7AB8E8` |
| Decoradores / anotaciones | Sapphire Light | `#7BA7ED` |
| Errores / inválido | Error Red | `#D94A4A` |
| `this` / `self` / `super` | Ocean Blue italic | `#0091CE` |

### Lenguajes cubiertos

JavaScript · TypeScript · JSX · TSX · Python · Go · Rust · HTML · CSS / SCSS · JSON · YAML · TOML · Markdown · Shell · Regex

### Colores de terminal integrada

El tema también configura la paleta de 16 colores ANSI de la terminal integrada de VS Code:

| ANSI | Nombre BC | Hex |
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

Script para bash y zsh que aplica la identidad visual de Blue Coding a la consola: paleta de colores, prompt de dos líneas con indicador de marca, colores de `ls`, `grep` y shortcuts de Git.

### Activar en la sesión actual

```bash
source ~/blue-coding-dev-kit/terminal/bc-terminal.sh
```

### Instalar permanentemente (añadir a `.bashrc` / `.zshrc`)

```bash
bash ~/blue-coding-dev-kit/terminal/bc-terminal.sh
```

El script detecta el shell activo, muestra el banner de Blue Coding y ofrece añadir la línea `source` al archivo de configuración correspondiente.

### Qué incluye

#### Paleta ANSI (16 colores del sistema)

Reemplaza los colores estándar del terminal usando secuencias OSC4. Compatible con la mayoría de emuladores modernos (Windows Terminal, iTerm2, GNOME Terminal, Kitty, Alacritty).

| Slot ANSI | Color BC | Hex |
| --- | --- | --- |
| Black | Prussian Blue | `#101C32` |
| Blue | Baltic Blue | `#01638E` |
| Cyan | Ocean Blue | `#0091CE` |
| Bright Blue | Blue Bell | `#1F96DB` |
| Bright Cyan | Light Cyan | `#5ABFED` |
| Green | Success | `#2BA77A` |
| Yellow | Warning | `#E0A93B` |
| Red | Error | `#D94A4A` |
| Fondo | Deep Navy | `#091220` |
| Cursor | Ocean Blue | `#0091CE` |

#### Prompt

```text
╭─[BC] user@host  ~/ruta/actual  main*
╰─❯ _
```

| Segmento | Color |
| --- | --- |
| `[BC]` | Baltic Blue |
| usuario | Ocean Blue |
| `@host` | Light Cyan |
| ruta | Alice Blue |
| rama git | Blue Bell (con `*` si hay cambios) |
| `╰─❯` | Ocean Blue |

El prompt se actualiza dinámicamente en cada comando. En zsh también muestra la hora en el lado derecho.

#### LS_COLORS

Colores diferenciados por tipo de archivo:

| Tipo | Color |
| --- | --- |
| Directorios | Blue Bell bold |
| Links simbólicos | Light Cyan |
| Ejecutables | Success Green |
| Archivos `.ts` / `.py` / `.go` | Blue Bell / Light Cyan |
| Archivos `.json` / `.yaml` | Warning Yellow |
| Archivos `.html` / `.css` | Soft Blue |
| Archivos comprimidos | Error Red |
| Archivos `.md` / `.txt` | Ice Blue |
| Logs / locks | Muted |

#### GREP_COLORS

Coincidencias resaltadas en Ocean Blue bold sobre el fondo del terminal.

#### Aliases de Git

| Alias | Comando |
| --- | --- |
| `gs` | `git status -sb` |
| `gd` | `git diff` |
| `gl` | `git log --oneline --graph --color` |
| `gb` | `git branch -a` |

#### Aliases de listado

| Alias | Comando |
| --- | --- |
| `ls` | `ls --color=auto` |
| `ll` | `ls -lh` |
| `la` | `ls -lha` |

### Compatibilidad de color

El script detecta automáticamente el modo de color soportado:

| Terminal | Modo | Comportamiento |
| --- | --- | --- |
| Windows Terminal | True-color (24-bit) | Paleta exacta BC |
| iTerm2 | True-color (24-bit) | Paleta exacta BC |
| VS Code terminal | True-color (24-bit) | Paleta exacta BC |
| GNOME Terminal | True-color (24-bit) | Paleta exacta BC |
| Terminal.app (macOS) | 256 colores | Aproximación 256-color |
| TTY / SSH básico | 256 colores | Aproximación 256-color |

Para forzar un modo específico:

```bash
COLORTERM=truecolor source ~/blue-coding-dev-kit/terminal/bc-terminal.sh  # forzar 24-bit
COLORTERM=""         source ~/blue-coding-dev-kit/terminal/bc-terminal.sh  # forzar 256-color
```

---

## 3. Perfiles de terminal adicionales

### Windows Terminal

Copia el contenido de `terminal/profiles/windows-terminal.json` en tu configuración de Windows Terminal:

1. Abrir Windows Terminal → `Ctrl+,` (Settings)
2. Click en **"Open JSON file"** (esquina inferior izquierda)
3. Añadir el objeto del perfil dentro del array `"profiles.list"`
4. Guardar — el perfil **Blue Coding Dark** aparece en el menú de nueva pestaña

El perfil incluye:

- Paleta completa de 16 colores BC
- Fondo `#091220`, cursor `#0091CE`
- Fuente: Cascadia Code 12px
- Efecto acrílico con 90% de opacidad
- Tab color: Baltic Blue (`#01638E`)

### iTerm2 (macOS)

1. Abrir iTerm2 → `Preferences` → `Profiles`
2. Click en **"Other Actions…"** → **"Import JSON Profiles…"**
3. Seleccionar `terminal/profiles/iterm2-profile.json`
4. El perfil **Blue Coding Dark** queda disponible

---

## Paleta de referencia

Colores base del Brand Identity Manual 2026 de Blue Coding:

| Nombre | Hex | Uso principal |
| --- | --- | --- |
| Baltic Blue | `#01638E` | Logo marca izquierda, status bar, títulos H1/H3 |
| Ocean Blue | `#0091CE` | Logo marca derecha, acentos, keywords, cursor |
| Blue Bell | `#1F96DB` | Gradiente inicio, tipos, clases |
| Sapphire Sky | `#3771D6` | Gradiente fin, decoradores |
| Prussian Blue | `#101C32` | Texto primario, fondos oscuros |
| Alice Blue | `#F5FAFF` | Fondo de página, texto sobre oscuro |
| Lavender | `#D7E4F9` | Fondos suaves, bordes |
| Success | `#2BA77A` | Estados positivos, strings |
| Warning | `#E0A93B` | Advertencias, números |
| Error | `#D94A4A` | Errores, código inválido |

---

## Requisitos

### VS Code

- VS Code 1.60 o superior (o VS Code Insiders / VSCodium)
- El CLI `code` en el PATH para instalación automática

### Terminal

- bash 4.0+ o zsh 5.0+
- Terminal con soporte de colores ANSI (prácticamente cualquier terminal moderno)
- True-color opcional pero recomendado: Windows Terminal, iTerm2, Kitty, Alacritty, GNOME Terminal 3.28+

---

## Desinstalación

### Desinstalar el tema VS Code

```bash
# Eliminar la extensión instalada
rm -rf ~/.vscode/extensions/blue-coding.blue-coding-dark-*
```

O desde VS Code: `Extensions` → buscar **Blue Coding Dark** → Uninstall

### Desinstalar el script de terminal

Eliminar la línea añadida en `~/.bashrc` o `~/.zshrc`:

```bash
# Editar el archivo de configuración
nano ~/.bashrc   # o ~/.zshrc

# Buscar y eliminar la línea:
# source "/ruta/a/blue-coding-dev-kit/terminal/bc-terminal.sh"
```

---

## Créditos

Desarrollado con base en el **Blue Coding Brand Identity Manual 2026**.

- Empresa: [Blue Coding](https://bluecoding.com) — Nearshore Software Development
- Fundada: 2014
- Servicios: Staff augmentation · Dedicated AI pods · Forward-deployed engineers
