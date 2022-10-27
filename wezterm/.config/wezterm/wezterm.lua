local wezterm = require "wezterm"
return {
  term = "wezterm",
  font = wezterm.font("VictorMono Nerd Font", {weight = "DemiBold"}),
  font_size = 11.0,
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Catppuccin Macchiato",
  -- maximum real estate
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  }
}
