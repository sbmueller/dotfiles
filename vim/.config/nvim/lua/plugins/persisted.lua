return {
  {
    "olimorris/persisted.nvim",
    -- Load eagerly so:
    --   1. the `:Persisted` user command and the telescope `persisted`
    --      extension are both registered before the dashboard renders, so
    --      pressing `j` on the dashboard reliably opens the picker.
    --   2. persisted's own autostart/autosave hooks (registered in setup) are
    --      live when nvim exits.
    -- The plugin is tiny; the eager load is negligible.
    lazy = false,
    priority = 50,
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- Persisted v2+ exposes a single `:Persisted` user command with
    -- subcommands (load, save, select, delete, ...). The old SessionLoad /
    -- SessionSave / SessionStart / SessionStop commands no longer exist.
    cmd = "Persisted",
    config = function()
      require("persisted").setup({
        use_git_branch = true,
        autoload = false, -- Sessions are restored explicitly from the dashboard
      })
      vim.o.sessionoptions = "buffers,curdir,globals"

      -- Register the Telescope picker so `:Telescope persisted` works from
      -- the dashboard. Telescope is declared as a dependency above.
      pcall(require("telescope").load_extension, "persisted")
    end,
  },
}
