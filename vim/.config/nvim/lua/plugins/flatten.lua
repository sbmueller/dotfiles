return {
  {
    "willothy/flatten.nvim",
    opts = {
      window = {
        open = "alternate",
        diff = "tab_vsplit",
        focus = "first"
      },
      block_for = {
        gitcommit = true,
        gitrebase = true,
      },
      integrations = {
        kitty = false,
        wezterm = false
      }
    },
    lazy = false,
    priority = 1001
  }
}
