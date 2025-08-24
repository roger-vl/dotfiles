return {
  "MeanderingProgrammer/render-markdown.nvim",
  priority = 900,
  lazy = true,
  opts = {
    code = {
      width = "block",
      disable_background = true,
      highlight_border = false,
      border = "thin",
      conceal_delimiters = false,
    },
    heading = {
      sign = true,
      icons = {},
    },
    checkbox = {
      enabled = true,
    },
    html = {
      enabled = true,
      comment = {
        conceal = false,
      },
    },
  },
}
