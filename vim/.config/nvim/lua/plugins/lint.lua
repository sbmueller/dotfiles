return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    dependencies = {
      "rachartier/tiny-inline-diagnostic.nvim",
    },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { "ruff" },
        yaml = { "yamllint" },
        sh = { "shellcheck" },
        markdown = { "markdownlint-cli2" },
        groovy = { "npm-groovy-lint" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
        group = vim.api.nvim_create_augroup("Linters", { clear = true }),
        callback = function()
          -- try_lint is a no-op for filetypes without a configured linter,
          -- but pcall guards against missing external binaries.
          pcall(lint.try_lint)
        end,
      })
    end,
  },
}
