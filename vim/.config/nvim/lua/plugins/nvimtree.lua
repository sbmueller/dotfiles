-- Sidebar file explorer.
-- oil.nvim is also configured for buffer-style filesystem editing (invoked
-- explicitly via :Oil).
return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
    },
    opts = {
      sync_root_with_cwd = true,
      update_focused_file = { enable = true },
      view = { width = 60 },
      renderer = {
        icons = { webdev_colors = true },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 2000,
      },
      actions = {
        open_file = { quit_on_open = true },
      },
    },
  },
}
