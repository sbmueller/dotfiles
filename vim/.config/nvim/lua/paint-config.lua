require("paint").setup(
  {
    ---@type PaintHighlight[]
    highlights = {
      {
        -- filter can be a table of buffer options that should match,
        -- or a function called with buf as param that should return true.
        -- The example below will paint @something in comments with Constant
        filter = {filetype = "cpp"},
        pattern = "([@\\]%w+)",
        hl = "Constant"
      }
    }
  }
)