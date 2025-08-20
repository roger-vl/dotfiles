-- Keymaps
local function cmd(command)
  return table.concat({ "<Cmd>", command, "<CR>" })
end

local map = vim.keymap
local set = map.set


-- simple move

set({ "n", "v" }, "fh", "g0", { noremap = true, silent = true })
set({ "n", "v" }, "fl", "g$", { noremap = true, silent = true })

-- hop
set({ "n", "v" }, "f;", "<cmd>HopWordCurrentLine<CR>", { noremap = true, silent = true })
set({ "n", "v" }, "fj", "<cmd>HopWordAC<CR>", { noremap = true, silent = true })
set({ "n", "v" }, "fk", "<cmd>HopWordBC<CR>", { noremap = true, silent = true })

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

-- custom
set({ "n", "t" }, "<space>tt", require("plugin.floatterm").toggle)
