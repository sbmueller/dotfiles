return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    lazy = true,
    event = "LspAttach", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup(
        {
          options = {
            -- Format the diagnostic message.
            -- Example:
            -- format = function(diagnostic)
            --     return diagnostic.message .. " [" .. diagnostic.source .. "]"
            -- end,
            format = function(diagnostic)
              return diagnostic.message .. " [" .. diagnostic.code .. "]"
            end
          }
        }
      )
      vim.diagnostic.config(
        {
          virtual_text = false
        }
      )
    end
  }
}
