return {
  {
    "rcasia/neotest-java",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "mfussenegger/nvim-dap", -- for the debugger
      "rcarriga/nvim-dap-ui", -- recommended
      "theHamsta/nvim-dap-virtual-text", -- recommended
    },
    init = function()
      -- override the default keymaps.
      -- needed until neotest-java is integrated in LazyVim
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- run test file
      keys[#keys + 1] = {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        mode = "n",
      }
      -- run nearest test
      keys[#keys + 1] = {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        mode = "n",
      }
      -- debug test file
      keys[#keys + 1] = {
        "<leader>tD",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        mode = "n",
      }
      -- debug nearest test
      keys[#keys + 1] = {
        "<leader>td",
        function()
          require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
        end,
        mode = "n",
      }
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
    },
    ft = { "go", "java" },
    opts = {
      -- See all config options with :h neotest.Config
      discovery = {
        -- Drastically improve performance in ginormous projects by
        -- only AST-parsing the currently opened buffer.
        enabled = false,
        -- Number of workers to parse files concurrently.
        -- A value of 0 automatically assigns number based on CPU.
        -- Set to 1 if experiencing lag.
        concurrent = 1,
      },
      running = {
        -- Run tests concurrently when an adapter provides multiple commands to run.
        concurrent = true,
      },
      summary = {
        -- Enable/disable animation of icons.
        animated = false,
      },
      adapters = {
        ["neotest-golang"] = {
          -- go_test_args = { '-v', '-race', '-count=1', '-timeout=60s' },
          dap_go_enabled = true,
          warn_test_name_dupes = false,
          testify_enabled = true,
        },
        ["neotest-java"] = {
          -- config here
        },
      },
    },
  },
}
