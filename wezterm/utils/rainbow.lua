-- Rainbow color utilities for generating pastel rainbow palettes
-- Uses 24-bit true color (RGB) for maximum vibrancy

local M = {}

-- Generate a pastel rainbow color from HSL
-- hue: 0-360 degrees
-- saturation: 0-100 (default 70 for pastels)
-- lightness: 0-100 (default 75 for pastels)
function M.hsl_to_rgb(h, s, l)
  s = s / 100
  l = l / 100

  local c = (1 - math.abs(2 * l - 1)) * s
  local x = c * (1 - math.abs((h / 60) % 2 - 1))
  local m = l - c / 2

  local r, g, b

  if h < 60 then
    r, g, b = c, x, 0
  elseif h < 120 then
    r, g, b = x, c, 0
  elseif h < 180 then
    r, g, b = 0, c, x
  elseif h < 240 then
    r, g, b = 0, x, c
  elseif h < 300 then
    r, g, b = x, 0, c
  else
    r, g, b = c, 0, x
  end

  r = math.floor((r + m) * 255)
  g = math.floor((g + m) * 255)
  b = math.floor((b + m) * 255)

  return string.format('#%02x%02x%02x', r, g, b)
end

-- Generate N evenly spaced pastel rainbow colors
function M.generate_pastel_rainbow(count, saturation, lightness)
  saturation = saturation or 70 -- Pastel saturation
  lightness = lightness or 75 -- Pastel lightness

  local colors = {}
  local step = 360 / count

  for i = 0, count - 1 do
    local hue = i * step
    table.insert(colors, M.hsl_to_rgb(hue, saturation, lightness))
  end

  return colors
end

-- Generate vibrant neon rainbow colors (for accents)
function M.generate_neon_rainbow(count)
  return M.generate_pastel_rainbow(count, 90, 65) -- Higher saturation, medium lightness
end

-- Generate ANSI color palette with rainbow pastels
function M.generate_ansi_palette()
  return {
    -- Pastel rainbow colors for ANSI 0-7
    '#1a1a1a',  -- Black (slightly lighter for visibility)
    '#ff6b9d',  -- Red (pastel pink)
    '#6bffb4',  -- Green (pastel mint)
    '#ffd56b',  -- Yellow (pastel gold)
    '#6bd4ff',  -- Blue (pastel sky)
    '#c77dff',  -- Magenta (pastel purple)
    '#6bfff0',  -- Cyan (pastel aqua)
    '#e0e0e0',  -- White (light gray)
  }
end

-- Generate bright ANSI colors (8-15) with more vibrant pastels
function M.generate_bright_palette()
  return {
    '#505050',  -- Bright Black (gray)
    '#ff9dc6',  -- Bright Red
    '#9dffce',  -- Bright Green
    '#ffe69d',  -- Bright Yellow
    '#9de6ff',  -- Bright Blue
    '#dda6ff',  -- Bright Magenta
    '#9dfffa',  -- Bright Cyan
    '#ffffff',  -- Bright White
  }
end

-- Get a specific rainbow color by index (0-based, wraps around)
function M.get_rainbow_color(index, total_colors)
  total_colors = total_colors or 16
  local colors = M.generate_pastel_rainbow(total_colors)
  return colors[(index % total_colors) + 1]
end

-- Generate gradient between two colors
function M.gradient_between(color1, color2, steps)
  -- This is a simple placeholder - WezTerm has built-in gradient support
  -- but this can be useful for custom effects
  local colors = {}
  for i = 0, steps - 1 do
    local t = i / (steps - 1)
    table.insert(colors, color1) -- Simplified for now
  end
  return colors
end

return M
