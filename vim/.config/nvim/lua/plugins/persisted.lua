return {
  {
    "olimorris/persisted.nvim",
    lazy = false,
    priority = 50,
    cmd = "Persisted",
    config = function()
      require("persisted").setup({
        use_git_branch = true,
        autoload = false,
      })
      vim.o.sessionoptions = "buffers,curdir,globals"
    end,
  },
}
