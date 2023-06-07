require("godbolt").setup(
  {
    languages = {
      cpp = {compiler = "g94", options = {userArguments = "-std=c++14 -Wall -O0"}},
      c = {compiler = "cg94", options = {}}
      -- any_additional_filetype = { compiler = ..., options = ... },
    },
    quickfix = {
      enable = true, -- whether to populate the quickfix list in case of errors
      auto_open = false -- whether to open the quickfix list in case of errors
    },
    url = "https://godbolt.org" -- can be changed to a different godbolt instance
  }
)

vim.b.godbolt_exec = true
