# Agent Guide: Working with These Dotfiles

This repository contains dotfiles managed by [chezmoi](https://www.chezmoi.io/). This guide explains the structure and how to make changes.

## Setup

### Initial Setup (if not already initialized)

```bash
# Install chezmoi
brew install chezmoi

# Initialize chezmoi with this repository
chezmoi init https://github.com/YOUR_USERNAME/dotfiles.git

# Apply the dotfiles
chezmoi apply
```

### Find the Dotfiles Location

To get the exact path of the chezmoi source directory:

```bash
chezmoi source-path
```

This command returns the full path to where chezmoi stores the source dotfiles.

## Repository Structure

This is a **chezmoi source directory**. Files here use special naming conventions that map to actual dotfiles in the home directory.

### Chezmoi Naming Conventions

- `dot_` prefix → `.` (dot prefix in home directory)
  - `dot_zshrc` → `~/.zshrc`
  - `dot_gitconfig` → `~/.gitconfig`
  - `dot_config/` → `~/.config/`

- Files in this directory are the SOURCE files
- Running `chezmoi apply` copies them to the actual locations in the home directory

### Key Files and Locations

```
.
├── dot_zshrc              → ~/.zshrc (Zsh configuration)
├── dot_gitconfig          → ~/.gitconfig (Git configuration)
├── dot_gitignore          → ~/.gitignore (Global Git ignore)
├── dot_p10k.zsh           → ~/.p10k.zsh (Powerlevel10k theme)
├── Brewfile               → Package management (Homebrew)
├── .chezmoiignore         → Files chezmoi should not manage
└── dot_config/
    ├── nvim/              → ~/.config/nvim/ (Neovim/LazyVim)
    ├── lazygit/           → ~/.config/lazygit/ (LazyGit)
    ├── wezterm/           → ~/.config/wezterm/ (WezTerm terminal)
    └── zellij/            → ~/.config/zellij/ (Zellij multiplexer)
```

### Shell Configuration

- **Main config**: `dot_zshrc` → `~/.zshrc`
- **Local/sensitive config**: `~/.zshrc.local` (not tracked by git, sourced at end of .zshrc)
- **Theme**: Powerlevel10k (`dot_p10k.zsh`)

The zshrc includes:
- Aliases (general, git shortcuts)
- History configuration
- Completion settings
- Plugin loading (fzf, nvm, asdf, syntax highlighting, autosuggestions)
- Functions (like `mkd` for mkdir+cd)

### Editor Setup

- **Neovim**: LazyVim-based configuration in `dot_config/nvim/`
- Goal: VSCode parity with vim keybindings
- Custom plugins in `dot_config/nvim/lua/plugins/`

## How to Edit Dotfiles

### Method 1: Edit Source Files Directly (Recommended for Agents)

Since you're already in the chezmoi source directory (`$(chezmoi source-path)`), you can edit files directly:

1. Edit the file in this directory:
   ```bash
   # Example: edit zsh config
   nvim dot_zshrc
   ```

2. Apply changes to home directory:
   ```bash
   chezmoi apply
   ```

3. Verify changes:
   ```bash
   chezmoi diff
   ```

### Method 2: Using Chezmoi Commands

```bash
# Edit a file (opens in $EDITOR)
chezmoi edit ~/.zshrc

# Apply changes to home directory
chezmoi apply

# Apply specific file
chezmoi apply ~/.zshrc

# Preview what would change
chezmoi diff

# Navigate to chezmoi source directory
chezmoi cd
```

### Method 3: Edit Live File, Then Update Source

If you edit `~/.zshrc` directly:

```bash
# Re-add the file to sync changes back
chezmoi re-add ~/.zshrc
```

## Common Workflows

### Adding a New Dotfile to Chezmoi

```bash
chezmoi add ~/.newconfig
```

This creates the appropriately named file in this source directory.

### Adding a Shell Alias

1. Edit `dot_zshrc` in this directory
2. Add the alias in the `#----- general -----#` or `#----- git -----#` section
3. Apply changes: `chezmoi apply`
4. Reload shell: `source ~/.zshrc` or use the `reload` alias

### Installing Packages

1. Add packages to `Brewfile`
2. Run: `brew bundle`
3. Update lock file: `brew bundle dump --force`

### Ignoring Files

Files/patterns in `.chezmoiignore` won't be managed by chezmoi:
- `README*` - Documentation files
- `Brewfile*` - Package files
- `*DS_Store` - macOS metadata

## Important Notes for Agents

1. **Always edit source files** in `$(chezmoi source-path)`, not the actual dotfiles in `~`
2. **Run `chezmoi apply`** after making changes to sync them to the home directory
3. **Use `chezmoi diff`** to preview changes before applying
4. **Don't edit `~/.zshrc.local`** - it's for sensitive/local config not tracked in git
5. **File naming**: Remember the `dot_` prefix convention
6. **Shell reload**: After zshrc changes, user must run `reload` or `source ~/.zshrc`

## Testing Changes

After editing dotfiles:

```bash
# Preview changes
chezmoi diff

# Apply to home directory
chezmoi apply

# For shell config changes, reload
source ~/.zshrc  # or just: reload
```

## Git Workflow

This is a git repository. After making changes:

```bash
git status
git add <files>
git commit -m "Description of changes"
git push
```

## Quick Reference

| Task | Command |
|------|---------|
| Edit a dotfile | Edit `dot_*` file in this directory |
| Apply changes | `chezmoi apply` |
| Preview changes | `chezmoi diff` |
| Add new dotfile | `chezmoi add ~/.filename` |
| Go to source dir | `chezmoi cd` |
| Reload shell | `reload` or `source ~/.zshrc` |

## Current Dotfiles Location

- **Chezmoi source**: `$(chezmoi source-path)` (this directory)
- **Applied dotfiles**: `~` (home directory)
- **Chezmoi data**: `~/.local/share/chezmoi/` (same as source)
