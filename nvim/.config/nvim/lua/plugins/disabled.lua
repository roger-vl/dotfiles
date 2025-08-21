return {
  -- disable trouble
  -- { "folke/flash.nvim", enabled = false },
  -- { "echasnovski/mini.indentscope", enabled = false },
  -- { "akinsho/bufferline.nvim", enabled = false },
  {
    "norcalli/nvim-colorizer.lua",
    enabled = false,
    config = function()
      require("colorizer").setup()
    end,
  },
}
