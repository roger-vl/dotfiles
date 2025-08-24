return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        gopls = {
          settings = {
            gopls = {
              codelenses = {
                gc_details = true,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = false,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              staticcheck = false,
            },
          },
        },
        lua_ls = {
          single_file_support = true,
          settings = {
            lua = {
              hint = {
                enable = true,
              },
            },
          },
        },
      },
      setup = {},
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {
          ["markdownlint-cli2"] = {
            args = { "--disable", "MD013", "--" },
          },
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "shellcheck",
        "shfmt",
        "json-lsp",
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "http",
        "graphql",
        "go",
        "regex",
        "jsonc",
        "json",
        "xml",
        "sql",
        "mermaid",
        "hurl",
        "latex",
        "css",
        "norg",
        "scss",
        "svelte",
        "typst",
        "vue",
      })
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    event = "LspAttach",
    ft = { "cpp", "lua", "http", "go" },
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
        definition = {
          keys = {
            quit = "<esc>",
            vsplit = "<C-.>",
            split = "<C-,>",
          },
        },
        finder = {
          default = "def+imp+ref",
          max_height = 0.6,
          left_width = 0.4,
          right_width = 0.6,
          layout = "normal",
          keys = {
            quit = "<esc>",
            toggle_or_open = "<CR>",
            vsplit = "<C-.>",
            split = "<C-,>",
          },
        },
      })
    end,
    -- ['ref'] = 'textDocument/references',
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      modes = {
        mydiags = {
          mode = "diagnostics", -- inherit from diagnostics mode
          filter = {
            any = {
              buf = 0, -- current buffer
              {
                severity = vim.diagnostic.severity.ERROR, -- errors only
                -- limit to files in the current project
                function(item)
                  return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
                end,
              },
            },
          },
        },
      },
    },
  },
}
