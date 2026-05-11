-- Top-level Neovim entrypoint.
-- Order matters: options first (incl. leader), then plugins, then everything
-- that may rely on plugins being installed (autocmds, diagnostics).

require("config.options")
require("config.lazy")
require("config.diagnostics")
require("config.autocmds")
require("config.keymaps")

if vim.g.neovide then
  require("config.neovide")
end
