return {
  "bullets-vim/bullets.vim",
  lazy = true,
  config = function()
    vim.g.bullets_enabled_file_types = {
      "markdown",
      "text",
      "gitcommit",
      "scratch",
    }
  end,
}
