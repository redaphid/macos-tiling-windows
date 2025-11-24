-- Appearance Module: Visual configuration for Cyberpunk Pastel Rave theme
-- Gradients, animations, transparency, and all the eye candy

local wezterm = require('wezterm')
local rainbow = require('utils.rainbow')

local M = {}

function M.apply(config)
  -- Font configuration: Use a modern monospace font with ligatures
  config.font = wezterm.font_with_fallback({
    { family = 'JetBrains Mono', weight = 'Medium' },
    { family = 'Fira Code', weight = 'Medium' },
    { family = 'Menlo', weight = 'Regular' },
  })
  config.font_size = 14.0
  config.line_height = 1.2

  -- Enable font features for beautiful ligatures
  config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

  -- Window appearance: Maximum vibes
  config.window_decorations = 'TITLE | RESIZE' -- Native macOS window controls with traffic lights
  config.window_background_opacity = 0.95 -- Slight transparency for depth
  config.text_background_opacity = 0.9 -- Text has subtle transparency

  -- Stunning rainbow gradient background
  config.window_background_gradient = {
    orientation = {
      Radial = {
        cx = 0.75, -- Center X (right side)
        cy = 0.75, -- Center Y (bottom)
        radius = 1.5, -- Large radius for subtle effect
      },
    },
    colors = {
      '#000000', -- Pure black at center
      '#1a0033', -- Deep purple
      '#0d1b2a', -- Navy
      '#000000', -- Fade back to black
    },
    interpolation = 'CatmullRom', -- Smooth color transitions
    blend = 'Oklab', -- Perceptually uniform color blending
    noise = 32, -- Subtle noise to prevent banding
  }

  -- Alternative: Linear rainbow gradient (commented out, but available!)
  -- config.window_background_gradient = {
  --   orientation = 'Vertical',
  --   colors = {
  --     '#000000',
  --     '#0a0015',
  --     '#0d001f',
  --     '#150033',
  --     '#0d001f',
  --     '#0a0015',
  --     '#000000',
  --   },
  --   interpolation = 'CatmullRom',
  --   blend = 'Oklab',
  --   noise = 48,
  -- }

  -- Window padding: Breathing room for the content
  config.window_padding = {
    left = '1cell',
    right = '1cell',
    top = '0.5cell',
    bottom = '0.5cell',
  }

  -- Inactive panes: Dim them slightly for focus
  config.inactive_pane_hsb = {
    saturation = 0.7,
    brightness = 0.6,
  }

  -- Cursor: Smooth blinking with rainbow vibes
  config.default_cursor_style = 'BlinkingBlock'
  config.cursor_blink_rate = 700
  config.cursor_blink_ease_in = 'EaseIn'
  config.cursor_blink_ease_out = 'EaseOut'

  -- Animation settings: Buttery smooth at 60fps
  config.animation_fps = 60
  config.max_fps = 60

  -- Scrollbar: Subtle but functional
  config.enable_scroll_bar = true
  config.min_scroll_bar_height = '2cell'

  -- Tab bar configuration: Retro style with modern flair
  config.enable_tab_bar = true
  config.use_fancy_tab_bar = false -- Use retro style for more customization
  config.hide_tab_bar_if_only_one_tab = false
  config.tab_bar_at_bottom = true
  config.tab_max_width = 32

  -- Window frame colors (for fancy tab bar, if enabled)
  config.window_frame = {
    font = wezterm.font({ family = 'JetBrains Mono', weight = 'Bold' }),
    font_size = 12.0,
    active_titlebar_bg = '#000000',
    inactive_titlebar_bg = '#000000',
  }

  -- Visual bell: Rainbow flash on bell events
  config.audible_bell = 'Disabled'
  config.visual_bell = {
    fade_in_function = 'EaseIn',
    fade_in_duration_ms = 150,
    fade_out_function = 'EaseOut',
    fade_out_duration_ms = 150,
    target = 'CursorColor', -- Flash the cursor color
  }

  -- Alternative background: You can add custom images or parallax layers
  -- Uncomment and customize as desired:
  -- config.background = {
  --   {
  --     source = {
  --       File = '/path/to/cool/cyberpunk/wallpaper.png',
  --     },
  --     hsb = {
  --       brightness = 0.05, -- Very dim so text is readable
  --       saturation = 1.2,  -- Boost colors slightly
  --     },
  --     width = '100%',
  --     height = '100%',
  --     attachment = { Parallax = 0.1 },
  --   },
  -- }

  return config
end

-- Format tab titles with rainbow colors
function M.format_tab_title(tab, tabs, panes, config, hover, max_width)
  local rainbow_colors = rainbow.generate_pastel_rainbow(#tabs)
  local color = rainbow_colors[tab.tab_index + 1]

  local title = tab.active_pane.title
  -- Trim title if needed
  if #title > max_width - 3 then
    title = wezterm.truncate_right(title, max_width - 3) .. '…'
  end

  local background = tab.is_active and '#1a0033' or '#0a0a0a'
  local foreground = tab.is_active and color or '#505050'

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = ' ' .. (tab.tab_index + 1) .. ': ' .. title .. ' ' },
  }
end

return M
