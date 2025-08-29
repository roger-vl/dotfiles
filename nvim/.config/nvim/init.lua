require("config.lazy")

local setHl = vim.api.nvim_set_hl
local oc = require("colors")
local base_statusline_highlights =
  { "StatusLine", "StatusLineNC", "Tabline", "TabLineFill", "TabLineSel", "Winbar", "WinbarNC" }

for _, hl_group in pairs(base_statusline_highlights) do
  setHl(0, hl_group, { bg = "none" })
end

setHl(0, "Diffadded", {
  fg = oc.palette.Method,
  bg = "NONE",
})

setHl(0, "Diffchanged", {
  fg = oc.palette.Enum,
  bg = "NONE",
})

setHl(0, "Diffremoved", {
  fg = oc.palette.Keywords,
  bg = "NONE",
})

setHl(0, "WinSeparator", { fg = oc.overrides.base })
setHl(0, "lualine_buff_active", { fg = oc.overrides.overlay1 })
