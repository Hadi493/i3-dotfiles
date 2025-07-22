# Doom Emacs for Neovim Users - Quick Reference

This Doom Emacs configuration is designed for Neovim users, featuring familiar keybindings and behaviors.

## Key Features

- **Evil Mode**: Full Vim keybindings enabled everywhere
- **Relative Line Numbers**: Just like in Neovim
- **Space Leader Key**: Uses Space as the leader key (like modern Neovim configs)
- **Familiar Window Navigation**: `<C-w>h/j/k/l` for window navigation
- **JetBrains Mono Font**: Clean, coding-friendly font
- **Dark Theme**: Doom One theme (similar to popular Neovim themes)

## Essential Keybindings (Space as Leader)

### File Operations
- `SPC f f` - Find file (like `:e` in Vim)
- `SPC f s` - Save file (like `:w`)
- `SPC f r` - Recent files

### Buffer Operations
- `SPC b b` - Switch buffer (like `:b` in Vim)
- `SPC b k` - Kill (close) buffer (like `:bd`)
- `SPC b n` - Next buffer
- `SPC b p` - Previous buffer

### Search and Navigation
- `SPC s s` - Search in current file (like `/` but with live preview)
- `SPC s p` - Search in project (like telescope grep in Neovim)
- `SPC s r` - Find and replace

### Git Integration
- `SPC g g` - Magit status (amazing Git interface)
- `SPC g b` - Switch Git branch
- `SPC g l` - Git log

### Project Management
- `SPC p f` - Find file in project
- `SPC p p` - Switch project
- `SPC p g` - Search in project

### Window Management
- `SPC w h/j/k/l` - Move between windows
- `SPC w v` - Vertical split
- `SPC w s` - Horizontal split
- `SPC w d` - Delete window
- `SPC w o` - Delete other windows

### Other Useful Keys
- `ESC` - Quit more things (like in Vim)
- `j k` - Exit insert mode (if you're used to this from Vim)
- `g d` - Go to definition
- `g r` - Find references
- `SPC h d h` - Doom help documentation

## Vim Modes Available
- Normal mode: Navigate and manipulate text
- Insert mode: Type text
- Visual mode: Select text
- Command mode: Run Emacs commands

## Getting Started

1. Launch Emacs: `emacs` or `emacsclient` (if daemon is running)
2. The dashboard will show recent files and projects
3. Use `SPC f f` to open a file
4. Use `SPC ?` to see all available keybindings

## Customization

- Edit `~/.doom.d/config.el` for personal configurations
- Edit `~/.doom.d/init.el` to enable/disable modules
- Edit `~/.doom.d/packages.el` to add new packages
- Run `~/.emacs.d/bin/doom sync` after making changes

## Coming from Neovim

- **Plugins**: Doom Emacs modules work like Neovim plugin managers
- **Configuration**: Lisp instead of Lua/Vimscript, but similar concepts
- **Performance**: May feel different initially, but very powerful once configured
- **Terminal**: Use `SPC o t` for terminal (vterm is installed)
- **File Explorer**: Treemacs is like NvimTree (`SPC o p`)

## Useful Doom Commands

- `doom sync` - Sync configuration changes
- `doom upgrade` - Update Doom Emacs
- `doom doctor` - Check for configuration issues
- `doom help` - Show help

Remember: This is Emacs with Vim keybindings, so you get the best of both worlds!
