require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {"javascript", "tlaplus", "norg"}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {} -- list of language that will be disabled
  },
  indent = {
    enable = true, -- false will disable the whole extension
    disable = {} -- list of language that will be disabled
  },
  folding = {
    enable = true, -- false will disable the whole extension
    disable = {} -- list of language that will be disabled
  }
}
