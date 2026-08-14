local opt = vim.opt

vim.g.lazyvim_picker = "snacks"

opt.scrolloff = 30
-- Include terminal mode (`t`) so mouse-wheel events reach Neovim inside
-- terminal buffers. Required for scrolling the sidekick Claude CLI: the
-- wheel opens sidekick's scrollback view (dump of the tmux pane history).
opt.mouse = "a"
-- opt.virtualedit = "onemore"
opt.fillchars:append("eob: ")
-- vim.o.background = 'dark'
vim.opt.spelllang = "en_us,es"
vim.opt.spell = true
vim.opt.spelloptions = "camel"
-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlugin = 0
vim.opt.swapfile = false
