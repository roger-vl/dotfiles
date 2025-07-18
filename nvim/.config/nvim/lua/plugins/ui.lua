return {
  {
    'anuvyklack/windows.nvim',
    lazy = false,
    dependencies = {
      'anuvyklack/middleclass',
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup {
        autowidth = {
          enable = false,
        },
        ignore = { --			  |windows.ignore|
          buftype = { 'quickfix', 'nofile' },
          filetype = { 'NvimTree', 'neo-tree', 'undotree', 'gundo', 'dbui' },
        },
      }
    end,
  },

  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    --    event = 'VeryLazy',   -- You can make it lazy-loaded via VeryLazy, but comment out if thing doesn't work
    init = function()
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
    end,
    config = function()
      require('ufo').setup {
        close_fold_kinds_for_ft = {
          default = { 'imports', 'comment' },
        },
      }
    end,
  },

  {
    'SmiteshP/nvim-navic',
    -- lazy = true,
    opts = function()
      return {
        separator = '┊',
        -- highlight = false,
        depth_limit = 3,
        icons = require('lazyvim.config').icons.kinds,
        lazy_update_context = true,
        safe_output = true,
      }
    end,
  },
}
