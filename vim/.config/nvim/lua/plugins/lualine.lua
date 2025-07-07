return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {"nvim-lua/lsp-status.nvim", "mfussenegger/nvim-lint"},
    config = function()
      -- Linting progress helper function
      local function lint_progress()
        local linters = require("lint").get_running()
        if #linters == 0 then
          return "󰦕"
        end
        return "󱉶 " .. table.concat(linters, ", ")
      end
      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = {left = "|", right = "|"},
          section_separators = {left = "", right = ""},
          disabled_filetypes = {},
          always_divide_middle = true
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch", "diff"},
          lualine_c = {"filename"},
          lualine_x = {
            "encoding",
            "fileformat",
            "filetype",
            -- {"diagnostics", sources = {"nvim_diagnostic"}},
            lint_progress,
            "require'lsp-status'.status()"
          },
          lualine_y = {"progress"},
          lualine_z = {"location"}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {"filename"},
          lualine_x = {"location"},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      }
    end
  }
}
