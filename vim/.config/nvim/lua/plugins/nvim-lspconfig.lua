-- Enabler for inlay hints
local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  else
    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
  end
  require("lsp-status").on_attach(client, bufnr)
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "nvim-lua/lsp-status.nvim" },
    ft = { "python", "cpp", "c", "rust", "cmake", "tex", "lua", "markdown" },
    keys = {
      { "<leader>d",  vim.diagnostic.open_float, desc = "Line Diagnostics" },
      { "<leader>D",  vim.diagnostic.setloclist, desc = "Buffer Diagnostics" },
      { "gD",         vim.lsp.buf.declaration,   desc = "Goto Declaration" },
      { "K",          vim.lsp.buf.hover,         desc = "Hover Documentation" },
      { "<leader>rn", vim.lsp.buf.rename,        desc = "Rename Symbol" },
      { "<leader>h",  vim.lsp.buf.code_action,   desc = "LSP Code Action" }
      -- gr: Show References is handled by Telescope
      -- gi: Show Implementations is handled by Telescope
      -- gd: Show Definitions is handled by Telescope
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_status = require("lsp-status")
      local cmp = require("cmp_nvim_lsp")
      -- Rounded hover border
      vim.lsp.handlers["textDocument/hover"] =
          vim.lsp.with(
            vim.lsp.handlers.hover,
            {
              border = "rounded"
            }
          )
      -- Python
      lspconfig.basedpyright.setup {
        on_attach = on_attach,
        capabilities = lsp_status.capabilities,
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard"
            }
          }
        }
      }

      -- C/C++
      lspconfig.clangd.setup {
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
        handlers = lsp_status.extensions.clangd.setup(),
        init_options = {
          clangdFileStatus = true
        },
        on_attach = on_attach,
        capabilities = lsp_status.capabilities
      }

      -- Cmake
      lspconfig.cmake.setup {
        on_attach = on_attach,
        capabilities = lsp_status.capabilities
      }

      -- Rust
      lspconfig.rust_analyzer.setup {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy"
            }
          }
        },
        on_attach = on_attach,
        capabilities = lsp_status.capabilities
      }

      -- Tex
      lspconfig.texlab.setup {}

      -- Harper
      -- lspconfig.harper_ls.setup {}
      -- Lua
      lspconfig.lua_ls.setup {}

      -- Severity Signs
      local signs = { Error = "", Warn = "", Hint = "", Info = "󰋼" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end
  }
}
