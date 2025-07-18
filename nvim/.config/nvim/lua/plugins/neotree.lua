local contains = function(word, sub)
  return word:find(sub, 1, true) ~= nil
end
--
-- function string:startswith(start)
--   return self:sub(1, #start) == start
-- end

local endsWith = function(word, ending)
  return ending == '' or word:sub(-#ending) == ending
end

local getIcon = function(node, hl)
  if contains(node.name, 'test') then
    return '󰙨', 'NeoTreeCustomTest'
  end

  if contains(node.name, 'mock') then
    return '', 'NeoTreeCustomMock'
  end

  if node.ext == 'go' then
    return '', 'NeoTreeCustomCode'
  end

  local success, web_devicons = pcall(require, 'nvim-web-devicons')
  if success then
    return web_devicons.get_icon(node.name, node.ext)
  end
end

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = {
      window = {
        mappings = {
          ['<C-.>'] = 'open_vsplit',
          ['<C-,>'] = 'open_split',
        },
      },
    },
    config = function()
      local highlights = require 'neo-tree.ui.highlights'
      require('neo-tree').setup {
        default_component_configs = {
          name = {
            highlight_opened_files = true, -- Requires `enable_opened_markers = true`
          },
        },
        close_if_last_window = true,
        filesystem = {
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
          components = {
            icon = function(config, node, state)
              local icon = config.default or ' '
              local padding = config.padding or ' '
              local highlight = config.highlight or highlights.FILE_ICON

              if node.type == 'directory' then
                highlight = highlights.DIRECTORY_ICON
                if node:is_expanded() then
                  icon = config.folder_open or '-'
                  highlight = 'NeoTreeDirectoryOpen'
                else
                  icon = config.folder_closed or '+'
                end
              elseif node.type == 'file' then
                local devicon, hl = getIcon(node, highlight)
                icon = devicon or icon
                highlight = hl or highlight
              end

              return {
                text = icon .. padding,
                highlight = highlight,
              }
            end,
          },
        },
      }
    end,
  },
}
