# 🔌 Plugin Guide

This guide covers installing and configuring awesome WezTerm plugins for enhanced functionality.

## Plugin System

WezTerm uses a native plugin system. Plugins are automatically downloaded and cached when you reference them in your configuration.

## Recommended Plugins

### 1. Smart Workspace Switcher (⚡ Blazingly Fast)

**What it does:** Quickly switch between project workspaces using fuzzy finding with zoxide integration.

**Installation:**

1. Install zoxide first:
   ```bash
   brew install zoxide  # macOS
   # or
   cargo install zoxide
   ```

2. Add to your `.wezterm.lua` (uncomment the plugin section):
   ```lua
   local workspace_switcher = wezterm.plugin.require(
     "https://github.com/MLFlexer/smart_workspace_switcher.wezterm"
   )

   workspace_switcher.apply_to_config(config)
   ```

3. Configure keybinding (already set up with LEADER+s):
   ```lua
   -- This is already in your config!
   { key = 's', mods = 'LEADER', action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }) }
   ```

**Usage:**
- Press `CTRL+A` then `S` to open workspace switcher
- Type to fuzzy search your projects
- Press Enter to switch

---

### 2. Tabline.wez (Beautiful Tab Bar)

**What it does:** Provides a highly customizable tab bar with lualine.nvim-style configuration.

**Installation:**

Add to your `.wezterm.lua`:
```lua
local tabline = wezterm.plugin.require(
  "https://github.com/michaelbrusegard/tabline.wez"
)

-- Configure with rainbow theme
tabline.setup({
  options = {
    icons_enabled = true,
    theme = {
      normal_mode = {
        a = { fg = '#000000', bg = '#c77dff' },  -- Purple
        b = { fg = '#e0e0e0', bg = '#1a0033' },
        c = { fg = '#808080', bg = '#0a0a0a' },
      },
      copy_mode = {
        a = { fg = '#000000', bg = '#6bffb4' },  -- Mint
        b = { fg = '#e0e0e0', bg = '#1a0033' },
        c = { fg = '#808080', bg = '#0a0a0a' },
      },
      search_mode = {
        a = { fg = '#000000', bg = '#ffd56b' },  -- Yellow
        b = { fg = '#e0e0e0', bg = '#1a0033' },
        c = { fg = '#808080', bg = '#0a0a0a' },
      },
    },
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    tab_separators = { left = '', right = '' },
  },
  sections = {
    tabline_a = { 'mode' },
    tabline_b = { 'workspace' },
    tabline_c = { ' ' },
    tab_active = {
      'index',
      { 'parent', padding = 0 },
      '/',
      { 'cwd', padding = { left = 0, right = 1 } },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = {},
    tabline_y = { 'datetime' },
    tabline_z = { 'hostname' },
  },
})

tabline.apply_to_config(config)
```

**Note:** If you use tabline.wez, comment out the `format-tab-title` event in the main config to avoid conflicts.

---

### 3. Resurrect.wezterm (Session Persistence)

**What it does:** Save and restore window/tab/pane layouts and their working directories.

**Installation:**

```lua
local resurrect = wezterm.plugin.require(
  "https://github.com/MLFlexer/resurrect.wezterm"
)

-- Add keybindings
table.insert(config.keys, {
  key = 'S',
  mods = 'LEADER|SHIFT',
  action = wezterm.action_callback(function(win, pane)
    resurrect.save_state(resurrect.workspace_state.get_workspace_state())
  end),
})

table.insert(config.keys, {
  key = 'R',
  mods = 'LEADER|SHIFT',
  action = wezterm.action_callback(function(win, pane)
    resurrect.fuzzy_load(win, pane)
  end),
})
```

**Usage:**
- `CTRL+A` + `Shift+S`: Save current session
- `CTRL+A` + `Shift+R`: Restore a session

---

### 4. Modal.wezterm (Vim-Style Modal Editing)

**What it does:** Adds vim-like modal keybindings with visual feedback.

**Installation:**

```lua
local modal = wezterm.plugin.require(
  "https://github.com/MLFlexer/modal.wezterm"
)

modal.apply_to_config(config)
```

**Note:** This changes your keybinding model to be more vim-like. Only install if you're a vim power user!

---

## Troubleshooting

### Plugin not loading?

1. Check your internet connection (plugins download on first use)
2. Try clearing the plugin cache:
   ```bash
   rm -rf ~/.local/share/wezterm/plugin_cache
   ```
3. Restart WezTerm

### Conflicts?

Some plugins may override keybindings or visual elements. Check the plugin documentation for configuration options.

---

## Creating Custom Rainbow Themes for Plugins

Many plugins support custom themes. Here's a template for creating rainbow-themed plugin configs:

```lua
local rainbow = require('utils.rainbow')
local colors = rainbow.generate_pastel_rainbow(8)

local custom_theme = {
  normal_mode = {
    a = { fg = '#000000', bg = colors[1] },
    b = { fg = '#e0e0e0', bg = '#1a0033' },
    c = { fg = '#808080', bg = '#0a0a0a' },
  },
  -- Add more modes using different rainbow colors
}
```

---

## More Plugins

Check out the [awesome-wezterm](https://github.com/michaelbrusegard/awesome-wezterm) list for more plugins:

- **AI Commander** - Generate bash commands using AI
- **Quick Select** - Jump to build errors in your editor
- **Toggle Terminal** - Quake-style dropdown terminal
- **And many more!**

Happy hacking! 🌈✨
