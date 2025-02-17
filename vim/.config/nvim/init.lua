-- Top-level NeoVim configuration file
-- Order of `requires` is important!

-- General vim settings
require("settings")
-- Plugins
require("lazynvim")
-- Autocommands
require("autocmds")
-- General key mappings
require("mappings")
-- Neovide settings
if vim.g.neovide then
  require("neovide")
end
