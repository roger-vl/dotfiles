require("config.lazy")

vim.keymap.set("n", "<space><space>x","<cmd>source %<CR>")
vim.keymap.set("n", "<space>x",":.lua<CR>")
vim.keymap.set("v", "<space>x",":.lua<CR>")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"






    




-- Highlight when yanking text
