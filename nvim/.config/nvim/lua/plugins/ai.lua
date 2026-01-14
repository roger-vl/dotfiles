return {
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        copilot_model = "claude-sonne-4.5",
      })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    enabled = false,
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "OW_GEMINI_KEY",
              },
            })
          end,
        },
        display = {
          chat = {
            show_settings = false,
          },
        },
        extensions = {
          history = {
            enabled = true,
            opts = {
              keymap = "gh",
              save_chat_keymap = "sc",
              auto_save = true,
              expiration_days = 2,
              picker = "snaks",
              picker_keymaps = {
                rename = { n = "r", i = "<M-r>" },
                delete = { n = "d", i = "<M-d>" },
                duplicate = { n = "<C-y>", i = "<C-y>" },
              },
              auto_generate_title = true,
              title_generation_opts = {
                adapter = nil,
                model = nil,
                refresh_every_n_prompts = 0,
                max_refreshes = 3,
              },
              continue_last_chat = false,
              delete_on_clearing_chat = false,
              dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
              enable_logging = false,
              chat_filter = nil,
            },
          },
        },
      })
    end,
  },
  {
    "folke/sidekick.nvim",
    opts = {
      nes = {
        enabled = true,
      },
      cli = {
        win = {
          keys = {
            stopinsert = { "<c-i>", mode = "t" },
            hide_n = { "<c-a>", "hide", mode = "t" },
          },
        },
        mux = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "<c-a>",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>an",
        function()
          require("sidekick.nes").toggle()
        end,
        desc = "Sidekick Toggle NES",
      },
    },
  },
}
