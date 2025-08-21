return {
  {
    "smoka7/hop.nvim",
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
      retirementAgeMins = 8,
      ignoredFiletypes = { "TelescopePrompt", "sagafinder", "CodeCompanion" },
      notificationOnAutoClose = false,
    },
  },
}
