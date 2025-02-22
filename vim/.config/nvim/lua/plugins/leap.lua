return {
  {
    "ggandor/leap.nvim",
    lazy = true,
    event = {"BufReadPost", "BufNewFile"},
    config = function()
      require("leap").create_default_mappings()
    end
  }
}
