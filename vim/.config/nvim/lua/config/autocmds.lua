-- Cross-cutting autocommands. Plugin-specific autocmds live in their plugin
-- spec under lua/plugins/.

local augroup = function(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Trim trailing whitespace and trailing blank lines on save while preserving
-- the cursor position.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("TrimTrailingWhiteSpace"),
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()
    pcall(vim.cmd, [[silent! keeppatterns %s/\s\+$//e]])
    pcall(vim.cmd, [[silent! keeppatterns %s/\n\+\%$//e]])
    vim.fn.winrestview(view)
  end,
})

-- Terminal-buffer tweaks: disable spell-check and shadow the global
-- <Tab>/<S-Tab> buffer-cycle mappings so <Tab> falls through to the terminal.
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup("Terminal"),
  pattern = "*",
  callback = function(args)
    vim.opt_local.spell = false
    vim.keymap.set("n", "<Tab>", "<Tab>", { buffer = args.buf, noremap = true })
    vim.keymap.set("n", "<S-Tab>", "<S-Tab>", { buffer = args.buf, noremap = true })
  end,
})

-- Restore a sane cursor on exit/suspend so the host terminal isn't left with
-- a block-style cursor.
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  group = augroup("CursorRestore"),
  command = "set guicursor=a:ver25-blinkon400-blinkoff250",
})

-- LSP: enable inlay hints for servers that support them.
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup("LspInlayHints"),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or not client:supports_method("textDocument/inlayHint") then
      return
    end

    local allow = {
      clangd = true,
      rust_analyzer = true,
      lua_ls = true,
    }

    if allow[client.name] then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- LSP: shared on-attach keymaps. These fire only when an LSP actually attaches
-- to a buffer, so the bindings can't be triggered without a backing client.
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup("LspKeymaps"),
  callback = function(args)
    local opts = { buffer = args.buf }
    local set = vim.keymap.set

    set("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Line Diagnostics" }))
    set("n", "<leader>D", vim.diagnostic.setloclist, vim.tbl_extend("force", opts, { desc = "Buffer Diagnostics" }))
    set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Goto Declaration" }))
    set("n", "K", function()
      vim.lsp.buf.hover({ border = "rounded" })
    end, vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))
    set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
    set("n", "<leader>h", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP Code Action" }))
    set("n", "gd", function() Snacks.picker.lsp_definitions({ jump = { reuse_win = true } }) end,
        vim.tbl_extend("force", opts, { desc = "Goto Definitions" }))
    set("n", "gr", function() Snacks.picker.lsp_references() end,
        vim.tbl_extend("force", opts, { desc = "Symbol References" }))
    set("n", "gi", function() Snacks.picker.lsp_implementations() end,
        vim.tbl_extend("force", opts, { desc = "Goto Implementations" }))
  end,
})
