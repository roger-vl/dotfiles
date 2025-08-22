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
    on_highlights = function(hl, c)
      hl.TSKeyword = { fg = ownColors.palette.Keywords }
      hl["@keyword"] = { link = "TSKeyword" }
      hl["@keyword.function"] = { link = "TSKeyword" }
      hl["@keyword.operator"] = { link = "TSKeyword" }
      hl["@keyword.return"] = { link = "TSKeyword" }
      hl["@keyword.conditional"] = { link = "TSKeyword" }
      hl["@lsp.type.keyword"] = { link = "TSKeyword" }
      hl["@conditional"] = { link = "TSKeyword" }

      hl.TSProperty = { fg = ownColors.palette.VariableMember }
      hl["@property"] = { link = "TSProperty" }
      hl["@variable.member"] = { link = "TSProperty" }

      hl.TSString = { fg = ownColors.palette.String }
      hl["@string"] = { link = "TSString" }
      hl["@lsp.type.string"] = { link = "TSString" }
      hl["@text.literal"] = { link = "TSString" }

      hl.TSFunction = { fg = ownColors.palette.Method }
      hl["@function"] = { link = "TSFunction" }
      hl["@function.call"] = { link = "TSFunction" }
      hl["@lsp.type.function"] = { link = "TSFunction" }
      hl["@method"] = { link = "TSFunction" }

      hl.TSDefaul = { fg = ownColors.palette.Default }
      hl["@punctuation.bracket"] = { link = "TSDefaul" }
      hl["@punctuation.delimeter"] = { link = "TSDefaul" }
      hl["@constructor"] = { link = "TSDefaul" }
      hl["@operator"] = { link = "TSDefaul" }

      hl.TSParameter = { fg = ownColors.palette.Parameter }
      hl["@lsp.type.parameter"] = { link = "TSParameter" }

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
