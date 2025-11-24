-- Cyberpunk Pastel Rave Color Scheme
-- A stunning 24-bit true color theme with rainbow pastels on pure black
-- Perfect for the terminal aesthetic that says "I'm here to hack and look fabulous"

local rainbow = require('utils.rainbow')

local M = {}

-- Generate our custom pastel rainbow palette
local ansi = rainbow.generate_ansi_palette()
local brights = rainbow.generate_bright_palette()

M.colors = {
  -- Pure black background for maximum contrast and that "hacker terminal" vibe
  foreground = '#e0e0e0', -- Light gray for readability
  background = '#000000', -- Pure black

  -- Cursor: Bright neon pink with smooth animations
  cursor_bg = '#ff6b9d',
  cursor_fg = '#000000',
  cursor_border = '#ff6b9d',

  -- Selection: Semi-transparent pastel blue for elegance
  selection_fg = '#ffffff',
  selection_bg = 'rgba(107, 212, 255, 0.3)', -- Pastel blue with 30% opacity

  -- Scrollbar: Subtle but visible
  scrollbar_thumb = '#333333',

  -- Split lines: Dim rainbow gradient effect
  split = '#6bd4ff',

  -- ANSI Colors (0-7): Pastel rainbow spectrum
  ansi = ansi,

  -- Bright ANSI Colors (8-15): More vibrant pastels
  brights = brights,

  -- Indexed colors for special uses
  indexed = {
    [16] = '#ff6b9d', -- Pink
    [17] = '#ffa06b', -- Orange
    [18] = '#ffd56b', -- Yellow
    [19] = '#d4ff6b', -- Lime
    [20] = '#6bffb4', -- Mint
    [21] = '#6bd4ff', -- Sky
    [22] = '#9d6bff', -- Purple
    [23] = '#ff6bff', -- Magenta
  },

  -- Compose cursor: Bright yellow for visibility
  compose_cursor = '#ffd56b',

  -- Copy mode and quick select: Neon highlights
  copy_mode_active_highlight_bg = { Color = '#ff6b9d' },
  copy_mode_active_highlight_fg = { Color = '#000000' },
  copy_mode_inactive_highlight_bg = { Color = '#6bd4ff' },
  copy_mode_inactive_highlight_fg = { Color = '#000000' },

  quick_select_label_bg = { Color = '#c77dff' },
  quick_select_label_fg = { Color = '#000000' },
  quick_select_match_bg = { Color = '#6bffb4' },
  quick_select_match_fg = { Color = '#000000' },

  -- Tab bar colors: Rainbow theme
  tab_bar = {
    background = '#000000',

    active_tab = {
      bg_color = '#1a0033', -- Deep purple-black
      fg_color = '#c77dff', -- Bright pastel purple
      intensity = 'Bold',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = '#0a0a0a',
      fg_color = '#808080',
    },

    inactive_tab_hover = {
      bg_color = '#1a1a1a',
      fg_color = '#6bd4ff', -- Pastel blue on hover
      italic = true,
    },

    new_tab = {
      bg_color = '#0a0a0a',
      fg_color = '#6bffb4', -- Pastel mint
    },

    new_tab_hover = {
      bg_color = '#1a1a1a',
      fg_color = '#9dffce', -- Bright mint on hover
      italic = true,
    },

    inactive_tab_edge = '#1a1a1a',
  },
}

-- Visual bell configuration: Rainbow flash effect
M.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 150,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 150,
}

-- Override color for visual bell (cycles through rainbow)
M.visual_bell_colors = {
  '#ff6b9d', -- Pink
  '#ffa06b', -- Orange
  '#ffd56b', -- Yellow
  '#6bffb4', -- Mint
  '#6bd4ff', -- Sky
  '#c77dff', -- Purple
}

return M
