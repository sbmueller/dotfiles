return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000, -- needs to be loaded before competing virtual_text providers
    opts = {
      options = {
        format = function(diagnostic)
          local code = diagnostic.code
          local code_t = type(code)
          if code and code_t ~= "function" and code_t ~= "table" and code_t ~= "userdata" then
            return diagnostic.message .. " [" .. tostring(code) .. "]"
          end
          return diagnostic.message
        end,
      },
    },
    -- vim.diagnostic.config({ virtual_text = false }) is set centrally in
    -- lua/config/diagnostics.lua so the truth lives in one place.
  },
}
