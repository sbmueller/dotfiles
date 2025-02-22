return {
  "OXY2DEV/markview.nvim",
  lazy = true,
  ft = {"markdown", "rmarkdown", "quarto", "Avante"},
  dependencies = {
    -- You may not need this if you don't lazy load
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    preview = {
      enable = true,
      filetypes = {"md", "rmd", "quarto", "Avante"}
    }
  }
}
