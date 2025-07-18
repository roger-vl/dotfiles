return {
  'NeogitOrg/neogit',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
    'ibhagwan/fzf-lua',
  },
  config = function()
    require('neogit').setup {
      integrations = {
        telescope = true,
        diffview = true,
        fzf_lua = true,
      },
    }
  end,
}
