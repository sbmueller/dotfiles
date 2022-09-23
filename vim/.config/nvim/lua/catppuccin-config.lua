require("catppuccin").setup(
  {
    compile = {
      enabled = true,
      path = vim.fn.stdpath("cache") .. "/catppuccin"
    },
    styles = {
      comments = {"italic"},
      conditionals = {"italic"},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {}
    },
    integrations = {
      gitsigns = true,
      cmp = true,
      nvimtree = true,
      treesitter = true,
      telescope = true
    }
  }
)
