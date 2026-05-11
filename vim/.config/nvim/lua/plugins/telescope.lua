return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
    keys = {
      {
        "<leader>f",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Fuzzy Find File",
      },
      {
        "<leader>g",
        function()
          require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
        end,
        desc = "Fuzzy Grep String",
      },
      {
        "gr",
        function()
          require("telescope.builtin").lsp_references()
        end,
        desc = "Symbol References",
      },
      {
        "gd",
        function()
          require("telescope.builtin").lsp_definitions({ reuse_win = true })
        end,
        desc = "Goto Definitions",
      },
      {
        "gi",
        function()
          require("telescope.builtin").lsp_implementations()
        end,
        desc = "Goto Implementations",
      },
      {
        "<leader>t",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Fuzzy Find Buffers",
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          winblend = 50,
        },
        pickers = {
          find_files = {
            file_ignore_patterns = { "target/", "third_party/", "external/", "external_data/" },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      telescope.load_extension("ui-select")
      -- persisted.nvim's telescope extension is loaded by the persisted plugin
      -- spec via dependencies; we don't load it here to avoid forcing persisted
      -- to load before VeryLazy.
    end,
  },
}
