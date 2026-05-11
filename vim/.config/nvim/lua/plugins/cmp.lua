-- Completion stack: blink.cmp (modern replacement for nvim-cmp).
--
-- Migrated 2026-05-08. Replaces:
--   hrsh7th/nvim-cmp + cmp-nvim-lsp + cmp-buffer + cmp-path + cmp-cmdline
--   + cmp_luasnip + lspkind.nvim + zbirenbaum/copilot-cmp
-- LuaSnip is still used as the snippet engine; blink.cmp drives it natively.

return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    version = "1.*", -- Use a release tag (binary fuzzy matcher is prebuilt)
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "fang2hou/blink-copilot",
    },
    opts = {
      -- Default keymap preset closely mirrors the bindings users expect from
      -- nvim-cmp: <C-space> to open, <CR> to accept, <Tab>/<S-Tab> to cycle
      -- selections.
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      },

      appearance = {
        nerd_font_variant = "mono",
        kind_icons = {
          Copilot = "",
        },
      },

      snippets = { preset = "luasnip" },

      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },

      completion = {
        accept = { auto_brackets = { enabled = false } },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
        menu = {
          border = "rounded",
          draw = {
            treesitter = { "lsp" },
          },
        },
        list = {
          selection = { preselect = false, auto_insert = false },
        },
      },

      signature = { enabled = true, window = { border = "rounded" } },

      cmdline = {
        enabled = true,
        keymap = { preset = "cmdline" },
        completion = { menu = { auto_show = true } },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    -- Highlight Copilot suggestions in the completion menu (parity with the
    -- old lspkind tweak).
    config = function(_, opts)
      require("blink.cmp").setup(opts)
      vim.api.nvim_set_hl(0, "BlinkCmpKindCopilot", { fg = "#6CC644" })
    end,
  },
}
