local obsidian = require "obsidian"
obsidian.setup(
  {
    -- Required, the path to your vault directory.
    dir = "~/notes",
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "Journal"
    },
    -- Optional, completion.
    completion = {
      -- If using nvim-cmp, otherwise set to false
      nvim_cmp = true,
      -- Trigger completion at 2 chars
      min_chars = 2,
      -- Where to put new notes created from completion. Valid options are
      --  * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = "current_dir",
      -- Whether to add the output of the node_id_func to new notes in autocompletion.
      -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
      prepend_note_id = true
    },
    -- Optional, key mappings.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = require("obsidian.mapping").gf_passthrough()
    },
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({"open", url}) -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,
    -- Optional, set to true if you use the Obsidian Advanced URI plugin.
    -- https://github.com/Vinzent03/obsidian-advanced-uri
    use_advanced_uri = true,
    -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
    open_app_foreground = false,
    -- Optional, by default commands like `:ObsidianSearch` will attempt to use
    -- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
    -- first one they find. By setting this option to your preferred
    -- finder you can attempt it first. Note that if the specified finder
    -- is not installed, or if it the command does not support it, the
    -- remaining finders will be attempted in the original order.
    finder = "telescope.nvim",
    -- Optional, determines whether to open notes in a horizontal split, a vertical split,
    -- or replacing the current buffer (default)
    -- Accepted values are "current", "hsplit" and "vsplit"
    open_notes_in = "current"
  }
)
