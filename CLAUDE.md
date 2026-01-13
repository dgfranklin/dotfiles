# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository managed with [homeshick](https://github.com/andsens/homeshick). Homeshick creates symlinks from files in `home/` to the user's home directory, allowing dotfiles from multiple repositories (public and private) to coexist.

## Installation

```bash
bash <(curl https://raw.githubusercontent.com/dgfranklin/dotfiles/master/install.sh)
```

After cloning, run `homeshick link dotfiles` to create symlinks.

## Repository Structure

- `home/` - Files that get symlinked to `$HOME/` (the directory structure mirrors home)
- `fonts/`, `fzf/`, `vim-plug/`, `zplug/` - Git submodules for external dependencies

### Key Configuration Files

| File | Purpose |
|------|---------|
| `home/.vimrc` | Vim config with vim-plug plugins (gruvbox theme, fzf, NERDTree, EasyMotion) |
| `home/.config/nvim/` | LazyVim-based Neovim configuration |
| `home/.config/fish/config.fish` | Fish shell config |
| `home/.gitconfig` | Git config with aliases (`hist`, `l`, `ll`, `co`) |
| `home/.zshrc.Darwin` / `home/.zshrc.Linux` | OS-specific zsh configurations |

### Local Override Pattern

Most configs support local overrides that are not tracked in git:
- `~/.bashrc_local` - Local bash additions
- `~/.vimrc_local` - Local vim settings
- `~/.vimrc_plug_local` - Local vim-plug plugins
- `~/.gitconfig_local` - Local git config (work email, etc.)
- `~/.config/fish/config_local.fish` - Local fish settings

## Vim/Neovim

**Vim** uses vim-plug. Leader key is `,`. Key bindings:
- `<C-P>` - FZF file search (git-aware)
- `F2` - NERDTree toggle
- `F8` - Tagbar toggle
- `s` - EasyMotion two-character search

**Neovim** uses LazyVim starter template. Customize via `lua/plugins/` and `lua/config/`.
