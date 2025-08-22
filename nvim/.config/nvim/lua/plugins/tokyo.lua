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
      colors.hint = ownColors.palette.Doc
    end,
    on_highlights = function(hl, _)
      hl["@lsp.typemod.type.defaultLibrary"] = { link = "@lsp" }
      hl["@lsp.type.typeParameter"] = { link = "@lsp" }
      hl["@lsp.type.type"] = { link = "@lsp" }
      hl["@lsp.typemod.type.string"] = { link = "@lsp" }
      hl["@lsp.type.string"] = { link = "@lsp" }

      hl["@variable"] = { fg = ownColors.palette.VariableT }
      hl["@number"] = { fg = ownColors.palette.Number }
      hl["@number.float"] = { fg = ownColors.palette.Number }
      hl["@character.printf"] = { fg = ownColors.palette.VariableMember }
      hl["@lsp.typemod.type.interface"] = { fg = ownColors.palette.Interface }
      hl["@lsp.typemod.type.struct"] = { fg = ownColors.palette.Class }
      hl["@lsp.mod.readonly"] = { fg = ownColors.palette.Enum }

      hl.Type = { fg = ownColors.palette.BuiltInType }
      hl["@type.builtin"] = { fg = ownColors.palette.BuiltInType }
      hl.TSModule = { fg = ownColors.palette.Package }
      hl["@module"] = { link = "TSModule" }
      hl["@module.variable"] = { link = "TSModule" }

      hl.TSKeyword = { fg = ownColors.palette.Keywords, bold = true }
      hl["@keyword"] = { link = "TSKeyword" }
      hl["@keyword.function"] = { link = "TSKeyword" }
      hl["@keyword.operator"] = { link = "TSKeyword" }
      hl["@keyword.return"] = { link = "TSKeyword" }
      hl["@keyword.conditional"] = { link = "TSKeyword" }
      hl["@keyword.import"] = { link = "TSKeyword" }
      hl["@keyword.type"] = { link = "TSKeyword" }
      hl["@keyword.repeat"] = { link = "TSKeyword" }
      hl["@conditional"] = { link = "TSKeyword" }
      hl["@custom.bool"] = { link = "TSKeyword" }
      hl["@custom.nil"] = { link = "TSKeyword" }

      hl.TSProperty = { fg = ownColors.palette.VariableMember }
      hl["@property"] = { link = "TSProperty" }
      hl["@variable.member"] = { link = "TSProperty" }

      hl.TSString = { fg = ownColors.palette.String }
      hl["@string"] = { link = "TSString" }
      hl["@text.literal"] = { link = "TSString" }

      hl.TSFunction = { fg = ownColors.palette.Method }
      hl.Function = { link = "TSFunction" }
      hl["@function"] = { link = "TSFunction" }
      hl["@function.call"] = { link = "TSFunction" }
      hl["@function.method.call"] = { link = "TSFunction" }
      hl["@function.builtin"] = { link = "TSFunction" }
      hl["@method"] = { link = "TSFunction" }

      hl.TSDefaul = { fg = ownColors.palette.Default }
      hl["@punctuation.bracket"] = { link = "TSDefaul" }
      hl["@punctuation.delimeter"] = { link = "TSDefaul" }
      hl["@constructor"] = { link = "TSDefaul" }
      hl["@operator"] = { link = "TSDefaul" }

      hl.TSParameter = { fg = ownColors.palette.Parameter }
      hl["@variable.parameter"] = { link = "TSParameter" }

      hl.FloatBorder = {
        fg = ownColors.palette.Border,
      }
      hl.CursorLine = {
        bg = ownColors.overrides.surface0,
      }
      hl.Comment = {
        fg = ownColors.palette.Comment,
        italic = true,
      }
    end,
  },
}
-- toSomeMore comment
