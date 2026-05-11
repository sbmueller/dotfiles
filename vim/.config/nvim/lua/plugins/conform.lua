return {
  {
    "stevearc/conform.nvim",
    ft = { "c", "cpp", "json", "lua", "markdown", "python", "rust", "tex", "yaml", "bzl" },
    cmd = { "ConformInfo", "FormatToggle" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          c = { "clang-format" },
          cpp = { "clang-format" },
          json = { "prettier" },
          lua = { "stylua" },
          markdown = { "prettier" },
          python = { "ruff_format", "ruff_organize_imports" },
          rust = { "rustfmt" },
          tex = { "latexindent" },
          toml = { "prettier" },
          yaml = { "prettier" },
          bzl = { "buildifier" },
        },
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = "fallback" }
        end,
      })

      -- Custom formatter arguments
      conform.formatters.latexindent = {
        prepend_args = {
          "-g",
          "/dev/null",
          [[-y=defaultIndent: '  ']],
        },
      }

      -- Buffer- and global-aware autoformat toggle.
      vim.api.nvim_create_user_command("FormatToggle", function(args)
        if args.bang then
          -- Toggle for this buffer only
          if vim.b.disable_autoformat then
            vim.b.disable_autoformat = false
            vim.api.nvim_out_write("Buffer Autoformat: ENABLED\n")
          else
            vim.b.disable_autoformat = true
            vim.api.nvim_out_write("Buffer Autoformat: DISABLED\n")
          end
        else
          if vim.g.disable_autoformat then
            vim.g.disable_autoformat = false
            vim.api.nvim_out_write("Autoformat: ENABLED\n")
          else
            vim.g.disable_autoformat = true
            vim.api.nvim_out_write("Autoformat: DISABLED\n")
          end
        end
      end, {
        desc = "Toggle autoformat-on-save (use ! for buffer-local)",
        bang = true,
      })
    end,
  },
}
