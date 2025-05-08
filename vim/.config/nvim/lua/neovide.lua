vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_cursor_animate_in_insert_mode = true

-- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_opacity = 0.9
vim.g.neovide_window_blurred = true
-- Set a background color even for transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "#1b182c" }) -- Set your desired transparent color here
