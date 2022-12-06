local wezterm = require 'wezterm'

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

return {
  color_scheme = "Eldorado dark (terminal.sexy)",

  font = wezterm.font 'HackGen35 Console',
  font_size = 14,

  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,

  window_background_opacity = 1,
}
