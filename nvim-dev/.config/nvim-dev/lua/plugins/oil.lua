return {
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      detele_to_trash = true,
      float = {
        padding = 7,
      },
      view_options = {
        show_hidden = true,
      },
    },
    lazy = false,
  }
}
