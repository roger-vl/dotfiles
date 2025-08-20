require("config.lazy")

-- options
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"


-- Keymaps
local function cmd(command)
    return table.concat({ "<Cmd>", command, "<CR>" })
end

local map = vim.keymap
local set = map.set

-- general
set("n", "<space>qq", cmd "q")

-- terminal
set("t", "<esc><esc><esc>", "<c-\\><c-n>")

-- file system
set("n", "<space>e", cmd "Oil --float")

-- window moves
set("n", "<C-j>", "<C-W>j")
set("n", "<C-k>", "<C-W>k")
set("n", "<C-h>", "<C-W>h")
set("n", "<C-l>", "<C-W>l")
set("n", "<C-.>", "<C-W>v")
set("n", "<C-,>", "<C-W>s")
set("n", "<C-;>", "<C-W>q")
set("n", "<C-D-j>", "<C-W>-3")
set("n", "<C-D-k>", "<C-W>+3")
set("n", "<C-D-h>", "<C-W><3")
set("n", "<C-D-l>", "<C-W>>3")

-- quickfix
set("n", "<C-D-n>", cmd "cnext")
set("n", "<C-D-p>", cmd "cprevious")


-- load on site
set("n", "<space><space>x", cmd "source %")
set("n", "<space>x", ":.lua<CR>")
set("v", "<space>x", ":.lua<CR>")

-- terminal

local job_id = 0
set("n", "<space>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    job_id = vim.bo.channel
end)


-- Autocmd
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

vim.keymap.set("n", "<space>gt", function()
    vim.fn.chansend(job_id, { "ll\r\n" })
end)
