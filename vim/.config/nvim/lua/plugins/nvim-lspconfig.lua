return {
  {
    "neovim/nvim-lspconfig",
    -- On Neovim 0.11+, nvim-lspconfig is mostly a config repository for
    -- vim.lsp.config(); loading it on the first real file is enough.
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "saghen/blink.cmp" },
    config = function()
      -- Compose default LSP capabilities with blink.cmp's contributions so
      -- servers know what completion features the client supports.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_blink, blink = pcall(require, "blink.cmp")
      if ok_blink then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end
      capabilities = vim.tbl_deep_extend("force", capabilities, {
        textDocument = {
          semanticTokens = {
            multilineTokenSupport = true,
          },
        },
      })

      -- Apply globally to all servers
      vim.lsp.config("*", { capabilities = capabilities })

      -- Python: basedpyright (typing handled by ty)
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

      -- C/C++: clangd
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

      -- CMake
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

      -- TeX
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
    end,
  },
}
