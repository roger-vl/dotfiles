local colors = {
  bg = 'NONE',
  fg = '#646464',
  yellow = '#797250',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  border = '#DAB68B',
  red = '#ec5f67',
  high1 = '#E69875',
  high2 = '#ECBE7B',
  high3 = '#75848A',
  high4 = '#B0CC76',
}

local config = {
  options = {
    globalstatus = true,
    disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
    component_separators = '',
    section_separators = '',
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
        function()
          return '  ' .. require('dap').status()
        end,
        cond = function()
          return package.loaded['dap'] and require('dap').status() ~= ''
        end,
        -- color = Snacks.util.color 'Debug',
      },
      { 'progress', color = { fg = colors.fg, gui = 'bold' } },
      { 'location' },
      {
        function()
          return require('nvim-navic').get_location()
        end,
        cond = function()
          return require('nvim-navic').is_available()
        end,
      },
    },
    lualine_x = {
      'buffers',
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
  'nvim-lualine/lualine.nvim',
  opts = function(_, opts)
    opts.sections = config.sections
    opts.options = config.options
    opts.inactive_sections = config.inactive_sections
    opts.tabline = config.tabline
  end,
  -- config = config,
}
