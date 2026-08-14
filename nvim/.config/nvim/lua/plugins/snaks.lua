return {
  "snacks.nvim",
  opts = {
    statuscolumn = { enabled = true },
    scroll = { enabled = true },
    lazygit = { enabled = true },
    scratch = { enabled = true },
    indent = { enabled = true },
    gh = { enabled = true },
    animate = { enabled = true },
    picker = {
      sources = {
        explorer = {
          name = "Explorer",
          cmd = "SnacksExplorer",
        },
        files = {
          hidden = true,
          ignored = true,
        },
      },
      win = {
        input = {
          keys = {
            ["<C-.>"] = { "edit_vsplit", mode = { "i", "n" } },
            ["<C-,>"] = { "edit_split", mode = { "i", "n" } },
            ["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
            ["<C-i>"] = { "toggle_ignored", mode = { "i", "n" } },
            ["<C-f>"] = { "toggle_follow", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<C-.>"] = "edit_vsplit",
            ["<C-,>"] = "edit_split",
          },
        },
      },
      files = {
        hidden = true,
        sort = { fields = { "score:asc", "idx" } },
      },
    },
    -- bigfile = {},
    explorer = {
      replace_netrw = true,
    },
    styles = {
      snacks_image = {
        relative = "editor",
        col = -1,
      },
    },
    image = {
      enabled = false,
      force = false,
      doc = {
        inline = true,
      },
    },
    zen = {
      toggles = {
        dim = false,
        git_signs = true,
        -- mini_diff_signs = true,
        -- inlay_hints = true,
        diagnostics = true,
      },
      show = {
        statusline = true,
        tabline = true,
      },
      win = {
        style = {
          enter = true,
          fixbuf = false,
          minimal = false,
          width = 140,
          height = 0,
          backdrop = { transparent = false, blend = 40 },
          keys = { q = false },
          zindex = 40,
          wo = {
            winhighlight = "NormalFloat:Normal",
          },
          w = {
            snacks_main = true,
          },
        },
      },
    },
    dashboard = {
      preset = {
        header = [[
⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⠀
⢈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⠀
⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡇⠀⢸⢹⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⠀
⠈⣿⣿⣿⣿⣿⠧⠯⠟⠿⠧⠀⠀⠀⠸⠿⠿⢼⣿⠿⢿⣟⣿⣿⣿⣿⣿⣇⠀
⠀⣿⣿⣿⣿⡿⢰⠺⣿⠉⠂⠀⠀⠀⠀⠀⠀⠚⣷⣶⠢⡀⢿⣿⣿⣿⡿⠉⠀
⢐⢻⣿⣏⠙⠇⠈⠒⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠝⠻⠥⠁⢰⡌⠹⠋⡀⡀⠀
⠀⠉⢻⣿⣦⡀⠐⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠆⠄⠸⢃⣰⡀⠱⠀⠀
⠀⠀⠀⢹⣿⣿⡄⠀⠀⠀⠀⠀⠀⡀⡀⠀⠀⠀⠀⠀⠀⢀⣶⣿⣿⡟⠁⠀⠀
⠀⠀⠘⣸⢿⣿⣿⣦⡀⠀⠀⠀⠀⠠⠄⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣇⠀⠀⠀
⠀⠀⠀⠉⠞⠿⠛⠿⠿⢶⣄⠀⠀⠀⠀⠀⠀⠀⣠⡾⠿⠿⣿⣿⡿⠅⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣶⣤⣤⣤⡴⠊⠀⡧⠀⠀⣿⣿⣇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣀⡞⠛⠿⣿⣿⠟⠋⠀⠀⠀⠱⣀⠈⣿⣿⡁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⡠⠔⠋⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠙⠲⣿⣧⠀⠀⠀⠀⠀
⢀⠔⠒⠀⠉⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠀⠉⠚⠤⢔
     ]],
      },
    },
  },
}
