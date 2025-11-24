-- Keybindings Module: Ergonomic and powerful keybindings
-- Inspired by vim and tmux, but accessible to everyone

local wezterm = require('wezterm')
local act = wezterm.action

local M = {}

function M.apply(config)
  -- Leader key: Ctrl+b (tmux style)
  config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }

  config.keys = {
    -- Tab management: CMD+number to switch tabs (macOS style)
    { key = '1', mods = 'CMD', action = act.ActivateTab(0) },
    { key = '2', mods = 'CMD', action = act.ActivateTab(1) },
    { key = '3', mods = 'CMD', action = act.ActivateTab(2) },
    { key = '4', mods = 'CMD', action = act.ActivateTab(3) },
    { key = '5', mods = 'CMD', action = act.ActivateTab(4) },
    { key = '6', mods = 'CMD', action = act.ActivateTab(5) },
    { key = '7', mods = 'CMD', action = act.ActivateTab(6) },
    { key = '8', mods = 'CMD', action = act.ActivateTab(7) },
    { key = '9', mods = 'CMD', action = act.ActivateTab(-1) },

    -- New tab with CMD+t (also LEADER+c for tmux style)
    { key = 't', mods = 'CMD', action = act.SpawnTab('CurrentPaneDomain') },
    { key = 'c', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },

    -- Close tab with CMD+w
    { key = 'w', mods = 'CMD', action = act.CloseCurrentTab({ confirm = true }) },

    -- Tab navigation: tmux style
    { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },
    { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },

    -- Rename tab: LEADER + ,
    { key = ',', mods = 'LEADER', action = act.PromptInputLine({
        description = 'Enter new name for tab',
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }),
    },

    -- Pane splitting: Tmux style
    -- LEADER + % = vertical split (side by side)
    -- LEADER + " = horizontal split (top and bottom)
    {
      key = '%',
      mods = 'LEADER',
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = '"',
      mods = 'LEADER',
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
    },

    -- Also keep the easier to remember versions
    {
      key = '|',
      mods = 'LEADER',
      action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = '-',
      mods = 'LEADER',
      action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
    },

    -- Pane navigation: vim style (hjkl) and tmux arrow keys
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection('Left') },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection('Down') },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection('Up') },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection('Right') },

    -- Tmux style arrow key navigation
    { key = 'LeftArrow', mods = 'LEADER', action = act.ActivatePaneDirection('Left') },
    { key = 'DownArrow', mods = 'LEADER', action = act.ActivatePaneDirection('Down') },
    { key = 'UpArrow', mods = 'LEADER', action = act.ActivatePaneDirection('Up') },
    { key = 'RightArrow', mods = 'LEADER', action = act.ActivatePaneDirection('Right') },

    -- Pane resizing: Alt + Arrow keys (avoiding conflict with navigation)
    { key = 'LeftArrow', mods = 'ALT', action = act.AdjustPaneSize({ 'Left', 5 }) },
    { key = 'RightArrow', mods = 'ALT', action = act.AdjustPaneSize({ 'Right', 5 }) },
    { key = 'UpArrow', mods = 'ALT', action = act.AdjustPaneSize({ 'Up', 5 }) },
    { key = 'DownArrow', mods = 'ALT', action = act.AdjustPaneSize({ 'Down', 5 }) },

    -- Close pane: LEADER + x
    { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane({ confirm = true }) },

    -- Zoom pane: LEADER + z (toggle fullscreen for current pane)
    { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },

    -- Rotate panes: LEADER + o
    { key = 'o', mods = 'LEADER', action = act.RotatePanes('Clockwise') },

    -- Detach (tmux style): LEADER + d (shows launcher to switch sessions)
    { key = 'd', mods = 'LEADER', action = act.ShowLauncher },

    -- Copy mode: LEADER + [
    { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },

    -- Quick select mode: LEADER + space (for URLs, paths, etc.)
    { key = ' ', mods = 'LEADER', action = act.QuickSelect },

    -- Search: CMD+f
    { key = 'f', mods = 'CMD', action = act.Search('CurrentSelectionOrEmptyString') },

    -- Command palette: CMD+p
    { key = 'p', mods = 'CMD', action = act.ActivateCommandPalette },

    -- Reload configuration: LEADER + r
    {
      key = 'r',
      mods = 'LEADER',
      action = act.ReloadConfiguration,
    },

    -- Toggle fullscreen: Multiple convenient options
    -- LEADER + b (tmux style)
    {
      key = 'b',
      mods = 'LEADER',
      action = act.ToggleFullScreen,
    },
    -- CMD+Enter (quick and easy)
    {
      key = 'Enter',
      mods = 'CMD',
      action = act.ToggleFullScreen,
    },
    -- F11 (cross-platform standard)
    {
      key = 'F11',
      mods = 'NONE',
      action = act.ToggleFullScreen,
    },
    -- CMD+CTRL+F (macOS native style)
    {
      key = 'f',
      mods = 'CMD|CTRL',
      action = act.ToggleFullScreen,
    },

    -- Font size adjustment: CMD + +/- (standard macOS)
    { key = '=', mods = 'CMD', action = act.IncreaseFontSize },
    { key = '-', mods = 'CMD', action = act.DecreaseFontSize },
    { key = '0', mods = 'CMD', action = act.ResetFontSize },

    -- Clipboard: Standard macOS shortcuts work by default (CMD+c, CMD+v)
  }

  -- Mouse bindings: Smart paste, right-click menu, etc.
  config.mouse_bindings = {
    -- Right click pastes from clipboard
    {
      event = { Down = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = act.PasteFrom('Clipboard'),
    },

    -- CTRL+click opens hyperlinks
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
    },
  }

  return config
end

return M
