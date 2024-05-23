local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
  else
    vim.lsp.inlay_hint.enable(false, {bufnr = bufnr})
  end
  require("lsp-status").on_attach(client, bufnr)
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {"nvim-lua/lsp-status.nvim"},
    ft = {"python", "cpp", "c", "rust", "cmake", "tex", "lua"},
    keys = {
      {"<leader>d", vim.diagnostic.open_float, desc = "Line Diagnostics"},
      {"<leader>D", vim.diagnostic.setloclist, desc = "Buffer Diagnostics"},
      {"gD", vim.lsp.buf.declaration, desc = "Goto Declaration"},
      {"K", vim.lsp.buf.hover, desc = "Hover Documentation"},
      {"<leader>rn", vim.lsp.buf.rename, desc = "Rename Symbol"},
      {"<leader>h", vim.lsp.buf.code_action, desc = "LSP Code Action"}
      -- gr: Show References is handled by Telescope
      -- gi: Show Implementations is handled by Telescope
      -- gd: Show Definitions is handled by Telescope
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_status = require("lsp-status")

      -- Python
      lspconfig.basedpyright.setup {
        on_attach = on_attach,
        capabilities = lsp_status.capabilities
      }

      -- C/C++
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

      -- Lua
      lspconfig.lua_ls.setup {}

      -- Severity Signs
      local signs = {Error = "", Warn = "", Hint = "", Info = "󰋼"}
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
      end
    end
  }
}
