return {
  {
    "ray-x/navigator.lua",
    event = "LspAttach",
    ft = {"cpp", "c", "rust", "python"},
    dependencies = {
      {"ray-x/guihua.lua", build = "cd lua/fzy && make"},
      {"neovim/nvim-lspconfig"},
      {"nvim-lua/lsp-status.nvim"}
    },
    config = function()
      local lsp_status = require("lsp-status")
      require "navigator".setup(
        {
          default_mapping = false, -- set to false if you will remap every key
          keymaps = {
            {key = "gr", func = require("navigator.reference").async_ref, desc = "async_ref"},
            {mode = "i", key = "<M-k>", func = vim.lsp.signature_help, desc = "signature_help"},
            {key = "<c-k>", func = vim.lsp.buf.signature_help, desc = "signature_help"},
            {key = "g0", func = require("navigator.symbols").document_symbols, desc = "document_symbols"},
            {key = "<c-]>", func = require("navigator.definition").definition, desc = "definition"},
            {key = "gd", func = require("navigator.definition").definition, desc = "definition"},
            {key = "gD", func = vim.lsp.buf.declaration, desc = "declaration"},
            {key = "gp", func = require("navigator.definition").definition_preview, desc = "definition_preview"},
            {key = "K", func = vim.lsp.buf.hover, desc = "hover"},
            {key = "<Leader>h", mode = "n", func = require("navigator.codeAction").code_action, desc = "code_action"},
            {key = "<Leader>rn", func = require("navigator.rename").rename, desc = "rename"},
            {key = "gi", func = vim.lsp.buf.implementation, desc = "implementation"},
            --{ key = '<Space>D', func = vim.lsp.buf.type_definition, desc = 'type_definition' },
            {key = "<Leader>d", func = require("navigator.diagnostics").show_diagnostics, desc = "show_diagnostics"},
            {
              key = "<Leader>D",
              func = require("navigator.diagnostics").show_buf_diagnostics,
              desc = "show_buf_diagnostics"
            },
            {
              key = "<Leader>dt",
              func = require("navigator.diagnostics").toggle_diagnostics,
              desc = "toggle_diagnostics"
            },
            {key = "]d", func = vim.diagnostic.goto_next, desc = "next diagnostics"},
            {key = "[d", func = vim.diagnostic.goto_prev, desc = "prev diagnostics"},
            {key = "]O", func = vim.diagnostic.set_loclist, desc = "diagnostics set loclist"},
            {key = "]r", func = require("navigator.treesitter").goto_next_usage, desc = "goto_next_usage"},
            {key = "[r", func = require("navigator.treesitter").goto_previous_usage, desc = "goto_previous_usage"},
            {key = "<C-LeftMouse>", func = vim.lsp.buf.definition, desc = "definition"},
            {key = "g<LeftMouse>", func = vim.lsp.buf.implementation, desc = "implementation"},
            {key = "<Leader>k", func = require("navigator.dochighlight").hi_symbol, desc = "hi_symbol"}
            --{key = "<Space>wa", func = require("navigator.workspace").add_workspace_folder, desc = "add_workspace_folder"},
            --{
            --key = "<Space>wr",
            --func = require("navigator.workspace").remove_workspace_folder,
            --desc = "remove_workspace_folder"
            --},
            --{key = "<Space>ff", func = vim.lsp.buf.format, mode = "n", desc = "format"},
            --{key = "<Space>ff", func = vim.lsp.buf.range_formatting, mode = "v", desc = "range format"},
            --{key = "<Space>rf", func = require("navigator.formatting").range_format, mode = "n", desc = "range_fmt_v"},
            --{key = "<Space>wl", func = require("navigator.workspace").list_workspace_folders, desc = "list_workspace_folders"},
            -- {key = "<Space>la", mode = "n", func = require("navigator.codelens").run_action, desc = "run code lens action"}
          },
          lsp = {
            servers = {"cmake"},
            hover = false,
            format_on_save = false, -- done by other plugin
            document_highlight = false,
            display_diagnostic_qf = false,
            diagnostic = {
              virtual_text = false -- disabled because of lsp_lines
            },
            clangd = {
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
            },
            --disable_lsp = {"pyright"},
            pyright = {
              on_attach = lsp_status.on_attach,
              capabilities = lsp_status.capabilities,
              flags = {allow_incremental_sync = true, debounce_text_changes = 500},
              settings = {
                python = {
                  formatting = {provider = "black"},
                  analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "workspace"
                  }
                }
              }
            },
            rust_analyzer = {
              on_attach = lsp_status.on_attach,
              capabilities = lsp_status.capabilities
            }
          },
          icons = {
            diagnostic_info = [[💭]],
            diagnostic_hint = [[✨]],
            diagnostic_warn = "⚠️",
            diagnostic_err = "👹"
          },
          transparency = 50,
          treesitter_analysis = true, -- treesitter variable context
          lsp_signature_help = true
        }
      )
    end
  }
}
