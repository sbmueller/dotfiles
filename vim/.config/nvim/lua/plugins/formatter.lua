return {
  {
    "mhartington/formatter.nvim",
    lazy = true,
    event = "BufWritePre",
    config = function()
      require("formatter").setup {
        filetype = {
          json = {
            require("formatter.filetypes.json").prettier
          },
          yaml = {
            require("formatter.filetypes.yaml").prettier
          },
          toml = {
            require("formatter.filetypes.toml").prettier
          },
          markdown = {
            require("formatter.filetypes.markdown").prettier
          },
          rust = {
            require("formatter.filetypes.rust").rustfmt
          },
          lua = {
            function()
              return {
                exe = "luafmt",
                args = {"--indent-count", 2, "--stdin"},
                stdin = true
              }
            end
          },
          cpp = {
            require("formatter.filetypes.cpp").clangformat
          },
          c = {
            require("formatter.filetypes.c").clangformat
          },
          python = {
            require("formatter.filetypes.python").black
          },
          tex = {
            function()
              return {
                exe = "latexindent",
                args = {
                  "-g",
                  "/dev/null",
                  '-y="defaultIndent:\'  \'"'
                },
                stdin = true
              }
            end
          }
        }
      }
    end
  }
}
