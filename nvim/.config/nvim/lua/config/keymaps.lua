-- local toggleMap = {
--   ["codeRunner"] = false,
--   ["leetCode"] = false,
-- }
--
-- local toggle = function(key)
--   toggleMap[key] = not toggleMap[key]
-- end

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

del("n", "<C-Up>")
del("n", "<C-Down>")
del("n", "<C-Left>")
del("n", "<C-Right>")

del("n", "<M-j>")
del("n", "<M-k>")
del("i", "<M-j>")
del("i", "<M-k>")
del("v", "<M-j>")
del("v", "<M-k>")
-- del("n", ",")

-- normals
set("n", "U", "<C-r>", { desc = "Redo last change", noremap = true, silent = true })

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
set("n", "<C-m>", cmd("WindowsEqualize"), { noremap = true, silent = true })
set("n", "<M-CR>", cmd("WindowsMaximize"), { noremap = true, silent = true })
-- set("n", "<C-o>", cmd("WindowsMaximizeVertically"), { noremap = true, silent = true })

-- Resize window using <ctrl> arrow keys
set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })

-- simple move

set({ "n", "v" }, "fh", "g0", { noremap = true, silent = true })
set({ "n", "v" }, "fl", "g$", { noremap = true, silent = true })

-- hop
set({ "n", "v" }, "f;", "<cmd>HopWordCurrentLine<CR>", { noremap = true, silent = true })
set({ "n", "v" }, "fj", "<cmd>HopWordAC<CR>", { noremap = true, silent = true })
set({ "n", "v" }, "fk", "<cmd>HopWordBC<CR>", { noremap = true, silent = true })

-- saga
set("n", ",a", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true })
set("n", ",s", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true })
set("n", ",f", "<cmd>Lspsaga finder ++normal<CR>", { noremap = true, silent = true })
set("n", ",d", "<cmd>Lspsaga outline<CR>", { noremap = true, silent = true })

-- tabs
-- set("n", "<leader><tab><tab>", cmd("tabnext"), { desc = "Next Tab" })
-- set("n", "<leader><tab>n", cmd("tabnew"), { desc = "New Tab" })

-- harpoon
-- set("n", "<leader>a", function()
--   require("harpoon"):list():add()
-- end, { desc = "Harpoon File", remap = true })

-- set("n", "<leader><leader>", function()
--   local harpoon = require("harpoon")
--   harpoon.ui:toggle_quick_menu(harpoon:list())
-- end, { desc = "Harpoon Quick Menu", remap = true })

-- git signs
-- set(
--   "n",
--   "<leader>uG",
--   require("gitsigns").toggle_current_line_blame,
--   { desc = "Git line blame toggle", remap = true, silent = true }
-- )

-- diff view
set("n", "<leader>gr", function()
  vim.cmd("DiffviewOpen origin/HEAD...HEAD --follow")
end, { desc = "Diff view PR (origin/base)", remap = true, silent = true })

-- AI
-- set("n", "<C-S-M-u>", cmd("MCPHub"), { desc = "MCP hub", remap = true, silent = false })
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

-- telescope
-- set(
--   "v",
--   ";w",
--   LazyVim.pick("grep_string", {
--     -- cwd = false,
--     word_match = "-w",
--     prompt_title = "Word visual",
--     disable_coordinates = true,
--     results_title = "",
--     follow = true,
--     -- path_display = { 'tail' },
--     layout_strategy = "vertical",
--     layout_config = {
--       prompt_position = "top",
--       width = 0.8,
--       height = 0.8,
--       mirror = true,
--       preview_height = 0.6,
--     },
--     sorting_strategy = "ascending",
--     initial_mode = "normal",
--   }),
--   { desc = "[W]ord search visual" }
-- )
--
-- set(
--   "n",
--   ";w",
--   LazyVim.pick("live_grep", {
--     -- cwd = false,
--     disable_coordinates = true,
--     prompt_title = "Word search",
--     results_title = "",
--     follow = true,
--     -- path_display = { 'tail' },
--     layout_strategy = "vertical",
--     layout_config = {
--       prompt_position = "top",
--       width = 0.8,
--       height = 0.8,
--       mirror = true,
--       preview_height = 0.6,
--     },
--     sorting_strategy = "ascending",
--     initial_mode = "insert",
--   }),
--   { desc = "[W]ord search" }
-- )
