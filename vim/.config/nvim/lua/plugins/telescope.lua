return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim"},
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
          require("telescope.builtin").lsp_definitions({reuse_win = true})
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
    config = function()
      require("telescope").setup {
        defaults = {
          file_ignore_patterns = {"sca/", "target/"},
          winblend = 50
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
