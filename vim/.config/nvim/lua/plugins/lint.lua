return {
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    ft = {"python", "yaml", "sh"},
    dependencies = {
      "rachartier/tiny-inline-diagnostic.nvim"
    },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = {"ruff"},
        yaml = {"yamllint"},
        sh = {"shellcheck"},
        markdown = {"markdownlint-cli2"}
      }
      -- Severity Signs
      vim.diagnostic.config(
        {
          signs = {
            Error = "",
            Warn = "",
            Hint = "",
            Info = "󰋼"
          }
        }
      )
    end
  }
}
