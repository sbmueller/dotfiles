return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    opts = {
      options = {
        numbers = "buffer_id",
        max_name_length = 36,
        max_prefix_length = 16,
        tab_size = 22,
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant"
      },
      highlights = {
        buffer_selected = {
          italic = true
        }
      }
    }
  }
}
