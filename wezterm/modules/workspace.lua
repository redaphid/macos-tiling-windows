-- Workspace Management Module
-- Handles workspace switching, session management, and project navigation
-- Ready for integration with smart_workspace_switcher.wezterm

local wezterm = require('wezterm')
local act = wezterm.action

local M = {}

function M.apply(config)
  -- Workspace-related keybindings
  config.keys = config.keys or {}

  -- Add workspace navigation keys
  table.insert(config.keys, {
    key = 's',
    mods = 'LEADER',
    action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
  })

  -- Quick workspace switching with ALT+number
  for i = 1, 9 do
    table.insert(config.keys, {
      key = tostring(i),
      mods = 'ALT',
      action = act.SwitchToWorkspace({
        name = tostring(i),
      }),
    })
  end

  -- Create new workspace: LEADER + c
  table.insert(config.keys, {
    key = 'c',
    mods = 'LEADER',
    action = act.PromptInputLine({
      description = '(wezterm) Create new workspace:',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            act.SwitchToWorkspace({
              name = line,
            }),
            pane
          )
        end
      end),
    }),
  })

  return config
end

-- Event handler for workspace updates
-- This can be used to update the status bar when workspaces change
function M.setup_events()
  wezterm.on('update-right-status', function(window, pane)
    local workspace = window:active_workspace()
    local time = wezterm.strftime('%H:%M')

    -- Create a colorful status with workspace info
    local rainbow = require('utils.rainbow')
    local colors = rainbow.generate_pastel_rainbow(8)

    window:set_right_status(wezterm.format({
      { Foreground = { Color = colors[1] } },
      { Text = ' ' .. workspace .. ' ' },
      { Foreground = { Color = colors[4] } },
      { Text = ' ' .. time .. ' ' },
    }))
  end)
end

return M
