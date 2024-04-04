-- File for autocommands that are executed upon certain events

-- Linting
vim.api.nvim_create_augroup("Fixers", {clear = true})
vim.api.nvim_create_autocmd(
  {"BufWritePost", "BufWinEnter"},
  {
    group = "Fixers",
    pattern = "*",
    callback = function()
      local lint = require("lint")
      lint.try_lint() -- ft specific linters
    end
  }
)

vim.api.nvim_create_augroup("TrimTrailingWhiteSpace", {clear = true})
vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    group = "TrimTrailingWhiteSpace",
    pattern = "*",
    command = "%s/\\s\\+$//e"
  }
)
vim.api.nvim_create_autocmd(
  "BufWritePre",
  {
    group = "TrimTrailingWhiteSpace",
    pattern = "*",
    command = "%s/\n\\+\\%$//e"
  }
)
-- Disable spellcheck in terminal buffers
vim.api.nvim_create_augroup("Terminal", {clear = true})
vim.api.nvim_create_autocmd(
  "TermOpen",
  {
    group = "Terminal",
    pattern = "*",
    command = "setlocal nospell"
  }
)
