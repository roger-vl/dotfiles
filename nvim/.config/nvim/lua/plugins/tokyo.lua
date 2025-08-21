local ownColors = require("colors")

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    terminal_colors = true,
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_colors = function(colors)
      colors.hint = ownColors.palette.Method
    end,
    on_highlights = function(hl, c) end,
  },
}
-- some comment
