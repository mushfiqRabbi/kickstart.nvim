return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    require('null-ls').setup {
      sources = {
        null_ls.builtins.diagnostics.cspell.with {
          disabled_filetypes = { 'lua' },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity['INFO']
          end,
        },
        null_ls.builtins.code_actions.cspell.with {
          disabled_filetypes = { 'lua' },
        },
      },
    }
  end,
}
