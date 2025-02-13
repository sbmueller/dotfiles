return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      {"<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree"}
    },
    opts = {
      view = {
        width = 60
      },
      renderer = {
        icons = {
          webdev_colors = true
        }
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = ""
        }
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 2000
      },
      actions = {
        open_file = {
          quit_on_open = true
        }
      }
    }
  }
}
