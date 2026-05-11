return {
  {
    "olimorris/persisted.nvim",
    -- Lazy-load on demand. Sessions are only loaded explicitly from the
    -- dashboard (key `j`, see plugins/dashboard.lua) or via :SessionLoad /
    -- :Telescope persisted.
    cmd = { "SessionLoad", "SessionSave", "SessionStart", "SessionStop", "SessionDelete" },
    event = "VeryLazy", -- still needs to load eventually so autosave-on-exit works
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("persisted").setup({
        use_git_branch = true, -- Include the git branch in the session file name
        autoload = false, -- Never autoload; restore explicitly from the dashboard
      })
      vim.o.sessionoptions = "buffers,curdir,globals"

      -- Loading the extension forces telescope to be available, which is fine
      -- since we declare telescope as a dependency above.
      pcall(require("telescope").load_extension, "persisted")
    end,
  },
}
