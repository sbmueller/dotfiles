require("dashboard").setup(
  {
    theme = "hyper",
    config = {
      week_header = {
        enable = true
      },
      packages = {enable = false},
      shortcut = {
        {desc = "󰊳 Update", group = "@property", action = "PlugUpdate", key = "u"},
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
          action = "cd ~/notes | Telescope find_files",
          key = "n"
        }
      }
    }
  }
)
