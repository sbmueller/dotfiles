return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true, -- Will be loaded as dependency when required
    dependencies = {"rafamadriz/friendly-snippets"},
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      local luasnip_loader = require("luasnip.loaders.from_vscode")
      luasnip_loader.lazy_load() -- Snippets in path
      luasnip_loader.lazy_load({paths = {"~/dotfiles/zf"}}) -- Custom ZF snippets
    end
  }
}
