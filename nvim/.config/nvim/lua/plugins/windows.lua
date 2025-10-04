return {
  "anuvyklack/windows.nvim",
  lazy = false,
  dependencies = {
    "anuvyklack/middleclass",
  },
  config = function()
    -- vim.o.winwidth = 10
    -- vim.o.winminwidth = 10
    -- vim.o.equalalways = false
    require("windows").setup({
      autowidth = {
        enable = false,
      },
      ignore = { --			  |windows.ignore|
        buftype = { "quickfix", "nofile" },
        filetype = { "NvimTree", "neo-tree", "undotree", "gundo", "dbui", "snacks_picker_list" },
      },
    })
  end,
}
