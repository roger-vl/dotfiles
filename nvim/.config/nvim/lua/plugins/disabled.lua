return {
  -- disable trouble
  -- { 'folke/flash.nvim', enabled = false },
  -- { 'echasnovski/mini.indentscope', enabled = false },
  -- { 'akinsho/bufferline.nvim', enabled = false },
  -- { 'mfussenegger/nvim-lint', enabled = false },
  {
    "norcalli/nvim-colorizer.lua",
    enabled = true,
    config = function()
      require("colorizer").setup()
    end,
  },
}
