local count = 0
local references = {}
local getId = function()
  if count == 7 then
    count = 0
    return count
  end
  count = count + 1
  return count
end

local getGroup = function(token, text)
  if token.modifiers.readonly and text ~= "nil" then
    return
  end
  if text == "nil" then
    return "C_key"
  end
  if text == "err" or text == "nil" then
    return "C_err"
  end
  local first = string.sub(text, 1, 1)
  if string.match(first, "%u") then
    return
  end
  local id = references[text]
  if id == nil then
    id = "C_var" .. getId()
    references[text] = id
  end
  return id
end

local color = require("colors")

-- markdown
vim.cmd([[
  hi! VM_Mono guibg=Orange guifg=White gui=NONE
]])
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "markdown", "go", "txt" },
--   command = "setlocal nospell",
-- })

-- telescope file path
vim.api.nvim_set_hl(0, "T_tail", { fg = color.palette.Parameter })
vim.api.nvim_set_hl(0, "T_path_1", { fg = color.overrides.overlay1 })
vim.api.nvim_set_hl(0, "T_path_2", { fg = color.overrides.subtext0 })
vim.api.nvim_set_hl(0, "T_path", { fg = color.palette.Comment })

-- semantic color lsp
vim.api.nvim_set_hl(0, "C_Var", { fg = color.palette.VariableT })
vim.api.nvim_set_hl(0, "C_Interface", { fg = color.palette.Interface })
vim.api.nvim_set_hl(0, "C_Param", { fg = color.palette.Parameter })
vim.api.nvim_set_hl(0, "C_Constants", { fg = color.palette.Enum })
vim.api.nvim_set_hl(0, "C_Method", { fg = color.palette.Method })
vim.api.nvim_set_hl(0, "C_type", { fg = color.palette.Class })
vim.api.nvim_set_hl(0, "C_Modules", { fg = color.palette.Package, italic = false })
vim.api.nvim_set_hl(0, "C_err", { fg = color.palette.C_err })
vim.api.nvim_set_hl(0, "C_var0", { fg = color.palette.C_var0 })
vim.api.nvim_set_hl(0, "C_var1", { fg = color.palette.C_var1 })
vim.api.nvim_set_hl(0, "C_var2", { fg = color.palette.C_var2 })
vim.api.nvim_set_hl(0, "C_var3", { fg = color.palette.C_var3 })
vim.api.nvim_set_hl(0, "C_var4", { fg = color.palette.C_var4 })
vim.api.nvim_set_hl(0, "C_var5", { fg = color.palette.C_var5 })
vim.api.nvim_set_hl(0, "C_var6", { fg = color.palette.C_var6 })
vim.api.nvim_set_hl(0, "C_var7", { fg = color.palette.C_var7 })
vim.api.nvim_set_hl(0, "C_var8", { fg = color.palette.C_var8 })
vim.api.nvim_set_hl(0, "C_key", { fg = color.palette.Keywords })
vim.api.nvim_set_hl(0, "Operator", { fg = "#A9B7C6" })

vim.highlight.priorities.semantic_tokens = 90 -- Or any number lower than 100, treesitter's priority level
local addHighlightToken = function(token, args, group)
  vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, group, { priority = 101 })
end

-- color autocmd semantic token
vim.api.nvim_create_autocmd("LspTokenUpdate", {
  callback = function(args)
    local token = args.data.token
    if
      (token.type == "variable" or token.type == "class")
      and token.modifiers.readonly
      and not token.modifiers.defaultLibrary
    then
      addHighlightToken(token, args, "C_Constants")
    end
    if token.type.type then
      addHighlightToken(token, args, "C_Definitions")
    end
    if token.type == "function" or token.type == "method" then
      addHighlightToken(token, args, "C_Method")
    end
    if
      (token.type == "type" and (token.modifiers.struct or token.modifiers.defaultLibrary))
      and not token.modifiers.readonly
      and not token.modifiers.interface
    then
      addHighlightToken(token, args, "C_Type")
    end
    if token.type == "namespace" then
      addHighlightToken(token, args, "C_Modules")
      vim.api.nvim_set_hl(0, "@property", { fg = color.palette.VariableMember })
      vim.api.nvim_set_hl(0, "@variable.member", { fg = color.palette.VariableMember })
    end
    if token.type == "variable" then
      local text = vim.api.nvim_buf_get_text(args.buf, token.line, token.start_col, token.line, token.end_col, {})[1]
      addHighlightToken(token, args, getGroup(token, text))
      -- addHighlightToken(token, args, 'C_Var')
    end
    if token.type == "parameter" then
      addHighlightToken(token, args, "C_Param")
    end
    if token.type == "type" and token.modifiers.interface then
      addHighlightToken(token, args, "C_Interface")
    end
  end,
})
