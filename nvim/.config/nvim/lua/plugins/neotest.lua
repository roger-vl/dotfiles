return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
  },
  ft = { "go" },
  opts = {
    discovery = {
      enabled = false,
      -- Number of workers to parse files concurrently.
      -- A value of 0 automatically assigns number based on CPU.
      -- Set to 1 if experiencing lag.
      concurrent = 0,
    },
    running = {
      concurrent = true,
    },
    summary = {
      animated = true,
    },
    adapters = {
      ["neotest-golang"] = {
        dap_go_enabled = true,
        warn_test_name_dupes = false,
        testify_enabled = true,
      },
    },
  },
}
