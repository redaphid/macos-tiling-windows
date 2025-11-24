# 🌈 Cyberpunk Pastel Rave - WezTerm Configuration

> A stunning 24-bit true color terminal experience with rainbow pastel aesthetics on pure black. Built for hackers who want their terminal to look as good as their code.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![WezTerm](https://img.shields.io/badge/WezTerm-20240203-green.svg)

## ✨ Features

### 🎨 Visual Excellence
- **24-bit True Color**: Pastel rainbow palette with perfect saturation
- **Animated Gradients**: Smooth radial gradients with CatmullRom interpolation
- **Cyberpunk Aesthetic**: Pure black background with neon pastel accents
- **Rainbow Tab Bar**: Each tab gets its own color from the spectrum
- **Smooth Animations**: 60fps cursor blinking and transitions
- **GPU Accelerated**: WebGPU rendering for buttery smooth performance

### ⚡ Productivity
- **Smart Workspace Management**: Quick switching with zoxide integration
- **Vim-Inspired Keybindings**: Intuitive leader key (CTRL+A) for all commands
- **Quick Select**: Instantly jump to URLs, file paths, git hashes
- **Fuzzy Finding**: Built-in launcher for workspaces and commands
- **Session Persistence**: Save and restore your layouts (with plugins)

### 🔧 Modular Architecture
- Clean separation of concerns (appearance, keybindings, workspace)
- Easy customization without touching core config
- Plugin-ready with placeholder configs
- Comprehensive color utilities for custom themes

## 📦 Installation

### Quick Install

```bash
# Clone this repo (if you haven't already)
cd ~/dotfiles/wezterm

# Run the installer
./install.sh
```

The installer will:
- ✅ Backup your existing config
- ✅ Create symlinks to `~/.wezterm.lua`
- ✅ Check for required fonts and dependencies
- ✅ Provide helpful next steps

### Manual Installation

```bash
# Symlink the config
ln -sf ~/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua

# Launch WezTerm!
```

## 🎯 Requirements

### Required
- **WezTerm** (latest version recommended)
  ```bash
  brew install --cask wezterm  # macOS
  ```

### Recommended
- **JetBrains Mono** or **Fira Code** (for ligatures)
  ```bash
  brew install --cask font-jetbrains-mono
  ```
- **zoxide** (for smart workspace switching)
  ```bash
  brew install zoxide
  ```

## ⌨️ Keybindings

### Leader Key: `CTRL+A`

The leader key is your gateway to all pane and tab management commands.

### Tab Management
| Keys | Action |
|------|--------|
| `CMD+T` | New tab |
| `CMD+W` | Close tab |
| `CMD+1-9` | Switch to tab 1-9 |
| `CMD+9` | Switch to last tab |

### Pane Management
| Keys | Action |
|------|--------|
| `Leader` + `\|` | Split vertically |
| `Leader` + `-` | Split horizontally |
| `Leader` + `H/J/K/L` | Navigate panes (vim style) |
| `Leader` + `Arrow` | Resize pane |
| `Leader` + `X` | Close pane |
| `Leader` + `Z` | Zoom/toggle pane fullscreen |
| `Leader` + `O` | Rotate panes |

### Workspace Management
| Keys | Action |
|------|--------|
| `Leader` + `S` | Open workspace switcher |
| `Leader` + `C` | Create new workspace |
| `ALT+1-9` | Switch to workspace 1-9 |

### Productivity
| Keys | Action |
|------|--------|
| `Leader` + `[` | Enter copy mode |
| `Leader` + `Space` | Quick select (URLs, paths, etc.) |
| `CMD+F` | Search |
| `CMD+P` | Command palette |
| `Leader` + `R` | Reload configuration |
| `Leader` + `B` | Toggle fullscreen |

### Font Size
| Keys | Action |
|------|--------|
| `CMD+=` | Increase font size |
| `CMD+-` | Decrease font size |
| `CMD+0` | Reset font size |

## 🎨 Customization

### Colors

Edit `colors/cyberpunk-pastel-rave.lua` to customize the color scheme:

```lua
-- Change ANSI colors
M.colors.ansi = {
  '#1a1a1a',  -- Black
  '#ff6b9d',  -- Red (pink)
  '#6bffb4',  -- Green (mint)
  -- ... customize all 16 colors
}
```

### Appearance

Edit `modules/appearance.lua` to customize visual settings:

```lua
-- Change gradient colors
config.window_background_gradient = {
  orientation = 'Vertical',  -- or Radial
  colors = {
    '#your-color-1',
    '#your-color-2',
    -- ...
  },
}

-- Adjust transparency
config.window_background_opacity = 0.95  -- 0.0-1.0
```

### Keybindings

Edit `modules/keybindings.lua` to customize shortcuts:

```lua
-- Change leader key
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

-- Add custom keybindings
table.insert(config.keys, {
  key = 'your-key',
  mods = 'LEADER',
  action = act.YourAction,
})
```

### Fonts

Edit `modules/appearance.lua`:

```lua
config.font = wezterm.font_with_fallback({
  { family = 'Your Favorite Font', weight = 'Medium' },
  { family = 'Fallback Font' },
})
config.font_size = 14.0
```

## 🔌 Plugins

See [PLUGINS.md](PLUGINS.md) for detailed plugin installation guides.

**Recommended plugins:**
- `smart_workspace_switcher.wezterm` - Blazingly fast workspace switching
- `tabline.wez` - Beautiful customizable tab bar
- `resurrect.wezterm` - Save and restore sessions
- `modal.wezterm` - Vim-style modal keybindings

## 📁 Structure

```
~/dotfiles/wezterm/
├── .wezterm.lua              # Main entry point
├── colors/
│   └── cyberpunk-pastel-rave.lua  # Custom color scheme
├── modules/
│   ├── appearance.lua        # Visual configuration
│   ├── keybindings.lua       # Key mappings
│   └── workspace.lua         # Workspace management
├── utils/
│   └── rainbow.lua           # Color generation utilities
├── plugins/                  # Plugin installations (managed by WezTerm)
├── install.sh               # Installation script
├── PLUGINS.md               # Plugin guide
└── README.md                # This file
```

## 🎨 Color Palette

The theme uses a carefully crafted pastel rainbow palette:

| Color | Hex | Usage |
|-------|-----|-------|
| Background | `#000000` | Pure black |
| Foreground | `#e0e0e0` | Light gray |
| Pink | `#ff6b9d` | Cursor, accents |
| Orange | `#ffa06b` | ANSI bright red |
| Yellow | `#ffd56b` | ANSI yellow |
| Lime | `#d4ff6b` | Highlights |
| Mint | `#6bffb4` | ANSI green |
| Sky | `#6bd4ff` | ANSI blue |
| Purple | `#c77dff` | Active elements |
| Magenta | `#ff6bff` | Special highlights |

All colors are generated with 24-bit RGB precision for maximum vibrancy.

## 🐛 Troubleshooting

### Colors look wrong?
- Ensure your terminal supports 24-bit color
- Check that `COLORTERM=truecolor` is set
- Try: `wezterm ls-fonts` to verify font rendering

### Config not loading?
```bash
# Check for syntax errors
wezterm check-config

# View logs
wezterm --config-file ~/.wezterm.lua
```

### Performance issues?
- Reduce `animation_fps` in `modules/appearance.lua`
- Try different `front_end` settings: `WebGpu`, `OpenGL`, or `Software`
- Disable background gradient temporarily

## 🤝 Contributing

This is a personal dotfiles repo, but feel free to fork and customize for your own use! If you create cool color schemes or improvements, I'd love to see them.

## 📚 Resources

- [WezTerm Documentation](https://wezfurlong.org/wezterm/)
- [Awesome WezTerm Plugins](https://github.com/michaelbrusegard/awesome-wezterm)
- [WezTerm Color Schemes](https://wezfurlong.org/wezterm/colorschemes/index.html)

## 📄 License

MIT License - Feel free to use and modify as you wish!

## 💡 Tips & Tricks

### Quick Commands

```bash
# Test color support
wezterm test-color-scheme

# List available fonts
wezterm ls-fonts

# Capture terminal output with colors
wezterm cli get-text --escapes > output.txt
```

### Pro Tips

1. **Custom Background**: Add your own cyberpunk wallpaper in `modules/appearance.lua`
2. **Workspace Projects**: Use `zoxide` to quickly jump to projects
3. **Copy Mode**: Use vim keybindings in copy mode for efficient text selection
4. **Quick Select**: Customize patterns in `.wezterm.lua` for your workflow

---

Made with 💜 and ✨ for the terminal aesthetic enthusiasts.

**Happy Hacking!** 🌈
