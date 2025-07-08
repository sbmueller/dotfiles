return {
  {
    "stevearc/conform.nvim",
    lazy = true,
    ft = {"c", "cpp", "json", "lua", "markdown", "python", "rust", "tex", "yaml"},
    config = function()
      local conform = require("conform")
      conform.setup {
        formatters_by_ft = {
          -- Use a sub-list to run only the first available formatter
          c = {"clang-format"},
          cpp = {"clang-format"},
          json = {"prettier"},
          lua = {"luafmt"},
          markdown = {"prettier"},
          python = {"ruff"},
          rust = {"rustfmt"},
          tex = {"latexindent"},
          toml = {"prettier"},
          yaml = {"prettier"}
        },
        format_on_save = function(bufnr)
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat then
            return
          end
          return {timeout_ms = 500, lsp_fallback = true}
        end
      }

      -- Custom formatter arguments
      conform.formatters.luafmt = {
        command = "luafmt",
        args = {"--indent-count", 2, "--stdin"},
        stdin = true
      }
      conform.formatters.latexindent = {
        prepend_args = {
          "-g",
          "/dev/null",
          '-y="defaultIndent:\'  \'"'
        }
      }

      -- Functionality to enable/disable formatting
      vim.api.nvim_create_user_command(
        "FormatToggle",
        function()
          if vim.g.disable_autoformat then
            vim.api.nvim_out_write("Autoformat: ENABLED\n")
            vim.g.disable_autoformat = false
          else
            vim.api.nvim_out_write("Autoformat: DISABLED\n")
            vim.g.disable_autoformat = true
          end
        end,
        {
          desc = "Toggle autoformat-on-save"
        }
      )
    end
  }
}
