return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        -- Claude Code scrolls its own transcript, so don't let sidekick's
        -- `dump` scrollback hijack the mouse wheel (which swapped the live
        -- terminal for a read-only tmux capture-pane dump — "exits claude").
        tools = {
          claude = { native_scroll = true },
        },
        win = {
          layout = "right",
          split = {
            width = 0.45,
            height = 1.0,
          },
          keys = {
            -- <c-q> is XON/XOFF flow control and gets eaten by the tty, so
            -- use <c-space> to drop to normal mode (opens sidekick scrollback).
            stopinsert = { "<c-space>", "stopinsert", mode = "t" },
            hide_n = { "<c-a>", "hide", mode = "t" },
            prompt = { "<c-g>", "prompt", mode = "t" },
          },
        },
        mux = {
          enabled = true,
          backend = "tmux",
          dump = 3000, -- lines of tmux pane history captured for scrollback
        },
        prompts = {
          com = "/com",
          custom = function(ctx)
            return "Current file: " .. ctx.buf .. " at line " .. ctx.row
          end,
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if require("sidekick").nes_jump_or_apply() then
            return -- jumped or applied
          end

          -- if you are using Neovim's native inline completions
          if vim.lsp.inline_completion.get() then
            return
          end

          -- any other things (like snippets) you want to do on <tab> go here.

          -- fall back to normal tab
          return "<tab>"
        end,
        mode = { "i", "n" },
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<c-s>",
        function()
          require("sidekick.cli").select({ filter = { installed = true } })
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<c-a>",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  },
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {

      keymap = {
        ["<Tab>"] = {
          "snippet_forward",
          function() -- sidekick next edit suggestion
            return require("sidekick").nes_jump_or_apply()
          end,
          function() -- if you are using Neovim's native inline completions
            return vim.lsp.inline_completion.get()
          end,
          "fallback",
        },
      },
    },
  },
}
