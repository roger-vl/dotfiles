local contains = function(word, sub)
  return word:find(sub, 1, true) ~= nil
end

return {
  'nvimtools/none-ls.nvim',
  enabled = true,
  lazy = true,
  dependencies = {
    'davidmh/cspell.nvim',
  },
  opts = function()
    local config = {
      cspell_config_dirs = { '~/.config/nvim/' },
    }
    local cspell = require 'cspell'
    local sources = {
      cspell.diagnostics.with {
        config = config,
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity['HINT']
        end,
      },
      cspell.code_actions.with {
        config = config,
      },
    }
    return {
      sources = sources,
      debounce = 5500,
      debug = false,
      should_attach = function(bufnr)
        local bufName = vim.api.nvim_buf_get_name(bufnr)
        if contains(bufName, '.go') then
          return true
        end
        if contains(bufName, '.md') then
          return true
        end
      end,
    }
  end,
}
