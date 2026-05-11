return {
  {
    "L3MON4D3/LuaSnip",
    -- Loaded as a dependency of blink.cmp.
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    -- jsregexp is optional but enables LSP-style snippet transforms.
    build = "make install_jsregexp",
    config = function()
      local loader = require("luasnip.loaders.from_vscode")
      loader.lazy_load() -- friendly-snippets and any plugin-shipped snippets
      loader.lazy_load({ paths = { "~/snippets" } }) -- user snippets
    end,
  },
}
