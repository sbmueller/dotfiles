return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#000000",
        },
        config = function(_, opts)
          require("notify").setup(opts)
          vim.notify = require("notify")
        end,
      },
    },
    opts = {
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },
      lsp = {
        hover = { enabled = true },
        signature = { enabled = true },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          -- blink.cmp's documentation rendering replaces cmp.entry.get_documentation
        },
      },
      presets = {
        lsp_doc_border = true,
        bottom_search = false,
        command_palette = false,
        long_message_to_split = false,
        inc_rename = false,
      },
    },
  },
}
