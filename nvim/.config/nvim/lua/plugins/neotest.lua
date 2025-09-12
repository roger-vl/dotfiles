return {
  "nvim-neotest/neotest",
  lazy = true,
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
      animated = false,
    },
    adapters = {
      ["neotest-golang"] = {
        dap_go_enabled = true,
        warn_test_name_dupes = false,
        testify_enabled = true,
      },
    },
    consumers = {
      notify = function(client)
        client.listeners.results = function(_, results, partial)
          if partial then
            return
          end

          local total = 0
          local passed = 0
          for _, r in pairs(results) do
            total = total + 1
            if r.status == "passed" then
              passed = passed + 1
            end
          end

          vim.notify(passed .. "/" .. total .. " tests passed.")
        end
      end,
    },
  },
}
