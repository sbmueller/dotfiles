return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    dependencies = {"nvim-lua/plenary.nvim"},
    keys = {
      {
        "<leader>f",
        require("telescope.builtin").find_files,
        desc = "Fuzzy Find File"
      },
      {
        "<leader>g",
        function()
          require("telescope.builtin").live_grep {default_text = vim.fn.expand("<cword>")}
        end,
        desc = "Fuzzy Grep String"
      },
      {
        "gr",
        function()
          require("telescope.builtin").lsp_references()
        end,
        desc = "Symbol References"
      },
      {
        "gd",
        function()
          require("telescope.builtin").lsp_definitions()
        end,
        desc = "Goto Definitions"
      },
      {
        "gi",
        function()
          require("telescope.builtin").lsp_implementations()
        end,
        desc = "Goto Implementations"
      },
      {
        "<leader>t",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Fuzzy Find Buffers"
      }
    },
    opts = {
      defaults = {
        file_ignore_patterns = {"build/", "sca/", "target/"},
        winblend = 50
      }
    }
  }
}
