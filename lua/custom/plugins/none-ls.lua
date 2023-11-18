return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    require('null-ls').setup {
      sources = {
        -- Diagnostics
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.cspell.with {
          disabled_filetypes = { 'lua', 'sh', 'oil' },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity['INFO']
          end,
        },

        -- Code Actions
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.code_actions.cspell.with {
          disabled_filetypes = { 'lua', 'sh', 'oil' },
        },
      },
    }
  end,
}
