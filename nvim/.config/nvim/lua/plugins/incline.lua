local Path = require("plenary.path")

local function shorten_path(path, opts)
  opts = opts or {}
  local short_len = opts.short_len or 1
  local tail_count = opts.tail_count or 2
  local head_max = opts.head_max or 0
  local relative = opts.relative == nil or opts.relative
  local return_table = opts.return_table or false
  if relative then
    path = vim.fn.fnamemodify(path, ":.")
  end
  local components = vim.split(path, Path.path.sep)
  if #components == 1 then
    if return_table then
      return { nil, path }
    end
    return path
  end
  local tail = { unpack(components, #components - tail_count + 1) }
  local head = { unpack(components, 1, #components - tail_count) }
  if head_max > 0 and #head > head_max then
    head = { unpack(head, #head - head_max + 1) }
  end
  local result = {
    #head > 0 and Path.new(unpack(head)):shorten(short_len, {}) or nil,
    table.concat(tail, Path.path.sep),
  }
  if return_table then
    return result
  end
  return table.concat(result, Path.path.sep)
end

local function modified_suffix(buf)
  if vim.bo[buf].modified then
    return " [+]"
  else
    return ""
  end
end

local function get_git_diff(buf)
  local icons = { removed = " ", changed = " ", added = " " }
  local signs = vim.b[buf].gitsigns_status_dict
  local labels = {}
  if signs == nil then
    return labels
  end
  for name, icon in pairs(icons) do
    if tonumber(signs[name]) and signs[name] > 0 then
      table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
    end
  end
  if #labels > 0 then
    table.insert(labels, { "┊ " })
  end
  return labels
end

local function get_diagnostic_label(buf)
  local icons = { error = " ", warn = " ", info = " ", hint = "" }
  local label = {}

  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
    if n > 0 then
      table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
    end
  end
  if #label > 0 then
    table.insert(label, { "┊ " })
  end
  return label
end

local function shorten_path_styled(props, opts)
  local buf = props.buf
  local path = vim.api.nvim_buf_get_name(buf)
  opts = opts or {}
  -- local head_style = opts.head_style or {}
  local tail_style = opts.tail_style or {}
  local result = shorten_path(
    path,
    vim.tbl_extend("force", opts, {
      return_table = true,
    })
  )

  if props.focused then
    return {
      { "", guifg = "#393637" },
      { guibg = "#393637", modified_suffix(buf) },
      vim.list_extend({ guibg = "#393637" }, get_diagnostic_label(buf)),
      vim.list_extend({ guibg = "#393637" }, get_git_diff(buf)),
      vim.list_extend({ guifg = "#7F7F7F", guibg = "#393637" }, { result[1], "/" }) or "",
      vim.list_extend(tail_style, { result[2] }),
      { "", guifg = "#393637" },
    }
  end
  return {
    { "", guifg = "#393637" },
    vim.list_extend({ guifg = "#7F7F7F", guibg = "#393637" }, { result[1], "/" }) or "",
    vim.list_extend(tail_style, { result[2] }),
    { guibg = "#393637", modified_suffix(buf) },
    { "", guifg = "#393637" },
  }
end

return {
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    -- priority = 1200,
    config = function()
      require("incline").setup({
        window = {
          margin = {
            vertical = 0,
            horizontal = 0,
          },
          placement = {
            horizontal = "right",
            vertical = "top",
          },
          overlap = {
            winbar = false,
            borders = false,
            statusline = false,
            tabline = true,
          },
        },
        hide = {
          cursorline = false,
        },
        render = function(props)
          return shorten_path_styled(props, {
            short_len = 4,
            tail_count = 1,
            head_max = 2,
            head_style = { group = "Comment", guibg = "#393637" },
            tail_style = { guifg = "#EBE08B", guibg = "#393637" },
          })
        end,
      })
    end,
  },
}
