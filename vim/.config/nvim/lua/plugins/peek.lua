-- Browser-based live preview for Markdown.
-- Replaced iamcco/markdown-preview.nvim (npm install was fragile).
--
-- Requires `deno` on PATH (https://deno.land). On macOS:  brew install deno
-- markview.nvim handles in-buffer rendering separately.
--
-- Usage: :PeekOpen / :PeekClose

return {
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    cmd = { "PeekOpen", "PeekClose" },
    ft = { "markdown" },
    config = function()
      require("peek").setup({
        auto_load = true,
        close_on_bdelete = true,
        syntax = true,
        theme = "dark",
        update_on_change = true,
        app = "browser",
      })
      vim.api.nvim_create_user_command("PeekOpen", function()
        require("peek").open()
      end, {})
      vim.api.nvim_create_user_command("PeekClose", function()
        require("peek").close()
      end, {})
    end,
  },
}
