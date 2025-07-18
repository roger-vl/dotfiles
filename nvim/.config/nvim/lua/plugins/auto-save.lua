local excluded_filetypes = {
  'NvimTree',
  'Outline',
  'TelescopePrompt',
  'alpha',
  'dashboard',
  'gitcommit',
  'lazygit',
  'neo-tree',
  'oil',
  'prompt',
  'toggleterm',
  'neotest',
  'neotest-go',
  'lua',
  'mysql',
  'harpoon',
}

local excluded_filenames = {
  'plugins.lua',
  'auto-save.lua',
}

local save_condition = function(buf)
  local fn = vim.fn
  local utils = require 'auto-save.utils.data'

  if utils.not_in(fn.getbufvar(buf, '&filetype'), excluded_filetypes) and utils.not_in(fn.expand '%:t', excluded_filenames) then
    return true -- met condition(s), can save
  end
  return false -- can't save
end

local immediate_triggers = { 'BufLeave', 'FocusLost' } -- vim events that trigger auto-save. See :h events
local deferred_triggers = { 'InsertLeave', 'TextChanged' }

return {
  'okuuva/auto-save.nvim',
  event = vim.tbl_deep_extend('force', immediate_triggers, deferred_triggers),
  enabled = true,
  opts = {
    enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
    trigger_events = { -- See :h events
      immediate_save = immediate_triggers, -- vim events that trigger an immediate save
      defer_save = deferred_triggers, -- vim events that trigger a deferred save (saves after `debounce_delay`)
      cancel_deferred_save = { 'InsertEnter' }, -- vim events that cancel a pending deferred save
    },
    condition = save_condition,
    write_all_buffers = false, -- write all buffers when the current one meets `condition`
    noautocmd = true, -- do not execute autocmds when saving
    debounce_delay = 2000, -- saves the file at most every `debounce_delay` milliseconds
    callbacks = { -- functions to be executed at different intervals
      before_saving = nil, -- ran before doing the actual save
    },
  },
}
