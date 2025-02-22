return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    event = {"BufReadPost", "BufNewFile"},
    dependencies = {"nvim-treesitter/nvim-treesitter"}
  }
}
