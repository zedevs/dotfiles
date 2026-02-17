# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **dotfiles repository** managed by [chezmoi](https://www.chezmoi.io/). All files in this directory are SOURCE files that map to actual dotfiles in the user's home directory through chezmoi's naming conventions.

**Critical**: This directory (`~/dev/dotfiles` or wherever chezmoi source-path points) is NOT the home directory. Files here use special naming (e.g., `dot_zshrc`) and must be applied to `~` using chezmoi.

## Chezmoi Workflow

### File Naming Convention

- `dot_` prefix → `.` (dot prefix in home directory)
  - `dot_zshrc` → `~/.zshrc`
  - `dot_gitconfig` → `~/.gitconfig`
  - `dot_config/nvim/` → `~/.config/nvim/`

### Essential Commands

After editing any file in this repository, changes must be applied:

```bash
# Preview what will change
chezmoi diff

# Apply changes to home directory (required after ANY edit)
chezmoi apply

# Apply specific file
chezmoi apply ~/.zshrc

# Reload shell after zshrc changes
reload  # or: source ~/.zshrc
```

### When Adding New Dotfiles

```bash
# Add an existing file from home directory to chezmoi
chezmoi add ~/.newfile

# This creates the appropriately named file in this source directory
```

### When Editing Files

**Method 1 (Recommended for Claude)**: Edit files directly in this directory, then apply:
```bash
# 1. Edit the file (e.g., dot_zshrc)
# 2. Apply changes
chezmoi apply
```

**Method 2**: If user edited a file in `~` directly, sync it back:
```bash
chezmoi re-add ~/.zshrc
```

## Repository Structure

```
.
├── dot_zshrc              # Main Zsh configuration
├── dot_gitconfig          # Git configuration (includes .gitconfig.private)
├── dot_p10k.zsh           # Powerlevel10k theme config
├── Brewfile               # Homebrew packages (brew bundle to install)
├── .chezmoiignore         # Files NOT managed by chezmoi
└── dot_config/
    ├── nvim/              # LazyVim configuration (goal: VSCode parity)
    ├── lazygit/           # LazyGit TUI config
    ├── wezterm/           # WezTerm terminal emulator config
    └── zellij/            # Zellij terminal multiplexer config
```

## Key Configuration Details

### Shell (dot_zshrc)

**Structure**:
- General settings (history, completion, options)
- Path configuration
- Plugin-specific settings (fzf, bat theme)
- Aliases (general and git shortcuts)
- Plugin loading (nvm, asdf, powerlevel10k, zsh-autosuggestions, etc.)
- Functions (e.g., `mkd` for mkdir+cd)
- Sources `~/.zshrc.local` for sensitive/local config (NOT tracked in git)

**Important aliases**:
- `reload`: Reload zsh config
- `dots`: cd to this dotfiles directory
- `l`, `ll`, `la`: lsd (modern ls) variants
- `cat`, `less`: bat (syntax-highlighted cat)
- `lg`: lazygit
- Git aliases: `g`, `ga`, `gp`, `gs`, `gcm`, `grm`, `gd`, etc.

### Editor (dot_config/nvim/)

- Based on **LazyVim** starter template
- Custom configuration in `lua/config/` (keymaps, options, autocmds)
- Custom plugins in `lua/plugins/`
- Goal: Achieve parity with VSCode/Cursor vim keybindings

### Package Management (Brewfile)

Key tools installed:
- **Version managers**: asdf, nvm, pyenv
- **CLI tools**: bat, lsd, fzf, ripgrep, btop, tldr
- **Dev tools**: neovim, git, docker-compose, dbmate
- **Terminal**: wezterm, zellij, powerlevel10k
- **Editors**: cursor, sublime-merge (for git diffs)
- **Window management**: aerospace (tiling WM), karabiner-elements

To install/update packages:
```bash
brew bundle              # Install all packages from Brewfile
brew bundle dump --force # Update Brewfile.lock.json after changes
```

### Git Configuration (dot_gitconfig)

- Uses **delta** for enhanced diffs (side-by-side, line numbers)
- Includes `.gitconfig.private` for user-specific settings (name, email)
- Merge tool: opendiff
- Diff tool: smerge (Sublime Merge)
- Auto-setup remote on push
- Rerere enabled (reuse recorded resolution)

### Ignored Files (.chezmoiignore)

These files are NOT applied to home directory:
- `README*` - Documentation
- `Brewfile*` - Package management files
- `AGENTS*` - Agent documentation
- `*DS_Store` - macOS metadata

## Common Tasks

### Modifying Shell Aliases

1. Edit `dot_zshrc` in this directory
2. Add/modify alias in the `#----- general -----#` or `#----- git -----#` section
3. Run `chezmoi apply`
4. Reload shell with `reload` alias

### Modifying Neovim Configuration

1. Edit files in `dot_config/nvim/lua/config/` or `dot_config/nvim/lua/plugins/`
2. Run `chezmoi apply`
3. Restart Neovim or run `:Lazy sync` to install/update plugins

### Installing New Packages

1. Add brew formula or cask to `Brewfile`
2. Run `brew bundle` to install
3. Optionally update lock: `brew bundle dump --force`

### Testing Changes

```bash
# See what would change
chezmoi diff

# Apply all changes
chezmoi apply

# Test specific configs
reload                    # For shell changes
nvim                      # Test Neovim config
source ~/.zshrc           # Alternative to reload
```

## Development Environment

### Shell Environment
- **Shell**: Zsh with Powerlevel10k theme
- **History**: Shared across sessions, 1M entries, no duplicates
- **Completion**: Case-insensitive, arrow-key search
- **Key bindings**: Emacs mode (Ctrl+A, Ctrl+E, etc.)

### CLI Tools Philosophy
- Modern replacements for standard tools:
  - `lsd` instead of `ls`
  - `bat` instead of `cat`
  - `delta` instead of standard git diff
  - `lazygit` for git TUI
  - `fzf` for fuzzy finding (!! trigger for completion)

### Version Management
- **Node**: nvm
- **Ruby/Python/etc**: asdf
- **Python-specific**: pyenv, pipenv

## Important Notes

1. **ALWAYS run `chezmoi apply`** after editing any file in this repository
2. **DO NOT edit files in `~` directly** - edit them here and apply
3. **DO NOT edit `~/.zshrc.local`** - it's for user's sensitive/local config not tracked in git
4. **Shell changes require reload** - Run `reload` or `source ~/.zshrc` after zshrc changes
5. **File naming**: Remember `dot_` prefix when creating new tracked files
6. The directory `~/dev/dotfiles` contains SOURCE files, not the actual dotfiles

## macOS-Specific Settings

Key defaults commands (from README):
```bash
# Enable key repeat (disable press-and-hold)
defaults write -g ApplePressAndHoldEnabled -bool false

# Mission Control: don't span displays
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

# Group windows by app in Mission Control
defaults write com.apple.dock expose-group-apps -bool true && killall Dock

# Delay showing dock
defaults write com.apple.dock autohide-delay -float 2 && killall Dock
```

## Reference

For detailed chezmoi workflows and step-by-step instructions, see `AGENTS.md` in this repository.
