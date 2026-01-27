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

vim.api.nvim_create_augroup("Sessions", {clear = true})
vim.api.nvim_create_autocmd(
  "VimLeavePre",
  {
    group = "Sessions",
    pattern = "*",
    command = "SessionSave"
  }
)
vim.api.nvim_create_autocmd(
  {"VimLeave", "VimSuspend"},
  {
    command = "set guicursor=a:ver25-blinkon400-blinkoff250"
  }
)

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("TerminalFix", { clear = true }),
  callback = function()
    -- This makes Tab do nothing (or behave normally) only inside terminal buffers
    vim.keymap.set('n', '<Tab>', '<Tab>', { buffer = true, noremap = true })
  end,
})

-- LSP: Enable inlay hints when supported
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspInlayHints", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
