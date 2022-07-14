local wezterm = require "wezterm"
return {
  term = "wezterm",
  font = wezterm.font("Iosevka Nerd Font"),
  font_size = 11.0,
  hide_tab_bar_if_only_one_tab = true,
  -- TokyoNight Storm
  colors = {
    -- The default text color
    foreground = "#b0caf5",
    -- The default background color
    background = "#24283b",
    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = "#c0caf5",
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = "#24283b",
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = "#a0caf5",
    -- the foreground color of selected text
    selection_fg = "c0caf5",
    -- the background color of selected text
    selection_bg = "#364A82",
    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = "#222222",
    -- The color of the split lines between panes
    split = "#444444",
    ansi = {"#1D202F", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6"},
    brights = {"#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5"}

    -- Arbitrary colors of the palette in the range from 16 to 255
    -- indexed = {[136] = "#af8700"},

    -- Since: 20220319-142410-0fcdea07
    -- When the IME, a dead key or a leader key are being processed and are effectively
    -- holding input pending the result of input composition, change the cursor
    -- to this color to give a visual cue about the compose state.
    -- compose_cursor = "orange",
  },
  -- maximum real estate
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  }
}
