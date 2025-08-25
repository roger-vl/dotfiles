return {
  {
    "smoka7/hop.nvim",
    enabled = false,
    version = "*",
    opts = {},
    config = function()
      require("hop").setup({})
    end,
  },
  {
    "chrisgrieser/nvim-early-retirement",
    event = "VeryLazy",
    config = true,
    opts = {
      retirementAgeMins = 5,
      ignoredFiletypes = { "TelescopePrompt", "sagafinder", "CodeCompanion" },
      notificationOnAutoClose = false,
    },
  },
}
