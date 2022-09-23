-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require "nvim-tree".setup {
  view = {
    width = 60
  },
  renderer = {
    icons = {
      webdev_colors = true
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = ""
    }
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
} -- END_DEFAULT_OPTS
