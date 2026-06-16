# Zsh Configuration

A modular, cross-platform Zsh setup built on top of [Oh My Zsh](https://ohmyz.sh/) with an [Oh My Posh](https://ohmyposh.dev/) prompt. Designed to run identically on **macOS** and **Arch Linux** — platform-specific configuration is isolated and optional.

## Technologies

| Tool | Role | OS |
|------|------|----|
| [Oh My Zsh](https://ohmyz.sh/) | Plugin and theme manager | 🍎 🐧 |
| [Oh My Posh](https://ohmyposh.dev/) | Cross-shell prompt renderer | 🍎 🐧 |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder | 🍎 🐧 |
| [eza](https://github.com/eza-community/eza) | Modern `ls` replacement | 🍎 🐧 |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` with frecency | 🍎 🐧 |
| [asdf](https://asdf-vm.com/) | Multi-language version manager | 🍎 🐧 |
| [Homebrew](https://brew.sh/) | Package manager | 🍎 |

---

## Directory Structure

```
~/.config/zsh/
├── .zshenv                  # Entry point — sources the conf.d chain (all shells)
├── .zshrc                   # Interactive executions (asdf, zoxide, fastfetch...)
├── user.zsh                 # Oh My Zsh config (plugins, keybindings)
│
├── conf.d/                  # Modular configuration chain
│   ├── 00-configs.zsh       # Core zsh bootstrap (loads zsh/ sub-configs)
│   ├── 01-user.zsh          # User layer (loads modules by scope)
│   ├── 02-completions.zsh   # Completion registration (interactive only)
│   │
│   ├── zsh/                 # Core zsh internals (loaded by 00-configs)
│   │   ├── env.zsh          # Base PATH, XDG variables, fpath
│   │   └── terminal.zsh     # compinit, oh-my-zsh, functions
│   │
│   ├── homebrew/            # Homebrew bootstrap (macOS only, exception to conf.d principles)
│   │   └── env.zsh          # brew shellenv — sets PATH + HOMEBREW_* vars
│   │
│   ├── oh-my-posh/
│   │   └── env.interactive.zsh  # Oh My Posh prompt initialization
│   │
│   ├── user/                # Personal environment
│   │   ├── env.zsh          # EDITOR, VISUAL
│   │   └── aliases.zsh      # Navigation, overrides, network aliases
│   │
│   ├── fzf/
│   │   └── env.interactive.zsh  # FZF_DEFAULT_OPTS, FZF_CTRL_T_OPTS
│   │
│   ├── eza/
│   │   └── env.interactive.zsh  # EZA_CONFIG_DIR
│   │
│   └── zoxide/
│       └── env.interactive.zsh  # _ZO_EXCLUDE_DIRS, _ZO_FZF_OPTS
│
├── completions/             # Tool completion scripts (sourced by 02-completions)
│   ├── asdf.zsh
│   ├── colima.zsh
│   ├── docker.zsh
│   ├── homebrew.zsh
│   ├── make.zsh
│   └── pnpm.zsh
│
└── functions/               # Custom shell functions
    ├── file-utils.zsh       # z() compress, extract() decompress
    ├── jwt.zsh              # jwt-decode()
    └── mkd.zsh              # mkd() mkdir + cd in one step
```

---

## Load Order

```
zsh starts
│
├── .zshenv  ─────────────────────────── runs for ALL shells
│   ├── conf.d/00-configs.zsh
│   │   ├── conf.d/zsh/env.zsh          PATH, XDG vars, fpath (before compinit)
│   │   └── [interactive only]
│   │       conf.d/zsh/terminal.zsh
│   │           ├── user.zsh            plugins, keybindings
│   │           ├── _load_compinit      compinit → compdef available
│   │           ├── oh-my-zsh.sh
│   │           └── _load_functions     functions/*.zsh
│   │
│   ├── conf.d/01-user.zsh              sources user modules by load scope
│   │   ├── conf.d/homebrew/env.zsh     brew shellenv (macOS only)
│   │   ├── conf.d/user/env.zsh
│   │   └── [interactive only]
│   │       ├── conf.d/oh-my-posh/env.interactive.zsh
│   │       ├── conf.d/user/aliases.zsh
│   │       ├── conf.d/fzf/env.interactive.zsh
│   │       ├── conf.d/eza/env.interactive.zsh
│   │       └── conf.d/zoxide/env.interactive.zsh
│   │
│   └── conf.d/02-completions.zsh       completions/*.zsh (interactive only)
│
└── .zshrc  ──────────────────────────── interactive shells only
    ├── setopts (history)
    ├── asdf init
    ├── zoxide init
    └── fastfetch
```

### Key ordering rules

- **`conf.d/zsh/env.zsh`** runs first — sets `fpath` before `compinit` is called
- **`user.zsh`** runs before Oh My Zsh — sets plugins and keybindings before they load
- **Oh My Posh** runs from `conf.d/oh-my-posh/env.interactive.zsh` after environment modules, so package-manager paths are ready
- **`01-user.zsh`** runs before **`02-completions.zsh`** — all tool PATHs are available when completions are registered
- **`.zshrc`** runs last — interactive executions that need a fully initialized shell

---

## Architecture Principles

**`conf.d/` is for configuration only** — exports, PATH declarations, and env var assignments. No binary executions or evals.

**`.zshrc` is for interactive executions** — commands that initialize tools by running them (`eval`, `source`, `fastfetch`). These are interactive-only and require a fully set-up environment.

**Interactive and non-interactive loads are separated** — non-interactive shells get only environment needed by scripts and tools. Terminal UX such as aliases, shell functions, hooks, prompt setup, completion setup, and UI-specific environment stays behind an interactive check.

**Platform-specific config is isolated** — macOS concerns (Homebrew) live in their own modules. On Arch Linux, those files simply don't exist and the rest of the chain is unaffected.

**Completions load after user env** — `02-completions.zsh` runs after `01-user.zsh`, guaranteeing all PATHs are set before any `command -v` check in a completion script.

---

## Interactive vs Non-Interactive

Every Zsh process reads `.zshenv`, including scripts and one-shot commands such as `zsh -c`. This setup keeps that path small and predictable by loading only durable environment in non-interactive shells.

Non-interactive shells load:

- `conf.d/zsh/env.zsh` for core `PATH`, XDG variables, and base `fpath`
- `conf.d/*/env.zsh` for environment that scripts may need, except `conf.d/zsh/env.zsh` which is already loaded by `00-configs.zsh`

Interactive shells additionally load:

- `conf.d/zsh/terminal.zsh`
- `conf.d/*/env.interactive.zsh`
- `conf.d/*/aliases.zsh`
- `conf.d/*/functions.zsh`
- `completions/*.zsh`
- `.zshrc`

This avoids paying for prompt, completion, alias, function, hook, and terminal UI setup in script shells. It also keeps child process environments smaller by not exporting UI-only options such as fzf and zoxide preview settings unless a terminal session actually needs them.

---

## Creating conf.d Modules

Create one directory per tool or domain under `conf.d/`:

```
conf.d/<name>/
├── env.zsh
├── env.interactive.zsh
├── aliases.zsh
└── functions.zsh
```

Use these filename patterns:

| File | Load moment | Use for |
|------|-------------|---------|
| `env.zsh` | All shells | Exports and `PATH` entries required by scripts, tools, editors, package managers, or CI-like commands |
| `env.interactive.zsh` | Interactive shells only | Terminal UI environment, fuzzy finder options, preview settings, colors, and variables only useful at a prompt |
| `aliases.zsh` | Interactive shells only | Aliases, command overrides, navigation shortcuts |
| `functions.zsh` | Interactive shells only | Manually invoked shell functions and prompt/session hooks |

Keep `env.zsh` conservative. If a variable only improves command-line ergonomics and is not needed by scripts, put it in `env.interactive.zsh`.

Do not add executable initialization to `conf.d/` unless it is cheap and intentionally global. Tool startup that runs commands, emits output, installs hooks, or depends on a fully initialized terminal belongs in `.zshrc` or an interactive-only file.

---

## Oh My Zsh

### Plugins

```
~/.oh-my-zsh/custom/plugins/
├── fzf-tab                  # Replace zsh completion menu with fzf
├── zsh-256color             # Better 256 color support
├── zsh-autopair             # Auto-close brackets, quotes
├── zsh-autosuggestions      # Fish-like command suggestions
├── zsh-completions          # Additional completion definitions
└── zsh-syntax-highlighting  # Fish-like syntax highlighting
```

Built-in plugins also enabled: `fzf`, `aliases`, `command-not-found`, `docker`, `docker-compose`, `git`, `kubectl`.

### Theme

Oh My Zsh does not own the prompt theme. Prompt rendering is handled by Oh My Posh.

---

## Oh My Posh

Oh My Posh is initialized by `conf.d/oh-my-posh/env.interactive.zsh` after the environment modules have loaded.

Theme configuration lives at:

```
$XDG_CONFIG_HOME/oh-my-posh/theme.omp.toml
```

---

## Custom Functions

| Function | Description |
|----------|-------------|
| `mkd <dir>` | Create directory and `cd` into it |
| `z <name>` | Compress a directory to `.zip` |
| `extract <file>` | Extract any archive format |
| `jwt-decode <token>` | Decode and pretty-print a JWT payload |

---

## Aliases

| Alias | Command |
|-------|---------|
| `ls` | `eza` with icons, sorted, all files |
| `ll` | `eza` long format with git, hyperlinks, relative time |
| `lt` | `eza` tree view (1 level) |
| `vim` | `nvim` |
| `rm` / `cp` / `mv` | Interactive mode (`-i`) |
| `www` | `cd ~/Sites` |
| `desk` | `cd ~/Desktop` |
| `downloads` | `cd ~/Downloads` |
| `ippublic` | Show public IP via OpenDNS |
