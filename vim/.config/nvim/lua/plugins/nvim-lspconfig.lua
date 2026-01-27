return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    ft = { "python", "cpp", "c", "rust", "cmake", "tex", "lua", "markdown", "bzl" },
    keys = {
      { "<leader>d", vim.diagnostic.open_float, desc = "Line Diagnostics" },
      { "<leader>D", vim.diagnostic.setloclist, desc = "Buffer Diagnostics" },
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, desc = "Hover Documentation" },
      { "<leader>rn", vim.lsp.buf.rename, desc = "Rename Symbol" },
      { "<leader>h", vim.lsp.buf.code_action, desc = "LSP Code Action" },
      -- gr: Show References is handled by Telescope
      -- gi: Show Implementations is handled by Telescope
      -- gd: Show Definitions is handled by Telescope
    },
    config = function()
      -- Global LSP config (applies to all servers)
      vim.lsp.config("*", {
        capabilities = {
          textDocument = {
            semanticTokens = {
              multilineTokenSupport = true,
            },
          },
        },
      })

      -- Python
      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "off", -- handled by ty
            },
          },
        },
      })
      vim.lsp.enable("basedpyright")
      vim.lsp.enable("ty")

      -- C/C++
      vim.lsp.config("clangd", {
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
          "--inlay-hints=true",
        },
        init_options = {
          clangdFileStatus = true,
        },
      })
      vim.lsp.enable("clangd")

      -- Cmake
      vim.lsp.enable("cmake")

      -- Rust
      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      })
      vim.lsp.enable("rust_analyzer")

      -- Tex
      vim.lsp.enable("texlab")

      -- Harper (markdown grammar checker)
      vim.lsp.config("harper_ls", {
        filetypes = { "markdown" },
      })
      vim.lsp.enable("harper_ls")

      -- Lua
      vim.lsp.enable("lua_ls")

      -- Starlark
      vim.lsp.enable("starlark_rust")

      -- Diagnostic signs
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰋼",
          },
        },
      })
    end,
  },
}
