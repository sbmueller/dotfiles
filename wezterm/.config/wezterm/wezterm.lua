local wezterm = require "wezterm"
return {
  term = "wezterm",
  font = wezterm.font("VictorMono Nerd Font", {weight = "DemiBold"}),
  font_size = 11.0,
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Catppuccin Macchiato",
  warn_about_missing_glyphs = false,
  -- maximum real estate
  window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 2
  }
}
