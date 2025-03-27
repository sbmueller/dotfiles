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
        sh = {"shellcheck"}
      }
      -- Severity Signs
      local signs = {Error = "", Warn = "", Hint = "", Info = "󰋼"}
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
      end
    end
  }
}
