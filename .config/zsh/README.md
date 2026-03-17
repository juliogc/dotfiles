# Zsh Configuration

A modular, cross-platform Zsh setup built on top of [Oh My Zsh](https://ohmyz.sh/) with [Powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt. Designed to run identically on **macOS** and **Arch Linux** — platform-specific configuration is isolated and optional.

## Technologies

| Tool | Role | OS |
|------|------|----|
| [Oh My Zsh](https://ohmyz.sh/) | Plugin and theme manager | 🍎 🐧 |
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | Prompt theme with instant prompt support | 🍎 🐧 |
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
├── user.zsh                 # Oh My Zsh config (theme, plugins, keybindings)
├── prompt.zsh               # Powerlevel10k instant prompt + config source
├── .p10k.zsh                # Powerlevel10k theme configuration
│
├── conf.d/                  # Modular configuration chain
│   ├── 00-configs.zsh       # Core zsh bootstrap (loads zsh/ sub-configs)
│   ├── 01-user.zsh          # User layer (loads all conf.d/*/ modules)
│   ├── 02-completions.zsh   # Completion registration (interactive only)
│   │
│   ├── zsh/                 # Core zsh internals (loaded by 00-configs)
│   │   ├── env.zsh          # Base PATH, XDG variables, fpath
│   │   └── terminal.zsh     # compinit, oh-my-zsh, prompt, functions
│   │
│   ├── homebrew/            # Homebrew bootstrap (macOS only, exception to conf.d principles)
│   │   └── env.zsh          # brew shellenv — sets PATH + HOMEBREW_* vars
│   │
│   ├── user/                # Personal environment
│   │   ├── env.zsh          # EDITOR, VISUAL
│   │   └── aliases.zsh      # Navigation, overrides, network aliases
│   │
│   ├── fzf/
│   │   └── env.zsh          # FZF_DEFAULT_OPTS, FZF_CTRL_T_OPTS
│   │
│   ├── eza/
│   │   └── env.zsh          # EZA_CONFIG_DIR
│   │
│   └── zoxide/
│       └── env.zsh          # _ZO_EXCLUDE_DIRS, _ZO_FZF_OPTS
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
│   │           ├── user.zsh            ZSH_THEME, plugins, keybindings
│   │           ├── _load_compinit      compinit → compdef available
│   │           ├── oh-my-zsh.sh
│   │           ├── _load_prompt        prompt.zsh → p10k instant prompt
│   │           └── _load_functions     functions/*.zsh
│   │
│   ├── conf.d/01-user.zsh              sources all conf.d/*/*.zsh modules
│   │   ├── conf.d/homebrew/env.zsh     brew shellenv (macOS only)
│   │   ├── conf.d/user/env.zsh
│   │   ├── conf.d/user/aliases.zsh
│   │   ├── conf.d/fzf/env.zsh
│   │   ├── conf.d/eza/env.zsh
│   │   └── conf.d/zoxide/env.zsh
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
- **`user.zsh`** runs before Oh My Zsh — sets theme and plugins before they load
- **`01-user.zsh`** runs before **`02-completions.zsh`** — all tool PATHs are available when completions are registered
- **`.zshrc`** runs last — interactive executions that need a fully initialized shell

---

## Architecture Principles

**`conf.d/` is for configuration only** — exports, PATH declarations, and env var assignments. No binary executions or evals.

**`.zshrc` is for interactive executions** — commands that initialize tools by running them (`eval`, `source`, `fastfetch`). These are interactive-only and require a fully set-up environment.

**Platform-specific config is isolated** — macOS concerns (Homebrew) live in their own modules. On Arch Linux, those files simply don't exist and the rest of the chain is unaffected.

**Completions load after user env** — `02-completions.zsh` runs after `01-user.zsh`, guaranteeing all PATHs are set before any `command -v` check in a completion script.

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

```
~/.oh-my-zsh/custom/themes/
└── powerlevel10k         # Highly customizable prompt with instant prompt support
```

Configured via `.p10k.zsh` — lean style, 2-line prompt, Nerd Font icons, Tokyo Night colors, transient prompt, git status via gitstatus.

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

