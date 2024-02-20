return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {"nvim-lua/lsp-status.nvim"},
    ft = {"python", "cpp", "c", "rust", "cmake", "tex"},
    keys = {
      {"<leader>d", vim.diagnostic.open_float, desc = "Line Diagnostics"},
      {"<leader>D", vim.diagnostic.setloclist, desc = "Buffer Diagnostics"},
      {"gD", vim.lsp.buf.declaration, desc = "Goto Declaration"},
      {"K", vim.lsp.buf.hover, desc = "Hover Documentation"},
      {"<C-k>", vim.lsp.buf.signature_help, desc = "Signature Help"},
      {"<leader>rn", vim.lsp.buf.rename, desc = "Rename Symbol"},
      {"<leader>h", vim.lsp.buf.code_action, desc = "LSP Code Action"}
      -- gr: Show References is handled by Telescope
      -- gi: Show Implementations is handled by Telescope
      -- gd: Show Definitions is handled by Telescope
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_status = require("lsp-status")
      lspconfig.pyright.setup {
        on_attach = lsp_status.on_attach,
        capabilities = lsp_status.capabilities
      }
      lspconfig.clangd.setup {
        cmd = {
          "clangd",
          "--clang-tidy",
          "--background-index",
          "--all-scopes-completion",
          "--header-insertion=iwyu",
          "--suggest-missing-includes",
          "--completion-style=detailed",
          "--inlay-hints=true"
        },
        handlers = lsp_status.extensions.clangd.setup(),
        init_options = {
          clangdFileStatus = true
        },
        on_attach = lsp_status.on_attach,
        capabilities = lsp_status.capabilities
      }
      lspconfig.cmake.setup {
        on_attach = lsp_status.on_attach,
        capabilities = lsp_status.capabilities
      }
      lspconfig.rust_analyzer.setup {
        -- Server-specific settings. See `:help lspconfig-setup`
        settings = {
          ["rust-analyzer"] = {}
        },
        on_attach = lsp_status.on_attach,
        capabilities = lsp_status.capabilities
      }

      lspconfig.texlab.setup {}
      -- Severity Signs
      local signs = {Error = "", Warn = "", Hint = "", Info = "󰋼"}
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
      end
    end
  }
}
