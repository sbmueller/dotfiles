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
              if
                diagnostic.code and type(diagnostic.code) ~= "function" and type(diagnostic.code) ~= "table" and
                  type(diagnostic.code) ~= "userdata"
               then
                -- Only concatenate if code is a string or number
                return diagnostic.message .. " [" .. tostring(diagnostic.code) .. "]"
              else
                return diagnostic.message
              end
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
