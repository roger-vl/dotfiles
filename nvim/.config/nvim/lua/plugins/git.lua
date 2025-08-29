local function tbl_clone(t)
  local clone = {}

  for k, v in pairs(t) do
    clone[k] = v
  end

  return clone
end

---Get the result of the union of the given vectors.
local function vec_union(...)
  local result = {}
  local args = { ... }
  local seen = {}

  for i = 1, select("#", ...) do
    if type(args[i]) ~= "nil" then
      if type(args[i]) ~= "table" and not seen[args[i]] then
        seen[args[i]] = true
        result[#result + 1] = args[i]
      else
        for _, v in ipairs(args[i]) do
          if not seen[v] then
            seen[v] = true
            result[#result + 1] = v
          end
        end
      end
    end
  end

  return result
end

---Set a value in a table, creating all missing intermediate tables in the
---table path.
---@param t table
---@param table_path string|string[] Either a `.` separated string of table keys, or a list.
---@param value any
local function tbl_set(t, table_path, value)
  local keys = type(table_path) == "table" and table_path or vim.split(table_path, ".", { plain = true })

  local cur = t

  for i = 1, #keys - 1 do
    local k = keys[i]

    if not cur[k] then
      cur[k] = {}
    end

    cur = cur[k]
  end

  cur[keys[#keys]] = value
end

--Try property access.
---@param t table
---@param table_path string|string[] Either a `.` separated string of table keys, or a list.
---@return any?
local function tbl_access(t, table_path)
  local keys = type(table_path) == "table" and table_path or vim.split(table_path, ".", { plain = true })

  local cur = t

  for _, k in ipairs(keys) do
    cur = cur[k]
    if not cur then
      return nil
    end
  end

  return cur
end

---Ensure that the table path is a table in `t`.
---@param t table
---@param table_path string|string[] Either a `.` separated string of table keys, or a list.
local function tbl_ensure(t, table_path)
  local keys = type(table_path) == "table" and table_path or vim.split(table_path, ".", { plain = true })

  if not tbl_access(t, keys) then
    tbl_set(t, keys, {})
  end
end

---Deep extend a table, and also perform a union on all sub-tables.
---@param t table
---@param ... table
---@return table
local function tbl_union_extend(t, ...)
  local res = tbl_clone(t)

  local function recurse(ours, theirs)
    -- Get the union of the two tables
    local sub = vec_union(ours, theirs)

    for k, v in pairs(ours) do
      if type(k) ~= "number" then
        sub[k] = v
      end
    end

    for k, v in pairs(theirs) do
      if type(k) ~= "number" then
        if type(v) == "table" then
          sub[k] = recurse(sub[k] or {}, v)
        else
          sub[k] = v
        end
      end
    end

    return sub
  end

  for _, theirs in ipairs({ ... }) do
    res = recurse(res, theirs)
  end

  return res
end

return {
  {
    "sindrets/diffview.nvim",
    ft = { "go", "java", "lua" },
    lazy = true,
    config = function()
      local actions = require("diffview.actions")
      require("diffview").setup({
        default_args = {
          DiffviewOpen = { "--imply-local" },
        },
        file_panel = {
          win_config = {
            type = "split",
            position = "left",
            width = 65,
          },
        },
        keymaps = {
          view = {
            {
              "n",
              "gh",
              actions.view_windo(function(layout_name, sym)
                if sym == "b" then
                  vim.cmd("norm! [c")
                end
              end),
            },
            {
              "n",
              "gl",
              actions.view_windo(function(layout_name, sym)
                if sym == "b" then
                  vim.cmd("norm! ]c")
                end
              end),
            },
          },
        },
        view = {
          default = {
            winbar_info = true,
          },
          -- file_history = {
          --   winbar_info = true,
          -- },
        },
        hooks = {
          diff_buf_win_enter = function()
            vim.opt_local.foldenable = false
          end,
          view_opened = function(view)
            -- Highlight 'DiffChange' as 'DiffDelete' on the left, and 'DiffAdd' on
            -- the right.
            local function post_layout()
              tbl_ensure(view, "winopts.diff2.a")
              tbl_ensure(view, "winopts.diff2.b")
              -- left
              view.winopts.diff2.a = tbl_union_extend(view.winopts.diff2.a, {
                winhl = {
                  "DiffChange:DiffAddAsDelete",
                  "DiffText:DiffDeleteText",
                },
              })
              -- right
              view.winopts.diff2.b = tbl_union_extend(view.winopts.diff2.b, {
                winhl = {
                  "DiffChange:DiffAdd",
                  "DiffText:DiffAddText",
                },
              })
            end

            view.emitter:on("post_layout", post_layout)
            post_layout()
          end,
        }, -- See ':h diffview-config-hooks'
      })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    ft = { "lua", "go", "cpp" },
    opts = {
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 550,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
    },
  },

  {
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup({
        picker = "snacks",
        ssh_aliases = {
          ["roger.github.com"] = "github.com",
          ["github.com-emu"] = "github.com",
        },
      })
    end,
  },
}
