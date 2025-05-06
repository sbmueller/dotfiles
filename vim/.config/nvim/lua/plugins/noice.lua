return {
  {
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "notify", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext" -- view for search count messages. Set to `false` to disable
      },
      lsp = {
        hover = {
          enabled = true
        },
        override = {
          -- override the default lsp markdown formatter with Noice
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          -- override the lsp markdown formatter with Noice
          ["vim.lsp.util.stylize_markdown"] = true,
          -- override cmp documentation with Noice (needs the other options to work)
          ["cmp.entry.get_documentation"] = true
        }
      },
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = false, -- long messages will be sent to a split
        inc_rename = false -- enables an input dialog for inc-rename.nvim
      }
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      {"MunifTanjim/nui.nvim"},
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      {
        "rcarriga/nvim-notify",
        config = function()
          require("notify").setup(
            {
              background_colour = "#000000"
            }
          )

          vim.notify = require("notify")
        end
      }
    }
  }
}
