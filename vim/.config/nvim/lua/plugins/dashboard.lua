-- snacks.dashboard (replaces glepnir/dashboard-nvim).
-- snacks.nvim is also referenced by opencode.nvim; declaring it here gives us
-- a single, explicit owner for snacks-wide configuration.

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = table.concat({
            [[███████╗██╗    ██╗██╗███████╗████████╗███╗   ██╗ █████╗ ██╗   ██╗]],
            [[██╔════╝██║    ██║██║██╔════╝╚══██╔══╝████╗  ██║██╔══██╗██║   ██║]],
            [[███████╗██║ █╗ ██║██║█████╗     ██║   ██╔██╗ ██║███████║██║   ██║]],
            [[╚════██║██║███╗██║██║██╔══╝     ██║   ██║╚██╗██║██╔══██║╚██╗ ██╔╝]],
            [[███████║╚███╔███╔╝██║██║        ██║   ██║ ╚████║██║  ██║ ╚████╔╝ ]],
            [[╚══════╝ ╚══╝╚══╝ ╚═╝╚═╝        ╚═╝   ╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝  ]],
          }, "\n"),
          keys = {
            { icon = "󰊳", key = "u", desc = "Update Plugins", action = ":Lazy update" },
            { icon = "󰍉", key = "f", desc = "Find File", action = ":Telescope find_files" },
            { icon = "󰴒", key = "j", desc = "Load Session", action = ":Telescope persisted" },
            { icon = "󰩈", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { icon = "󱔗", title = "Sessions", section = "projects", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      -- Other snacks features can opt in here later (notifier, statuscolumn, …)
      -- Inputs/pickers used by opencode.nvim are configured in plugins/opencode.lua.
    },
  },
}
