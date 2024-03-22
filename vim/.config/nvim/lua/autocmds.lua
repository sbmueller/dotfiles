-- File for autocommands that are executed upon certain events

--Helper Functions
function Autoformat()
  if vim.b.autoformat_disable == nil then
    vim.b.autoformat_disable = 0
  end

  if vim.b.autoformat_disable == 1 then
    return
  end

  if vim.bo.readonly or not vim.bo.modifiable then
    return
  end

  -- Ignore error from undojoin: E790
  local status, result = pcall(vim.cmd, "undojoin")
  if not status then
    vim.cmd("FormatWrite")
  else
    vim.cmd("FormatWrite")
  end
end

function AutoformatToggle()
  if vim.b.autoformat_disable == nil then
    vim.b.autoformat_disable = 0
  end

  if vim.b.autoformat_disable == 1 then
    vim.api.nvim_out_write("Autoformat: ENABLED\n")
    vim.b.autoformat_disable = 0
  else
    vim.api.nvim_out_write("Autoformat: DISABLED\n")
    vim.b.autoformat_disable = 1
  end
end

-- Linting
vim.api.nvim_create_augroup("Fixers", {clear = true})
vim.api.nvim_create_autocmd(
  {"BufWritePost", "BufWinEnter"},
  {
    group = "Fixers",
    pattern = "*.c,*.cpp,*.cc,*.h,*.hpp,*.py,*.yaml,*.yml",
    callback = function()
      local lint = require("lint")
      lint.try_lint() -- ft specific linters
    end
  }
)
-- Autoformat
vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    group = "Fixers",
    pattern = "*.c,*.cpp,*.cc,*.h,*.hpp,*.py,*.lua,*.md,*.yaml,*.json,*.rs,*.tex",
    command = "lua Autoformat()"
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
