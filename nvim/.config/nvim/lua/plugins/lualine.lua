local colors = {
  bg = "NONE",
  fg = "#646464",
  yellow = "#797250",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  border = "#DAB68B",
  red = "#ec5f67",
  high1 = "#E69875",
  high2 = "#ECBE7B",
  high3 = "#75848A",
  high4 = "#B0CC76",
}

local config = {
  options = {
    globalstatus = true,
    disabled_filetypes = { statusline = { "snacks_dashboard", "alpha", "starter" } },
    component_separators = "",
    section_separators = "",
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_x = {},
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {
      {
        "buffers",
        hide_filename_extension = true,
        use_mode_colors = true,
        buffers_color = {
          active = "lualine_buff_active",
        },
      },
    },
    lualine_x = {
      {
        function()
          return "  " .. require("dap").status()
        end,
        cond = function()
          return package.loaded["dap"] and require("dap").status() ~= ""
        end,
        -- color = Snacks.utility.color 'Debug',
      },
      {
        function()
          return " "
        end,
        color = function()
          local status = require("sidekick.status").get()
          if status then
            return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
          end
        end,
        cond = function()
          local status = require("sidekick.status")
          return status.get() ~= nil
        end,
      },
      {
        function()
          local status = require("sidekick.status").cli()
          return " " .. (#status > 1 and #status or "")
        end,
        cond = function()
          return #require("sidekick.status").cli() > 0
        end,
        color = function()
          return "Special"
        end,
      },
      {
        "tabs",
        use_mode_colors = true,
        tabs_color = {
          active = "lualine_buff_active",
        },
      },
      { "progress", color = { fg = colors.fg, gui = "bold" } },
      { "location" },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections = config.sections
    opts.options = config.options
    opts.inactive_sections = config.inactive_sections
    opts.tabline = config.tabline
  end,
  -- config = config,
}
