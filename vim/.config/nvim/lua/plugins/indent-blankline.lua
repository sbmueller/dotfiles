return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ft = { "cpp", "c", "python", "json", "yaml", "lua", "tex" },
    opts = {
      exclude = { filetypes = { "dashboard", "snacks_dashboard" } },
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },
}
