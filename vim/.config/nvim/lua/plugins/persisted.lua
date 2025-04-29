return {
  {
    "olimorris/persisted.nvim",
    cmd = {"SessionLoad", "SessionSave", "Telescope persisted"},
    config = function()
      require("telescope").load_extension("persisted")
      require("persisted").setup {
        use_git_branch = true, -- Include the git branch in the session file name?
        autoload = true -- Automatically load the session for the cwd on Neovim startup?
      }
      vim.o.sessionoptions = "buffers,curdir,globals"
    end
  }
}
