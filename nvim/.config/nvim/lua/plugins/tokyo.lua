local oc = require("colors")

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
      colors.fg_gutter = oc.overrides.surface2
    end,

    on_highlights = function(hl, _)
      hl["@lsp.typemod.type.defaultLibrary"] = { link = "@lsp" }
      hl["@lsp.type.typeParameter"] = { link = "@lsp" }
      hl["@lsp.type.type"] = { link = "@lsp" }
      hl["@lsp.typemod.type.string"] = { link = "@lsp" }
      hl["@lsp.type.string"] = { link = "@lsp" }

      hl["@variable"] = { fg = oc.palette.VariableT }
      hl["@number"] = { fg = oc.palette.Number }
      hl["@number.float"] = { fg = oc.palette.Number }
      hl["@character.printf"] = { fg = oc.palette.VariableMember }
      hl["@lsp.typemod.type.interface"] = { fg = oc.palette.Interface }
      hl["@lsp.typemod.type.struct"] = { fg = oc.palette.Class }
      hl["@lsp.mod.readonly"] = { fg = oc.palette.Enum }

      hl.Type = { fg = oc.palette.BuiltInType }
      hl["@type.builtin"] = { fg = oc.palette.BuiltInType }
      hl.TSModule = { fg = oc.palette.Package }
      hl["@module"] = { link = "TSModule" }
      hl["@module.variable"] = { link = "TSModule" }

      hl.TSKeyword = { fg = oc.palette.Keywords, bold = true }
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

      hl.TSProperty = { fg = oc.palette.VariableMember }
      hl["@property"] = { link = "TSProperty" }
      hl["@variable.member"] = { link = "TSProperty" }

      hl.TSString = { fg = oc.palette.String }
      hl["@string"] = { link = "TSString" }
      hl["@text.literal"] = { link = "TSString" }

      hl.TSFunction = { fg = oc.palette.Method }
      hl.Function = { link = "TSFunction" }
      hl["@function"] = { link = "TSFunction" }
      hl["@function.call"] = { link = "TSFunction" }
      hl["@function.method.call"] = { link = "TSFunction" }
      hl["@function.builtin"] = { link = "TSFunction" }
      hl["@method"] = { link = "TSFunction" }

      hl.TSDefaul = { fg = oc.palette.Default }
      hl["@punctuation.bracket"] = { link = "TSDefaul" }
      hl["@punctuation.delimeter"] = { link = "TSDefaul" }
      hl["@constructor"] = { link = "TSDefaul" }
      hl["@operator"] = { link = "TSDefaul" }

      hl.TSParameter = { fg = oc.palette.Parameter }
      hl["@variable.parameter"] = { link = "TSParameter" }

      hl.DiagnosticVirtualTextHint = {
        bg = oc.palette.TeleResults,
        fg = oc.overrides.pink,
      }
      hl.DiagnosticVirtualTextError = {
        bg = oc.palette.TeleResults,
        fg = oc.overrides.red,
      }
      hl.DiagnosticVirtualTextInfo = {
        bg = oc.palette.TeleResults,
        fg = oc.overrides.surface1,
      }
      hl.DiagnosticVirtualTextWarn = {
        bg = oc.palette.TeleResults,
        fg = oc.overrides.peach,
      }

      hl.SnacksIndent = {
        fg = oc.palette.Border,
        nocombine = true,
      }
      hl.SnacksIndentScope = {
        fg = "#7F7F7F",
        nocombine = true,
      }
      hl.CursorLineNr = {
        bold = true,
        fg = "#FACB81",
      }
      hl.Comment = {
        fg = oc.palette.Comment,
        italic = true,
      }

      hl.FloatBorder.fg = oc.palette.Border
      hl.CursorLine.bg = oc.overrides.surface0
      hl.SnacksDashboardDesc.fg = oc.overrides.subtext0
      hl.SnacksDashboardIcon.fg = oc.overrides.peach
      hl.SnacksDashboardFooter.fg = oc.overrides.yellow
      hl.SnacksDashboardHeader.fg = oc.overrides.surface2
      hl.SnacksDashboardSpecial.fg = oc.overrides.lavender

      hl.SnacksPickerListCursorLine = { bg = oc.palette.Border }
      hl.SnacksPickerDir = { fg = oc.palette.Comment }
      hl.SnacksPickerFile = { fg = "#B2A496" }
      hl.SnacksPickerMatch = { fg = oc.palette.Keywords }

      hl.SnacksPickerPreviewTitle = { fg = oc.overrides.flamingo }
      hl.WhichKeyDesc.fg = "#D8A083"
      hl.WhichKeyGroup.fg = "#E9916D"
      hl.WhichKey.fg = "#FACB81"
      hl.WhichKeySeparator.fg = "#DF784E"

      hl.NoiceCmdlinePopupBorder = { fg = oc.palette.Border }
      hl.NoiceCmdlinePopupBorderLua = { fg = oc.palette.Border }
      hl.NoiceCmdlineIcon = { fg = oc.overrides.flamingo }

      hl.SnacksNotifierWarn = {
        fg = oc.overrides.peach,
      }

      hl.SnacksNotifierBorderWarn = {
        fg = oc.overrides.overlay2,
      }

      hl.SnacksNotifierFooterWarn = {
        fg = oc.overrides.overlay2,
      }

      hl.SnacksNotifierInfo = {
        fg = oc.overrides.overlay2,
      }

      hl.SnacksNotifierTrace = {
        fg = oc.overrides.overlay2,
      }

      hl.SnacksNotifierDebug = {
        fg = oc.overrides.overlay2,
      }

      hl.SnacksNotifierHistory = {
        fg = oc.overrides.overlay2,
      }

      hl.SnacksNotifierHistoryDateTime = {
        fg = oc.overrides.overlay2,
      }

      hl.NotifyBackground = {
        bg = "NONE",
        fg = oc.overrides.overlay2,
      }

      hl.NotifyWARNTitle = {
        bg = "NONE",
        fg = oc.overrides.overlay2,
      }
    end,
  },
}
