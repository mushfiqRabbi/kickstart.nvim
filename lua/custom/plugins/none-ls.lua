return {
  'nvimtools/none-ls.nvim',
  config = function()
    local cspell = require 'cspell'
    require('null-ls').setup {
      sources = {
        cspell.diagnostics.with {
          -- filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
          disabled_filetypes = { 'lua' },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity['INFO']
          end,
        },
        cspell.code_actions.with {
          -- filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
          disabled_filetypes = { 'lua' },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity['INFO']
          end,
        },
        -- cspell.code_actions,
      },
    }
  end,
}
