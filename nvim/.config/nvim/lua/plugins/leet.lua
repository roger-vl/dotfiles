return {
  "kawre/leetcode.nvim",
  enabled = false,
  -- build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- configuration goes here
    lang = "python3",
    injector = {
      ["python3"] = {
        before = true,
      },
    },
  },
}
