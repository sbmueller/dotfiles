return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "diff",
        "git_rebase",
        "gitcommit",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "rust",
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

      -- The `main` branch does NOT auto-enable highlight/indent/fold; we wire
      -- it per-buffer for filetypes whose parser we shipped above.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = ensure_installed,
        callback = function(args)
          -- Highlighting
          pcall(vim.treesitter.start, args.buf)
          -- Indentation (provided by the `main` branch as a Lua API)
          local ok, ts_indent = pcall(require, "nvim-treesitter")
          if ok and ts_indent.indentexpr then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
          -- Folding (modern API; replaces nvim_treesitter#foldexpr())
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end,
      })
    end,
  },
}
