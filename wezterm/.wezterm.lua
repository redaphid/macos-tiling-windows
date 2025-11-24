-- WezTerm Configuration: Cyberpunk Pastel Rave Edition 🌈✨
-- A stunning 24-bit true color terminal experience
-- Created with love for the hacker aesthetic

local wezterm = require('wezterm')
local config = {}

-- Use config builder for better error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Debug: Log that we're loading this config
wezterm.log_info('🌈 Loading Cyberpunk Pastel Rave config...')

-- Set up package path to find our modules
-- Get the directory where this config file lives
local config_dir = wezterm.config_dir or (os.getenv('HOME') .. '/.config/wezterm')
-- If using symlink, resolve to actual directory
local home = os.getenv('HOME')
config_dir = home .. '/Projects/macos-tiling-windows/wezterm'

package.path = config_dir .. '/?.lua;' ..
               config_dir .. '/?/init.lua;' ..
               package.path

-- Load custom color scheme with error handling
local ok, colorscheme = pcall(require, 'colors.cyberpunk-pastel-rave')
if not ok then
  wezterm.log_error('Failed to load color scheme: ' .. tostring(colorscheme))
  -- Fallback: set colors directly
else
  wezterm.log_info('✅ Color scheme loaded')
  config.colors = colorscheme.colors
  config.visual_bell = colorscheme.visual_bell
end

-- Load and apply modules with error handling
local appearance_ok, appearance = pcall(require, 'modules.appearance')
if appearance_ok then
  wezterm.log_info('✅ Appearance module loaded')
  config = appearance.apply(config)
else
  wezterm.log_error('Failed to load appearance: ' .. tostring(appearance))
end

local keys_ok, keybindings = pcall(require, 'modules.keybindings')
if keys_ok then
  wezterm.log_info('✅ Keybindings module loaded')
  config = keybindings.apply(config)
else
  wezterm.log_error('Failed to load keybindings: ' .. tostring(keybindings))
end

local workspace_ok, workspace = pcall(require, 'modules.workspace')
if workspace_ok then
  wezterm.log_info('✅ Workspace module loaded')
  config = workspace.apply(config)
  workspace.setup_events()

  -- Format tab titles with rainbow colors
  wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    return appearance.format_tab_title(tab, tabs, panes, config, hover, max_width)
  end)
else
  wezterm.log_error('Failed to load workspace: ' .. tostring(workspace))
end

-- Welcome message with ASCII art
wezterm.on('gui-startup', function()
  local tab, pane, window = wezterm.mux.spawn_window({})
  -- You could print a cool ASCII art banner here if desired
end)

-- Plugin configuration placeholder
-- When you install plugins, configure them here:
--
-- Example for smart_workspace_switcher:
-- local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
-- workspace_switcher.apply_to_config(config)
--
-- Example for tabline.wez:
-- local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
-- tabline.setup({
--   options = {
--     theme = 'Catppuccin Mocha', -- You can create a custom rainbow theme here
--   }
-- })
-- tabline.apply_to_config(config)

-- Performance optimizations
config.front_end = 'WebGpu' -- Use GPU acceleration for best performance
config.webgpu_power_preference = 'HighPerformance'

-- Terminal behavior
config.scrollback_lines = 10000
config.enable_kitty_graphics = true
config.enable_kitty_keyboard = true

-- Shell configuration (customize to your preference)
-- config.default_prog = { '/bin/zsh', '-l' }

-- Hyperlink rules for quick access
config.hyperlink_rules = {
  -- URL patterns
  {
    regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
    format = '$0',
  },
  -- Implicit https
  {
    regex = '\\b[\\w.-]+\\.[a-z]{2,15}/\\S*\\b',
    format = 'https://$0',
  },
  -- GitHub references (user/repo)
  {
    regex = '\\b[a-zA-Z0-9_-]+/[a-zA-Z0-9_-]+\\b',
    format = 'https://github.com/$0',
  },
  -- File paths
  {
    regex = '[^:]+:\\d+',
    format = '$0',
  },
}

-- Quick select patterns for better productivity
config.quick_select_patterns = {
  -- Git hashes
  '[0-9a-f]{7,40}',
  -- UUIDs
  '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}',
  -- IPv4 addresses
  '\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b',
  -- File paths with line numbers
  '[\\w\\-\\./]+:\\d+',
}

-- Note: Don't override config.keys here or it will wipe out all the tmux-style bindings from the keybindings module!

return config
