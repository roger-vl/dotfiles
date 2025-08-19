return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    vim.cmd.colorscheme "tokyonight"
  end,
}
