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

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    for _, client in ipairs(vim.lsp.get_clients()) do
      client:stop()
    end
  end,
})

-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = vim.api.nvim_create_augroup("GitsignsValidatedBase", { clear = true }),
--   pattern = "*",
--   callback = function()
--     local status_ok, gitsigns = pcall(require, "gitsigns")
--     if not status_ok then
--       return
--     end
--     -- Update gitsigns with the fallback-validated revision
--     gitsigns.change_base("origin", true)
--   end,
-- })
