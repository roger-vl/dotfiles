return {
  {
    "rgroli/other.nvim",
    lazy = true,
    -- ft = { 'go', 'java' },
    ft = { "go" },
    config = function()
      require("other-nvim").setup({
        mappings = {
          "golang",
          -- {
          --   context = 'test', -- optional
          --   -- pattern = '/src/main/java/(.*).java$',
          --   -- target = '/src/test/java/%1Test.java',
          -- },
          -- {
          --   context = 'implementation', -- optional
          --   -- pattern = '/src/test/java/(.*)Test.java$',
          --   -- target = '/src/main/java/%1.java',
          -- },
        },
      })
    end,
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {},
    config = function()
      require("hop").setup({})
    end,
  },
  {
    "mg979/vim-visual-multi",
    init = function()
      vim.g.VM_default_mappings = 1
      vim.g.VM_theme = "iceblue"
    end,
  },
  -- { 'stevearc/conform.nvim', opts = {
  --   formatters_by_ft = {
  --     go = { 'goimports' },
  --   },
  -- } },

  {
    "CRAG666/code_runner.nvim",
    lazy = true,
    ft = { "cpp", "python" },
    config = true,
    opts = {
      focus = false,
      filetype = {
        python = "python3 -u",
        cpp = {
          "cd $dir &&",
          "g++ --std=c++17 $fileName",
          "-o $fileNameWithoutExt &&",
          "$dir/$fileNameWithoutExt",
        },
      },
    },
  },
  {
    "vhyrro/luarocks.nvim",
    lazy = true,
    -- priority = 1000,
    config = true,
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
