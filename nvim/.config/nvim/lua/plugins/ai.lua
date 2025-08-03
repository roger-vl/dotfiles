return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "ravitemer/codecompanion-history.nvim",
    },
  },

  {
    "ravitemer/mcphub.nvim",
    enabled = false,
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup()
    end,
  },

  {
    "olimorris/codecompanion.nvim",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
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
          --   -- mcphub = {
          --   --   callback = "mcphub.extensions.codecompanion",
          --   --   opts = {
          --   --     show_result_in_chat = true, -- Show mcp tool results in chat
          --   --     make_vars = true, -- Convert resources to #variables
          --   --     make_slash_commands = true, -- Add prompts as /slash commands
          --   --   },
          --   },
          history = {
            enabled = true,
            opts = {
              keymap = "gh",
              save_chat_keymap = "sc",
              auto_save = fase,
              expiration_days = 2,
              picker = "telescope",
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
}
