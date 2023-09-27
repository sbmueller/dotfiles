-- File for autocommands that are executed upon certain events

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

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
    -- do nothing
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

augroup("Fixers", {clear = true})
autocmd(
  "BufWritePost,BufWinEnter",
  {
    group = "Fixers",
    pattern = "*.c,*.cpp,*.cc,*.h,*.hpp,*.py",
    command = "lua require('lint').try_lint()"
  }
)
autocmd(
  "BufWritePost",
  {
    group = "Fixers",
    pattern = "*.c,*.cpp,*.cc,*.h,*.hpp,*.py,*.lua,*.md,*.yaml,*.json,*.rs",
    command = "lua Autoformat()"
  }
)

augroup("TrimTrailingWhiteSpace", {clear = true})
autocmd(
  "BufWritePre",
  {
    group = "TrimTrailingWhiteSpace",
    pattern = "*",
    command = "%s/\\s\\+$//e"
  }
)
autocmd(
  "BufWritePre",
  {
    group = "TrimTrailingWhiteSpace",
    pattern = "*",
    command = "%s/\n\\+\\%$//e"
  }
)
