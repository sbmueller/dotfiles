return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    -- snacks.nvim is configured at top-level in plugins/dashboard.lua; here we
    -- just contribute opts (Lazy merges them). No `optional = true` is needed
    -- because dashboard.lua now declares snacks as a first-class spec.
    dependencies = {
      {
        "folke/snacks.nvim",
        ---@module "snacks"
        ---@type snacks.Config
        opts = {
          input = {}, -- Enhances `ask()`
          picker = {
            -- Enhances `select()`
            actions = {
              opencode_send = function(...)
                return require("opencode").snacks_picker_send(...)
              end,
            },
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
    },
    keys = {
      {
        "<Leader>o",
        function()
          require("opencode").toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle opencode",
      },
    },
    init = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {}
      vim.o.autoread = true -- required for opts.events.reload
    end,
  },
}
