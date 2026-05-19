return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- Dashboard
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
            { icon = "󰍉", key = "f", desc = "Find File",      action = ":lua Snacks.picker.files()" },
            { icon = "󰴒", key = "j", desc = "Load Session",   action = ":Persisted select" },
            { icon = "󰩈", key = "q", desc = "Quit",           action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { icon = "󱔗", title = "Sessions",     section = "projects",     indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },

      -- Picker
      picker = {
        enabled = true,
        sources = {
          files = {
            exclude = { "target", "third_party", "external", "external_data" },
          },
        },
        win = {
          input   = { wo = { winblend = 20 } },
          list    = { wo = { winblend = 20 } },
          preview = { wo = { winblend = 20 } },
        },
      },

      -- Replaces famiu/bufdelete.nvim
      bufdelete = { enabled = true },

      -- Replaces liouk/gitlinks.nvim — use :GitBrowse
      gitbrowse = { enabled = true },

      -- Replaces lukas-reineke/indent-blankline.nvim
      indent = {
        enabled = true,
        animate = { enabled = false },
        filter = function(buf)
          local ft = vim.bo[buf].filetype
          local allowed = {
            c = true, cpp = true, python = true,
            json = true, yaml = true, lua = true, tex = true,
          }
          return allowed[ft] == true
        end,
      },

      -- Scope highlighting (pairs with indent)
      scope = { enabled = true },

      -- Replaces folke/zen-mode.nvim
      zen = {
        enabled = true,
        win = { width = 145 },
      },

      -- Enhances vim.ui.input (used by opencode.nvim)
      input = {},
    },
    keys = {
      { "<leader>f", function() Snacks.picker.files() end,     desc = "Fuzzy Find File" },
      { "<leader>g", function() Snacks.picker.grep_word() end, desc = "Fuzzy Grep Word" },
      { "<leader>t", function() Snacks.picker.buffers() end,   desc = "Fuzzy Find Buffers" },
      { "<leader>z", function() Snacks.zen() end,              desc = "Toggle Zen Mode" },
    },
    init = function()
      -- :GitBrowse — open current file/range in browser (normal or visual mode)
      vim.api.nvim_create_user_command("GitBrowse", function(args)
        local opts = {}
        if args.range > 0 then
          opts.line_start = args.line1
          opts.line_end = args.line2
        end
        Snacks.gitbrowse(opts)
      end, { range = true, desc = "Open current file/range in browser" })
    end,
  },
}
