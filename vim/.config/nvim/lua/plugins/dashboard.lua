return {
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {
      theme = "hyper",
      config = {
        week_header = {
          enable = true
        },
        packages = {enable = true},
        shortcut = {
          {desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u"},
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f"
          },
          {
            desc = "󰴒 Journal",
            group = "DiagnosticHint",
            action = "ObsidianToday",
            key = "j"
          },
          {
            desc = " Notes",
            group = "Number",
            action = "ObsidianQuickSwitch",
            key = "n"
          }
        }
      }
    }
  }
}
