local ownColors = require("colors")

return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("scrollbar").setup({
        folds = 10,
        throttle_ms = 0,
        handle = {
          text = " ",
          blend = 90, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
          color = nil,
          color_nr = nil,
          highlight = "CursorColumn",
          hide_if_all_visible = true, -- Hides handle if all lines are visible
        },
        marks = {
          Cursor = { text = "", color = ownColors.palette.VariableT },
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
          GitAdd = { text = "" },
          GitChange = { text = "" },
          GitDelete = { text = "" },
        },
        handlers = {
          cursor = true,
          diagnostic = true,
          gitsigns = true,
          handle = false,
          search = false,
          ale = false,
        },
      })
    end,
  },
}
