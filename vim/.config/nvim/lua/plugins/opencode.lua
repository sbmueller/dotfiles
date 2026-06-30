return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    -- snacks.nvim is configured at top-level in plugins/dashboard.lua; here we
    -- just contribute opts (Lazy merges them). No `optional = true` is needed
    -- because dashboard.lua now declares snacks as a first-class spec.
    dependencies = {
      {
        "folke/snacks.nvim",
        ---@module "snacks"
        ---@type snacks.Config
        opts = {
          input = {}, -- Enhances `ask()`
          picker = {
            -- Enhances `select()`
            actions = {
              opencode_send = function(...)
                return require("opencode").snacks_picker_send(...)
              end,
            },
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
    },
    keys = {
      {
        "<Leader>o",
        function()
          require("opencode").toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle opencode",
      },
    },
    init = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {}
      vim.o.autoread = true -- required for opts.events.reload

      -- Inject tokens from keyring
      local function keyring_get(service, key)
        local handle = io.popen("keyring get " .. service .. " " .. key .. " 2>/dev/null")
        if not handle then return nil end
        local value = handle:read("*l")
        handle:close()
        return value ~= "" and value or nil
      end

      local gh_token = keyring_get("tokens", "github_token")
      local atl_token = keyring_get("tokens", "atlassian_token")
      if gh_token then vim.env.GH_TOKEN = gh_token end
      if atl_token then vim.env.ATL_TOKEN = atl_token end
    end,
  },
}
