require("config.lazy")
local base_statusline_highlights =
  { "StatusLine", "StatusLineNC", "Tabline", "TabLineFill", "TabLineSel", "Winbar", "WinbarNC" }
for _, hl_group in pairs(base_statusline_highlights) do
  vim.api.nvim_set_hl(0, hl_group, { bg = "none" })
end
