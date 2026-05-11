-- Single source of truth for diagnostic UI configuration.
-- Plugins (e.g. tiny-inline-diagnostic) may further tweak this on attach.

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = false, -- handled by tiny-inline-diagnostic
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
})
