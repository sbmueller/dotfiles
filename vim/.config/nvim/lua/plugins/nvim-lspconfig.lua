-- Enabler for inlay hints
local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
  else
    vim.lsp.inlay_hint.enable(false, {bufnr = bufnr})
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = {"python", "cpp", "c", "rust", "cmake", "tex", "lua", "markdown", "bzl"},
    keys = {
      {"<leader>d", vim.diagnostic.open_float, desc = "Line Diagnostics"},
      {"<leader>D", vim.diagnostic.setloclist, desc = "Buffer Diagnostics"},
      {"gD", vim.lsp.buf.declaration, desc = "Goto Declaration"},
      {"K", vim.lsp.buf.hover({border = "rounded"}), desc = "Hover Documentation"},
      {"<leader>rn", vim.lsp.buf.rename, desc = "Rename Symbol"},
      {"<leader>h", vim.lsp.buf.code_action, desc = "LSP Code Action"}
      -- gr: Show References is handled by Telescope
      -- gi: Show Implementations is handled by Telescope
      -- gd: Show Definitions is handled by Telescope
    },
    config = function()
      -- Rounded hover border
      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(
        vim.lsp.handlers.hover,
        {
          border = "rounded"
        }
      )
      -- Python
      vim.lsp.enable("basedpyright")
      vim.lsp.config(
        "basedpyright",
        {
          on_attach = on_attach,
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard"
              }
            }
          }
        }
      )

      -- C/C++
      vim.lsp.enable("clangd")
      vim.lsp.config(
        "clangd",
        {
          cmd = {
            "clangd",
            "-j=8",
            "--clang-tidy",
            "--background-index",
            "--all-scopes-completion",
            "--header-insertion=never",
            "--suggest-missing-includes",
            "--completion-style=detailed",
            "--query-driver=**",
            "--offset-encoding=utf-16",
            "--inlay-hints=true"
          },
          init_options = {
            clangdFileStatus = true
          },
          on_attach = on_attach
        }
      )

      -- Cmake
      vim.lsp.enable("cmake")
      vim.lsp.config(
        "cmake",
        {
          on_attach = on_attach
        }
      )

      -- Rust
      vim.lsp.enable("rust_analyzer")
      vim.lsp.config(
        "rust_analyzer",
        {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy"
              }
            }
          },
          on_attach = on_attach
        }
      )

      -- Tex
      vim.lsp.enable("texlab")

      -- Harper
      vim.lsp.enable("harper_ls")
      vim.lsp.config(
        "harper_ls",
        {
          filetypes = {"markdown"}
        }
      )
      -- Lua
      vim.lsp.enable("lua_ls")

      -- Starlark
      vim.lsp.enable("starlark_rust")

      -- Severity Signs
      vim.diagnostic.config(
        {
          signs = {
            active = true,
            text = {
              [vim.diagnostic.severity.ERROR] = "", -- e.g., Fa-times-circle
              [vim.diagnostic.severity.WARN] = "", -- e.g., Fa-exclamation-triangle
              [vim.diagnostic.severity.INFO] = "", -- e.g., Fa-info-circle
              [vim.diagnostic.severity.HINT] = "󰋼" -- e.g., Fa-lightbulb
            }
          }
        }
      )
    end
  }
}
