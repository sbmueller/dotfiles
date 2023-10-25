return {
  {
    "mhartington/formatter.nvim",
    lazy = true,
    event = "BufWritePre",
    opts = {
      filetype = {
        json = {
          -- prettier
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
              stdin = true
            }
          end
        },
        yaml = {
          -- prettier
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
              stdin = true
            }
          end
        },
        toml = {
          -- prettier
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
              stdin = true
            }
          end
        },
        markdown = {
          -- prettier
          function()
            return {
              exe = "prettier",
              args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
              stdin = true
            }
          end
        },
        rust = {
          -- Rustfmt
          function()
            return {
              exe = "rustfmt",
              args = {"--emit stdout --edition 2021"},
              stdin = true
            }
          end
        },
        lua = {
          -- luafmt
          function()
            return {
              exe = "luafmt",
              args = {"--indent-count", 2, "--stdin"},
              stdin = true
            }
          end
        },
        cpp = {
          -- clang-format
          function()
            return {
              exe = "clang-format",
              args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
              stdin = true,
              cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
            }
          end
        },
        c = {
          -- clang-format
          function()
            return {
              exe = "clang-format",
              args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
              stdin = true,
              cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
            }
          end
        },
        python = {
          -- Configuration for psf/black
          function()
            return {
              exe = "black", -- this should be available on your $PATH
              args = {"-"},
              stdin = true
            }
          end
        },
        tex = {
          function()
            return {
              exe = "latexindent",
              args = {
                "-g",
                "/dev/null"
              },
              stdin = true
            }
          end
        }
      }
    }
  }
}
