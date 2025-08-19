return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    local tlscope = require("telescope")
    tlscope.setup {
      pickers = {
        help_tags = {
          theme = "ivy"
        }
      },
      extensions = {
        fzf = {}
      }
    }

    tlscope.load_extension("fzf")

    vim.keymap.set("n", ";h", require("telescope.builtin").help_tags)

    vim.keymap.set("n", ";f", require("telescope.builtin").find_files)

    vim.keymap.set("n", ";c", function()
      local opts = require("telescope.themes").get_ivy({
        cwd = vim.fn.stdpath("config"),
        -- initial_mode = "normal",
      })
      require("telescope.builtin").find_files(opts)
    end)

    vim.keymap.set("n", "<space>fp", function()
      require("telescope.builtin").find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        initial_mode = "normal",
      }
    end)

    require "config.telescope.multigrep".setup()
  end,
}
