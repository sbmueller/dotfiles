require "navigator".setup(
    {
        default_mapping = false, -- set to false if you will remap every key
        keymaps = {
            {key = "gr", func = "references()"},
            {mode = "i", key = "<M-k>", func = "signature_help()"},
            {key = "<c-k>", func = "signature_help()"},
            {key = "g0", func = "document_symbol()"},
            {key = "gW", func = "workspace_symbol()"},
            {key = "gd", func = "definition()"},
            {key = "gD", func = "declaration({ border = 'rounded', max_width = 80 })"},
            {key = "gp", func = "require('navigator.definition').definition_preview()"},
            {key = "gT", func = "require('navigator.treesitter').buf_ts()"},
            {key = "<Leader>gT", func = "require('navigator.treesitter').bufs_ts()"},
            {key = "K", func = "hover({ popup_opts = { border = single, max_width = 80 }})"},
            {key = "<Leader>h", mode = "n", func = "require('navigator.codeAction').code_action()"},
            --{key = "<Space>cA", mode = "v", func = "range_code_action()"},
            {key = "<Leader>re", func = "rename()"},
            {key = "<Leader>rn", func = "require('navigator.rename').rename()"},
            {key = "<Leader>gi", func = "incoming_calls()"},
            {key = "<Leader>go", func = "outgoing_calls()"},
            {key = "gi", func = "implementation()"},
            --{key = "<Space>D", func = "type_definition()"},
            {key = "<Leader>d", func = "require('navigator.diagnostics').show_diagnostics()"},
            {key = "<Leader>D", func = "require('navigator.diagnostics').show_buf_diagnostics()"},
            {key = "]d", func = "diagnostic.goto_next({ border = 'rounded', max_width = 80})"},
            {key = "[d", func = "diagnostic.goto_prev({ border = 'rounded', max_width = 80})"},
            {key = "]r", func = "require('navigator.treesitter').goto_next_usage()"},
            {key = "[r", func = "require('navigator.treesitter').goto_previous_usage()"},
            {key = "<C-LeftMouse>", func = "definition()"},
            {key = "g<LeftMouse>", func = "implementation()"},
            {key = "<Leader>k", func = "require('navigator.dochighlight').hi_symbol()"},
            {key = "<Leader>wa", func = "add_workspace_folder()"},
            --{key = '<Space>wr', func = 'remove_workspace_folder()'},
            --{key = '<Space>ff', func = 'formatting()', mode='n'},
            --{key = '<Space>ff', func = 'range_formatting()', mode='v'},
            {key = "<Leader>wl", func = "print(vim.inspect(vim.lsp.buf.list_workspace_folders()))"}
            --{key = "<Space>la", mode = "n", func = "require('navigator.codelens').run_action()"},},
        },
        lsp = {
            format_on_save = false,
            clangd = {
                cmd = {
                    "clangd",
                    "--clang-tidy",
                    "--background-index",
                    "--all-scopes-completion",
                    "--header-insertion=iwyu",
                    "--suggest-missing-includes",
                    "--completion-style=detailed"
                }
            }
        },
        transparency = 50
    }
)
