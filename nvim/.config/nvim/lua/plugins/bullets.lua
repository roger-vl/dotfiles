return {
  "bullets-vim/bullets.vim",
  lazy = true,
  ft = { "txt", "markdown" },
  config = function()
    vim.g.bullets_enabled_file_types = {
      "markdown",
      "text",
      "gitcommit",
      "scratch",
    }
  end,
}
