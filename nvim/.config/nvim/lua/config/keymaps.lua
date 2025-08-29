local function cmd(command)
  return table.concat({ "<Cmd>", command, "<CR>" })
end

local map = vim.keymap
local set = map.set

-- simple move
set({ "n", "v" }, "fh", "g0", { noremap = true, silent = true })
set({ "n", "v" }, "fl", "g$", { noremap = true, silent = true })

-- recording
set("n", "<leader>qr", "q", { noremap = true })
set("n", "q", "<Nop>", { noremap = true })

-- window moves
set("n", "<C-.>", "<C-W>v", { desc = "Split Window Right", noremap = true })
set("n", "<C-,>", "<C-W>s", { desc = "Split Window Below", noremap = true })
set("n", "<C-;>", "<C-W>c", { desc = "Delete Window", noremap = true })
set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", noremap = true })
set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", noremap = true })
set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", noremap = true })
set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", noremap = true })
set("n", "<C-D-j>", "<cmd>resize +5<cr>", { desc = "Increase Window Height" })
set("n", "<C-D-k>", "<cmd>resize -5<cr>", { desc = "Decrease Window Height" })
set("n", "<C-D-h>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Window Width" })
set("n", "<C-D-l>", "<cmd>vertical resize +5<cr>", { desc = "Increase Window Width" })

-- saga
set("n", ",a", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true })
set("n", ",s", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true })
set("n", ",f", "<cmd>Lspsaga finder ++normal<CR>", { noremap = true, silent = true })
set("n", ",d", "<cmd>Lspsaga outline<CR>", { noremap = true, silent = true })

-- Pickers
set("n", "<leader>fc", function()
  Snacks.picker.files({
    cwd = "~/dotfiles",
    exclude = { "**/nvim-dev/*" },
    hidden = true,
    sort_lastused = true,
    sort = {
      fields = {
        "file",
      },
    },
  })
end, { desc = "Find Config File", noremap = true })
set("n", "<leader><space>", function()
  Snacks.picker.smart({
    filter = { cwd = true },
    focus = "list",
  })
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
set("n", "<leader>fM", function()
  Snacks.picker.files({
    cwd = "~/Documents/knowledge/knowledge/",
    layout = {
      preset = "ivy",
      position = "bottom",
    },
  })
end, { desc = "Find on knowlege", silent = true, noremap = true })

-- diff view
set("n", "<leader>gr", function()
  vim.cmd("DiffviewOpen origin/HEAD...HEAD --follow")
end, { desc = "Diff view PR (origin/base)", remap = true, silent = true })

-- AI
set(
  "n",
  "<leader>ci",
  cmd("CodeCompanionChat Toggle"),
  { desc = "CodeCompanionChat Toggle", remap = true, silent = true }
)
set("v", "<leader>ci", ": CodeCompanionChat ", { desc = "CodeCompanionChat Selected", remap = true, silent = false })

-- lua execute
set("n", "<leader>ax", "<cmd>source %<CR>", { desc = "Source current buffer", remap = true, silent = true })
set("n", "<leader>ar", ":.lua<CR>", { desc = "Execute lua code over cursor", remap = true, silent = true })
set("v", "<leader>ar", ":lua<CR>", { desc = "Execute lua code selected", remap = true, silent = true })
