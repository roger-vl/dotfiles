local function cmd(command)
  return table.concat({ "<Cmd>", command, "<CR>" })
end

local map = vim.keymap
local set = map.set
local del = map.del

del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")

-- del("n", "<C-Up>")
-- del("n", "<C-Down>")
-- del("n", "<C-Left>")
-- del("n", "<C-Right>")

-- del("n", "<M-j>")
-- del("n", "<M-k>")
-- del("i", "<M-j>")
-- del("i", "<M-k>")
-- del("v", "<M-j>")
-- del("v", "<M-k>")
-- del("n", ",")

-- normals
-- set("n", "U", "<C-r>", { desc = "Redo last change", noremap = true, silent = true })

-- recording

set("n", "<leader>qr", "q", { remap = true })
set("n", "q", "<Nop>", { remap = true })

-- resize splits smarts
set("n", "<C-D-j>", "<cmd>resize +5<cr>", { desc = "Increase Window Height" })
set("n", "<C-D-k>", "<cmd>resize -5<cr>", { desc = "Decrease Window Height" })
set("n", "<C-D-h>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Window Width" })
set("n", "<C-D-l>", "<cmd>vertical resize +5<cr>", { desc = "Increase Window Width" })

-- windows
set("n", "<C-.>", "<C-W>v", { desc = "Split Window Right", remap = true })
set("n", "<C-,>", "<C-W>s", { desc = "Split Window Below", remap = true })
set("n", "<C-;>", "<C-W>c", { desc = "Delete Window", remap = true })
-- set("n", "<C-m>", cmd("WindowsEqualize"), { noremap = true, silent = true })
-- set("n", "<M-CR>", cmd("WindowsMaximize"), { noremap = true, silent = true })
-- set("n", "<C-o>", cmd("WindowsMaximizeVertically"), { noremap = true, silent = true })

-- Resize window using <ctrl> arrow keys
set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })

-- simple move
-- set({ "n", "v" }, "fh", "g0", { noremap = true, silent = true })
-- set({ "n", "v" }, "fl", "g$", { noremap = true, silent = true })

-- saga
set("n", ",a", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true })
set("n", ",s", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true })
set("n", ",f", "<cmd>Lspsaga finder ++normal<CR>", { noremap = true, silent = true })
set("n", ",d", "<cmd>Lspsaga outline<CR>", { noremap = true, silent = true })

-- Pickers
set("n", "<leader><space>", function()
  Snacks.picker.smart({ filter = { cwd = true } })
end, { desc = "Find smart", silent = true, noremap = true })

set("n", "<leader>f.", function()
  Snacks.picker.resume()
end, { desc = "Find resume last pickers", silent = true, noremap = true })

set("n", "<leader>fP", function()
  Snacks.picker.pickers()
end, { desc = "Find pickers", silent = true, noremap = true })

set("n", "<leader>fm", function()
  Snacks.picker.files({
    cwd = "~/Documents/memories",
    layout = {
      preset = "ivy",
      position = "bottom",
    },
  })
end, { desc = "Find on memories", silent = true, noremap = true })

-- diff view
set("n", "<leader>gr", function()
  vim.cmd("DiffviewOpen origin/HEAD...HEAD --follow")
end, { desc = "Diff view PR (origin/base)", remap = true, silent = true })

-- AI
set(
  "n",
  "<C-S-M-i>",
  cmd("CodeCompanionChat Toggle"),
  { desc = "CodeCompanionChat Toggle", remap = true, silent = true }
)
set("v", "<C-S-M-i>", ": CodeCompanionChat ", { desc = "CodeCompanionChat Selected", remap = true, silent = false })

-- lua execute
set("n", "<leader>ax", "<cmd>source %<CR>", { desc = "Source current buffer", remap = true, silent = true })
set("n", "<leader>ar", ":.lua<CR>", { desc = "Execute lua code over cursor", remap = true, silent = true })
set("v", "<leader>ar", ":lua<CR>", { desc = "Execute lua code selected", remap = true, silent = true })
