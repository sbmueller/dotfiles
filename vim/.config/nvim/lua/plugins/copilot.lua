-- copilot.lua provides the Copilot client. The completion menu integration
-- happens via `fang2hou/blink-copilot` (see plugins/cmp.lua).

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      -- Inline suggestions and the floating panel are off because suggestions
      -- are surfaced through blink.cmp instead.
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
}
