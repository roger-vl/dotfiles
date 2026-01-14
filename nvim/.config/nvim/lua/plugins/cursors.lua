return {
  "mg979/vim-visual-multi",
  lazy = true,
  ft = { "lua", "markdown", "go", "bash" },
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_theme = "iceblue"
    local set = vim.keymap.set
    set("n", "<C-n>", "Find Under", { desc = "Multicursor Fin under" })
    set("n", "<C-N>", "Select All", { desc = "Multicursor Select all" })
  end,
}
