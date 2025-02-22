return {
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = {"InsertEnter", "CmdlineEnter"},
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
      "zbirenbaum/copilot-cmp"
    },
    config = function()
      require("copilot_cmp").setup()
      local cmp = require "cmp"
      cmp.setup(
        {
          snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
              -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
              -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
              -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end
          },
          mapping = {
            ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s", "c"}),
            ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s", "c"}),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping(
              {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close()
              }
            ),
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            ["<CR>"] = cmp.mapping.confirm({select = false})
          },
          sources = cmp.config.sources(
            {
              {name = "copilot"},
              {name = "nvim_lsp"},
              -- {name = "vsnip"} -- For vsnip users.
              {name = "luasnip"} -- For luasnip users.
              -- {name = "ultisnips"} -- For ultisnips users.
              -- { name = 'snippy' }, -- For snippy users.
            },
            {
              {name = "buffer"}
            },
            {
              {name = "path"}
            }
          ),
          formatting = {
            format = require("lspkind").cmp_format(
              {
                with_text = false
              }
            )
          },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
          }
        }
      )
      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(
        "/",
        {
          sources = {
            {name = "buffer"}
          }
        }
      )

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(
        ":",
        {
          sources = cmp.config.sources(
            {
              {name = "path"}
            },
            {
              {name = "cmdline"}
            }
          )
        }
      )

      -- lspkind.lua
      local lspkind = require("lspkind")
      lspkind.init(
        {
          symbol_map = {
            Copilot = ""
          }
        }
      )

      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg = "#6CC644"})
    end
  }
}
