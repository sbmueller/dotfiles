return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ensure_installed = {
        "cpp",
        "cmake",
        "c",
        "lua",
        "python",
        "rust",
        "markdown",
        "markdown_inline",
        "bash",
        "regex",
        "vim",
        "vimdoc",
        "yaml",
      }

      require("nvim-treesitter").setup({
        -- Directory to install parsers and queries to (prepended to `runtimepath`)
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- Install parsers asynchronously (no-op if already installed).
      require("nvim-treesitter").install(ensure_installed)

      -- Highlighting is no longer auto-enabled by the plugin; start treesitter
      -- for the filetypes we care about.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = ensure_installed,
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
